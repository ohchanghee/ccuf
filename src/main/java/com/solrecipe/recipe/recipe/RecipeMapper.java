package com.solrecipe.recipe.recipe;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface RecipeMapper {
	
	public Long getRecipeNum();

	public List<Recipe_basicVO> getAll_RECIPE_EXCEL();

	public List<Recipe_basicVO> getAll_RECIPE();
	
	public List<Recipe_basicVO> searchEXCEL_RECIPE(@Param("ingredients") String[] ingredients);
	
	public List<Recipe_basicVO> search_RECIPE(@Param("ingredients") String[] ingredients);
	
	public int insertRecipe(Recipe_basicVO basic);
	
	public int insertCooking(Recipe_CookingVO cooking);
	
	public Recipe_basicVO getRecipeDetail(@Param("recipe_num") Long recipe_num,@Param("excel") Integer excel);
	
	public List<Recipe_CookingVO> getCookingDetail(@Param("recipe_num") Long recipe_num,@Param("excel") Integer excel);

}
