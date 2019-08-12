package com.solrecipe.recipe.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.solrecipe.recipe.chat.AdminChatRoomVO;
import com.solrecipe.recipe.chat.AdminChatVO;
import com.solrecipe.recipe.foodvideo.FoodVideoVO;
import com.solrecipe.recipe.recipe.Recipe_CookingVO;
import com.solrecipe.recipe.recipe.Recipe_basicVO;

@Controller
public class AdminController {
	
	@Autowired
	AdminServiceImpl adminService;
	
	@GetMapping("/admin_index")
	public String admin_index(){
		return "/admin/admin_index";
	}
	
	@GetMapping("/admin_recipe")
	public String admin_recipe(@RequestParam(value = "page", defaultValue="1")int page, Model model){
		
		Paging paging = new Paging(15, 10, page, adminService.getTotalCnt("recipe"));
		ArrayList<Recipe_basicVO> recipeList = (ArrayList<Recipe_basicVO>) adminService.getRecipeList(paging.page);
		
		model.addAttribute("totalPosts", paging.totalPosts);
		model.addAttribute("recipeList", recipeList);
		model.addAttribute("page", paging.page);
		model.addAttribute("startPage", paging.startPage);
		model.addAttribute("endPage", paging.endPage);
		model.addAttribute("totalPage", paging.totalPage);
		
		return "/admin/admin_recipe";
	}
	
	@GetMapping("/admin_searchrecipe")
	public String admin_searchrecipe(@RequestParam(value = "page", defaultValue="1")int page, String search, Model model){
		
		// 페이징
		Paging paging = new Paging(15, 10, page, adminService.getSearchedCnt("recipe", search));
		ArrayList<Recipe_basicVO> recipeList = (ArrayList<Recipe_basicVO>) adminService.getSearchedRecipeList(paging.page, search);
		model.addAttribute("totalPosts", paging.totalPosts);
		model.addAttribute("recipeList", recipeList);
		model.addAttribute("page", paging.page);
		model.addAttribute("startPage", paging.startPage);
		model.addAttribute("endPage", paging.endPage);
		model.addAttribute("totalPage", paging.totalPage);
		// 검색 내용을 추가.
		model.addAttribute("search", search);
		
		return "/admin/admin_recipe";
	}
	
	@GetMapping("/admin_recipe_delete")
	public String admin_recipe_delete(int excel, int recipe_num, int page, String search, RedirectAttributes rttr){
		int result = adminService.deleteRecipe(excel, recipe_num);
		rttr.addFlashAttribute("isDeleted", result);
		rttr.addAttribute("page", page);
		// 참고 - redirect의 경우 url이 두 번 호출된다. 그러므로 string의 경우에는 ?파라미터로 전달할 수 없다.
		if(!(search.equals(""))) {
			rttr.addAttribute("search", search);
			return "redirect:/admin_searchrecipe";
		}
		return "redirect:/admin_recipe";
	}
	
	@GetMapping("/admin_recipe_write")
	public String admin_recipe_write(){
		return "/admin/admin_recipe_write";
	}
	
	@GetMapping("/admin_recipe_modify")
	public String admin_recipe_modify(int excel, Long recipe_num, Model model) {
		Recipe_basicVO basic = adminService.getRecipeDetail(recipe_num, excel);
		List<Recipe_CookingVO> cooking_list = adminService.getCookingDetail(recipe_num, excel);
		
		System.out.println(basic);
		cooking_list.forEach(data -> System.out.println(data));
		
		model.addAttribute("basic",basic);
		model.addAttribute("cooking_list",cooking_list);
		
		return "admin/admin_recipe_modify";
	}
	
	
	@GetMapping("/admin_foodvideo")
	public String admin_foodvideo(@RequestParam(value = "page", defaultValue="1")int page, Model model){
		
		// 페이징
//		int listCnt = 15;
//		int pageCnt = 10;
//		int totalPosts = adminService.getTotalCnt("fv");
//		int totalPage = totalCnt/listCnt+1;
//		
//		if (page > totalPage){
//			page = totalPage;
//		}
//		int startPage = ((page - 1) / pageCnt) * pageCnt + 1;
//		
//		int endPage = startPage + pageCnt - 1;
//		if (endPage > totalPage) {
//			endPage = totalPage;
//		}
		
		// 하나의 페이지에 게시글 개수 / 총 보여질 페이지 번호 / 현재 페이지 / 총 게시글 개수
		Paging paging = new Paging(15, 10, page, adminService.getTotalCnt("fv"));
		ArrayList<FoodVideoVO> foodvideoList = (ArrayList<FoodVideoVO>) adminService.getFoodVideoList(paging.page);
		
		model.addAttribute("totalPosts", paging.totalPosts);
		model.addAttribute("foodvideoList", foodvideoList);
		model.addAttribute("page", paging.page);
		model.addAttribute("startPage", paging.startPage);
		model.addAttribute("endPage", paging.endPage);
		model.addAttribute("totalPage", paging.totalPage);
		
		return "/admin/admin_foodvideo";
	}
	
	
	@GetMapping("/admin_searchfoodvideo")
	public String admin_searchFoodVideo(@RequestParam(value = "page", defaultValue="1")int page, String search, Model model){
		
		// 페이징
		Paging paging = new Paging(15, 10, page, adminService.getSearchedCnt("fv", search));
		ArrayList<FoodVideoVO> foodvideoList = (ArrayList<FoodVideoVO>) adminService.getSearchedFoodVideoList(paging.page, search);
		model.addAttribute("totalPosts", paging.totalPosts);
		model.addAttribute("foodvideoList", foodvideoList);
		model.addAttribute("page", paging.page);
		model.addAttribute("startPage", paging.startPage);
		model.addAttribute("endPage", paging.endPage);
		model.addAttribute("totalPage", paging.totalPage);
		// 검색 내용을 추가.
		model.addAttribute("search", search);
		
		return "/admin/admin_foodvideo";
	}
	
