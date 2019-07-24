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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;


@Controller
public class RecipeController {
	
	@Autowired
	private RecipeService service; 
	
	@RequestMapping("/recipe_index")
	public String goToIndex() {
		return "recipe/recipe_index";
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












