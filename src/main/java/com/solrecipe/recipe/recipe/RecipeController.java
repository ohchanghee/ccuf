package com.solrecipe.recipe.recipe;

import java.io.File;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;


@Controller
public class RecipeController {
	
	@Autowired
	private RecipeService service; 
	
	@RequestMapping(value = "/recipe_index", method = RequestMethod.GET)
	public String goToIndex_get() {
		return "recipe/recipe_index";
	}
	
	@RequestMapping(value = "/recipe_index", method = RequestMethod.POST)
	public String goToIndex_post(@RequestParam(value = "recipe_search",required = false) String recipe_search, RedirectAttributes rttr) {
		rttr.addFlashAttribute("MainSearch",recipe_search);
		return "redirect:/recipe_index";
	}
	
	@RequestMapping("/recipe_write")
	public String recipe_write() {
		return "recipe/recipe_write";
	}
	
	
	@PostMapping(value = "/insert_recipe")
	@ResponseBody
	public Object recipe_write_(MultipartHttpServletRequest request) {
		
		
		/*
		 
		  $.ajax({
				url : "/insert_recipe",
				data : s1,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(response) {
					console.log('success');
					console.log(response);
				},						
				error : function(jqXHR) {
							console.log('error');
				},				
			});
		  
		 */
		
		System.out.println("recipe_write");
		MultipartFile mainImg = request.getFile("mainimg");
		String cooking_title = request.getParameter("cooking_title");
		String cooking_main = request.getParameter("cooking_main");
		String cooking_sub = request.getParameter("cooking_sub");
		// 19/08/05 추가1. user_num 받아오기.
		int user_num = Integer.parseInt(request.getParameter("user_num"));
				
		String[] add_txt = request.getParameterValues("add_txt");
		List<MultipartFile> cooking_img = request.getFiles("img");
		
		System.out.println(cooking_title+" / "+cooking_main+" / "+cooking_sub);
		System.out.println(Arrays.toString(add_txt));
		cooking_img.forEach(s->System.out.println("파일 이름: "+s.getOriginalFilename()));
		
		
		
		
		//현재의 ContextPath를 String으로 구한다.
		String currentUriContext = ServletUriComponentsBuilder.fromCurrentContextPath().scheme("http").build().toUriString();//// 결과: http://localhost:8090 
		String uploadPath_main = "C:\\Project\\Recipe_Img\\Main_IMG\\";//메인이미지가 저장될 실제 위치		
		String uploadPath_cooking = "C:\\Project\\Recipe_IMG\\Cooking_IMG\\";//요리과정 사진을 저장할 실제 위치
		
		
		try {
			Long recipe_num = service.getRecipeNum();
			String originalFileExtension_main = mainImg.getOriginalFilename().substring(mainImg.getOriginalFilename().lastIndexOf("."));
			
			//Recipe_basicVO : recipe_num, recipe_title, recipe_img, recipe_food_main, recipe_food_suv, excel
			Recipe_basicVO basic = new Recipe_basicVO();
			basic.setRecipe_num(recipe_num);
			basic.setRecipe_title(cooking_title);
			// 19/08/05 추가2. user_num을 VO에 추가
			basic.setUser_num(user_num);
			
			String loadedName_main = recipe_num+originalFileExtension_main;
			
			basic.setRecipe_img(currentUriContext+"/Recipe_IMG/Main_IMG/"+loadedName_main);
			basic.setRecipe_food_main(cooking_main);
			basic.setRecipe_food_suv(cooking_sub);
			basic.setExcel(0);
			
			service.insertRecipe(basic);
			
			
			
			//Recipe_CookingVO : recipe_num, cooking_num, cooking_content, cooking_img
			for(int i = 0 ; i < cooking_img.size() ; i++) {
				
				MultipartFile loadedFile = cooking_img.get(i);
				
				Recipe_CookingVO cooking = new Recipe_CookingVO();
				cooking.setRecipe_num(recipe_num);
				cooking.setCooking_num(i+1L);
				cooking.setCooking_content(add_txt[i]);
				
				if(loadedFile.getOriginalFilename().equals("")||loadedFile.getSize()==0) {
					cooking.setCooking_img("");//null을 주면 에러가 나서 ""를 준다. --> DB에서는 null값이 들어가져있다.
					service.insertCooking(cooking);//setFile 안했으므로 cooking_img는 null을 보낸다.
				} else {
					String originalFileExtension_cooking = loadedFile.getOriginalFilename().substring(loadedFile.getOriginalFilename().lastIndexOf("."));
					String loadedName_cook = recipe_num+"_"+(i+1)+originalFileExtension_cooking;
					cooking.setCooking_img(currentUriContext+"/Recipe_IMG/Cooking_IMG/"+loadedName_cook);
					service.insertCooking(cooking);
					loadedFile.transferTo(new File(uploadPath_cooking+loadedName_cook));
				}
				
			}
			
			mainImg.transferTo(new File(uploadPath_main+loadedName_main));
			
		} catch (Exception e) {
			e.printStackTrace();
			return "bad";
		}
		
		return "good"; // 문자열 good 이 날라간다.
	}
	
