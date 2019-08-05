package com.solrecipe.recipe.admin;

import java.util.List;

import com.solrecipe.recipe.foodvideo.FoodVideoVO;
import com.solrecipe.recipe.recipe.Recipe_basicVO;

public interface AdminService {
	int getTotalCnt(String whichPage);
	int getSearchedCnt(String whichPage, String keyword);
	
	List<Recipe_basicVO> getRecipeList(int page);
	List<Recipe_basicVO> getSearchedRecipeList(int page, String keyword);
	int deleteRecipe(int excel, int recipe_num);
	
	List<FoodVideoVO> getFoodVideoList(int page);
	List<FoodVideoVO> getSearchedFoodVideoList(int page, String keyword);
	int deleteFoodVideo(int videoNum);
	
}
