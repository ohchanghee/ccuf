package com.solrecipe.recipe.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solrecipe.recipe.foodvideo.FoodVideoVO;
import com.solrecipe.recipe.recipe.Recipe_basicVO;

import lombok.Setter;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Setter(onMethod_= @Autowired)
	private AdminMapper adminMapper;
	
	@Override
	public int getTotalCnt(String whichPage) {
		return adminMapper.getTotalCnt(whichPage);
	}

	@Override
	public int getSearchedCnt(String whichPage, String keyword) {
		return adminMapper.getSearchedCnt(whichPage, keyword);
	}

	@Override
	public List<Recipe_basicVO> getRecipeList(int page) {
		int startNum = (page-1)*15;
		return adminMapper.getRecipeList(startNum);
	}

	@Override
	public List<Recipe_basicVO> getSearchedRecipeList(int page, String keyword) {
		int startNum = (page-1)*15;
		return adminMapper.getSearchedRecipeList(startNum, keyword);
	}
	
	@Override
	public int deleteRecipe(int excel, int recipe_num) {	
		int result1 = adminMapper.deleteRecipeBasic(excel, recipe_num);
		int result2 = adminMapper.deleteRecipeCooking(excel, recipe_num);
		return result1+result2;
	}
	
	@Override
	public List<FoodVideoVO> getFoodVideoList(int page) {
		int startNum = (page-1)*15;
		return adminMapper.getFoodVideoList(startNum);
	}

	@Override
	public List<FoodVideoVO> getSearchedFoodVideoList(int page, String keyword) {
		int startNum = (page-1)*15;
		return adminMapper.getSearchedFoodVideoList(startNum, keyword);
	}
	
	@Override
	public int deleteFoodVideo(int videoNum) {
		return adminMapper.deleteFoodVideo(videoNum);
	}

}
