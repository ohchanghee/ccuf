package com.solrecipe.recipe.recipe;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class RecipeService {
	
	@Setter(onMethod_ = @Autowired)
	private RecipeMapper mapper;
	
	public Long getRecipeNum() {
		return mapper.getRecipeNum();
	}
	
	public List<Recipe_basicVO> getAll_RECIPE_EXCEL(){
		return mapper.getAll_RECIPE_EXCEL();
	}
	
	public List<Recipe_basicVO> getAll_RECIPE(){
		return mapper.getAll_RECIPE();
	}
	
	public List<Recipe_basicVO> searchEXCEL_RECIPE(String[] ingredients){
		return mapper.searchEXCEL_RECIPE(ingredients);
	}
	
	
	public List<Recipe_basicVO> search_RECIPE(String[] ingredients){
		return mapper.search_RECIPE(ingredients);
	}
	
	public int insertRecipe(Recipe_basicVO basic) {
		return mapper.insertRecipe(basic);
	}
	
	public int insertCooking(Recipe_CookingVO cooking) {
		return mapper.insertCooking(cooking);
	}

	public int modifyRecipe(Recipe_basicVO basic) {
		return mapper.modifyRecipe(basic);
	}
	
	public int deleteCooking(long recipe_num, int excel) {
		return mapper.deleteCooking(recipe_num, excel);
	}
	public Recipe_basicVO getRecipeDetail(Long recipe_num,Integer excel) {
			
		Recipe_basicVO vo = mapper.getRecipeDetail(recipe_num, excel);
		
		String recipe_food_main = vo.getRecipe_food_main();
		String[] main_Array = recipe_food_main.split(",");
		recipe_food_main = "";
		for (String string : main_Array) {
			recipe_food_main += string+", ";
		}
		vo.setRecipe_food_main(recipe_food_main.substring(0,recipe_food_main.length()-2));
		
		
		if(!(vo.getRecipe_food_suv() == null || vo.getRecipe_food_suv().length()==0)) { 
			
			String recipe_food_suv = vo.getRecipe_food_suv();
			String[] suv_Array = recipe_food_suv.split(",");
			recipe_food_suv = "";
			for (String string : suv_Array) {
				recipe_food_suv += string+", ";
			}
			vo.setRecipe_food_suv(recipe_food_suv.substring(0,recipe_food_suv.length()-2));
			
		} else {
			vo.setRecipe_food_suv("없음");
		}
		
		return vo;
		
	}
	
	public List<Recipe_CookingVO> getCookingDetail(Long recipe_num,Integer excel) {
		return mapper.getCookingDetail(recipe_num, excel);
	}
	
	public static void main(String[] args) {
		String wow = "쌀,안심,콩나물,청포묵,미나리,숙주,도라지,고사리,계란,";
		String[] split = wow.split(",");
		System.out.println(Arrays.toString(split));
		String sum = "";
		for (String string : split) {
			sum+= string+", ";
		}
		System.out.println(sum.substring(0,sum.length()-2));
		
	}
}
