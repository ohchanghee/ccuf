package com.solrecipe.recipe.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.solrecipe.recipe.foodvideo.FoodVideoVO;
import com.solrecipe.recipe.recipe.Recipe_basicVO;

public interface AdminMapper {
	int getTotalCnt(@Param("whichPage")String whichPage);
	int getSearchedCnt(@Param("whichPage")String whichPage, @Param("keyword")String keyword);
	
	List<Recipe_basicVO> getRecipeList(@Param("startNum")int startNum);
	List<Recipe_basicVO> getSearchedRecipeList(@Param("startNum")int startNum, @Param("keyword")String keyword);
	
	//차후에 트리거로 둘 다 삭제되게하면 참 좋을듯.
	int deleteRecipeBasic(@Param("excel")int excel, @Param("recipe_num")int recipeNum);
	int deleteRecipeCooking(@Param("excel")int excel, @Param("recipe_num")int recipeNum);
	
	List<FoodVideoVO> getFoodVideoList(@Param("startNum")int startNum);
	List<FoodVideoVO> getSearchedFoodVideoList(@Param("startNum")int startNum, @Param("keyword")String keyword);
	int deleteFoodVideo(int videoNum);
}