	@PostMapping(value = "/modify_recipe")
	@ResponseBody
	public Object recipe_modify_(MultipartHttpServletRequest request) {
		
		System.out.println("recipe_modify");
		MultipartFile mainImg = request.getFile("mainimg");
		String cooking_title = request.getParameter("cooking_title");
		String cooking_main = request.getParameter("cooking_main");
		String cooking_sub = request.getParameter("cooking_sub");
		int excel = Integer.parseInt(request.getParameter("excel"));
		// 19/08/05 추가1. user_num 받아오기.
		int user_num = Integer.parseInt(request.getParameter("user_num"));
		
		System.out.println("user_num =" +user_num);
		String[] add_txt = request.getParameterValues("add_txt");
		List<MultipartFile> cooking_img = request.getFiles("img");
		
		System.out.println(cooking_title+" / "+cooking_main+" / "+cooking_sub);
		System.out.println(Arrays.toString(add_txt));
		cooking_img.forEach(s->System.out.println("파일 이름: "+s.getOriginalFilename()));
		
		
		
		
		//현재의 ContextPath를 String으로 구한다.
		String currentUriContext = ServletUriComponentsBuilder.fromCurrentContextPath().scheme("http").build().toUriString();//// 결과: http://localhost:8090 
		String uploadPath_main = "C:\\Project\\Recipe_Img\\Main_IMG\\";//메인이미지가 저장될 실제 위치		
		String uploadPath_cooking = "C:\\Project\\Recipe_IMG\\Cooking_IMG\\";//요리과정 사진을 저장할 실제 위치
		
		
		try {
			Long recipe_num = (long) Integer.parseInt(request.getParameter("recipe_num"));
			System.out.println("recipe_num = "+recipe_num);
			String originalFileExtension_main = mainImg.getOriginalFilename().substring(mainImg.getOriginalFilename().lastIndexOf("."));
			
			//Recipe_basicVO : recipe_num, recipe_title, recipe_img, recipe_food_main, recipe_food_suv, excel
			Recipe_basicVO basic = new Recipe_basicVO();
			basic.setRecipe_num(recipe_num);
			basic.setRecipe_title(cooking_title);
			// user_num과 excel을 VO에 추가
			basic.setUser_num(user_num);
			basic.setExcel(excel);
			
			String loadedName_main = recipe_num+originalFileExtension_main;
			
			basic.setRecipe_img(currentUriContext+"/Recipe_IMG/Main_IMG/"+loadedName_main);
			basic.setRecipe_food_main(cooking_main);
			basic.setRecipe_food_suv(cooking_sub);
			
			service.modifyRecipe(basic);
			
			
			// cooking을 추가하기 전에 기존의 cooking을 삭제
			int result = service.deleteCooking(recipe_num, excel);
			
			// 삭제 후 기본 로직과 동일하게 추가.
			if(result > 0) {
				//Recipe_CookingVO : recipe_num, cooking_num, cooking_content, cooking_img
				for(int i = 0 ; i < cooking_img.size() ; i++) {
					
					MultipartFile loadedFile = cooking_img.get(i);
					
					Recipe_CookingVO cooking = new Recipe_CookingVO();
					cooking.setRecipe_num(recipe_num);
					cooking.setCooking_num(i+1L);
					cooking.setCooking_content(add_txt[i]);
					
					if(loadedFile.getOriginalFilename().equals("")||loadedFile.getSize()==0) {
						cooking.setCooking_img("");//null을 주면 에러가 나서 ""를 준다. --> DB에서는 null값이 들어가져있다.
						service.insertCooking(cooking);//setFile 안했으므로 cooking_img는 null을 보낸다.
					} else {
						String originalFileExtension_cooking = loadedFile.getOriginalFilename().substring(loadedFile.getOriginalFilename().lastIndexOf("."));
						String loadedName_cook = recipe_num+"_"+(i+1)+originalFileExtension_cooking;
						cooking.setCooking_img(currentUriContext+"/Recipe_IMG/Cooking_IMG/"+loadedName_cook);
						service.insertCooking(cooking);
						loadedFile.transferTo(new File(uploadPath_cooking+loadedName_cook));
					}
					
				}
				
				mainImg.transferTo(new File(uploadPath_main+loadedName_main));
			}
			
			else {
				System.out.println("excel_cooking_recipe 삭제 실패!");
				return "bad";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return "bad";
		}
		
		return "good"; // 문자열 good 이 날라간다.
	}
	
	@GetMapping("/recipe_detail/{excel}/{recipe_num}")
	public String recipe_detail(@PathVariable("excel") Integer excel, @PathVariable("recipe_num") Long recipe_num,Model model) {
		
		System.out.println("excel: "+excel);
		System.out.println("recipe_num: "+recipe_num);
		
		Recipe_basicVO basic = service.getRecipeDetail(recipe_num, excel);
		List<Recipe_CookingVO> cooking_list = service.getCookingDetail(recipe_num, excel);
		
		System.out.println(basic);
		cooking_list.forEach(data -> System.out.println(data));
		
		model.addAttribute("basic",basic);
		model.addAttribute("cooking_list",cooking_list);
		
		return "recipe/recipe_detail";
	}
	
	
	
}