	@GetMapping("/admin_foodvideo_delete")
	public String admin_foodvideo_delete(int video_num, int page, String search, RedirectAttributes rttr){
		int result = adminService.deleteFoodVideo(video_num);
		rttr.addFlashAttribute("isDeleted", result);
		rttr.addAttribute("page", page);
		// 참고 - redirect의 경우 url이 두 번 호출된다. 그러므로 string의 경우에는 ?파라미터로 전달할 수 없다.
		if(!(search.equals(""))) {
			rttr.addAttribute("search", search);
			return "redirect:/admin_searchfoodvideo";
		}
		return "redirect:/admin_foodvideo";
	}
	
	@GetMapping("/admin_chat")
	public String admin_chat(@RequestParam(value = "page", defaultValue="1")int page, @RequestParam(value="search" ,defaultValue = "")String search, Model model){
		
		Paging paging = new Paging(15, 10, page, adminService.getChatRoomCnt(search));
		List<AdminChatRoomVO> chatroomList = adminService.getChatRoomList(paging.page, search);
		
		/*
		chatroomList.forEach(s->System.out.println(s));
		System.out.println(paging.page);
		System.out.println(paging.startPage);
		System.out.println(paging.endPage);
		System.out.println(paging.totalPage);
		*/
		
		model.addAttribute("totalPosts", paging.totalPosts);
		model.addAttribute("chatroomList", chatroomList);
		model.addAttribute("page", paging.page);
		model.addAttribute("startPage", paging.startPage);
		model.addAttribute("endPage", paging.endPage);
		model.addAttribute("totalPage", paging.totalPage);
		model.addAttribute("search",search);
		
		return "/admin/admin_chat";
		
	}
	
	@GetMapping("/admin_chat_delete")
	public String admin_chat_delete(int chatroom_num, int page, @RequestParam(value="search" ,defaultValue = "") String search,
									@RequestParam("type")String type,RedirectAttributes rttr) {
		System.out.println("채팅방 삭제하기~");
		
		System.out.println("chatroom_num: "+chatroom_num);
		System.out.println("search: "+search);
		System.out.println("type: " +type);
		
		int result = adminService.deleteChatRoom(chatroom_num, type);
		rttr.addFlashAttribute("isDeleted", result);
		rttr.addAttribute("page", page);
		
		if(!(search.equals(""))) {
			rttr.addAttribute("search", search);
			return "redirect:/admin_chat";
		}
		
		return "redirect:/admin_chat";
	}
	
	@PostMapping(value = "/getChatting", produces = MediaType.APPLICATION_JSON_UTF8_VALUE) 
	@ResponseBody
	public Object getChatting(@RequestParam(value = "chatroom_num") int chatroom_num) {
		
		List<AdminChatVO> vo = adminService.getChattingList(chatroom_num);
		return vo;
		
	}
	
	/*
	@GetMapping("/admin_chatting")
	public String admin_chatting(){
		return "/admin/admin_chatting";
	}
	*/
	
	@GetMapping("/admin_message")
	public String admin_message(){
		return "/admin/admin_message";
	}
	
	@GetMapping("/admin_msg")
	public String admin_msg(){
		return "/admin/admin_msg";
	}
	
	@GetMapping("/admin_users")
	public String admin_users(){
		return "/admin/admin_users";
	}
	
	

	//excel = 0 일 때만 이 메서드가 호출된다.
	public boolean deleteFile(int recipe_num) {
		
		boolean result = false;
		File file =  null;
		File file2 = null;
		File[] list= null;
		String recipeNum = Integer.toString(recipe_num);
		
		
		try {
			file = new File("c:\\Project\\Recipe_IMG\\Main_IMG");
			file2 = new File("c:\\Project\\Recipe_IMG\\Cooking_IMG");
			
			if(file.isDirectory() && file2.isDirectory()) {
				
				list  = file.listFiles((dir,name)->{
					String[] imgNames = name.split("\\.");
					return imgNames[0].equals(recipeNum);
				});
				
				for(File _file : list) {
					_file.delete();
				}
				
				list = file2.listFiles((dir,name)->{
					String[] imgNames = name.split("_");
					return imgNames[0].equals(recipeNum);
				});
				
				for(File _file : list) {
					_file.delete();
				}
				
			}
			
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
