package com.solrecipe.recipe.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.mapping.MappableAttributesRetriever;
import org.springframework.stereotype.Service;

import com.solrecipe.recipe.chat.AdminChatRoomVO;
import com.solrecipe.recipe.chat.AdminChatVO;
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

	@Override
	public List<AdminChatRoomVO> getChatRoomList(int page, String keyword) {
		int startNum = (page-1)*15;
		return adminMapper.getChatRoomList(startNum, keyword);
	}

	@Override
	public int getChatRoomCnt(String keyword) {
		return adminMapper.getChatRoomCnt(keyword);
	}

	@Override
	public List<AdminChatVO> getChattingList(int chatroom_num) {
		return adminMapper.getChattingList(chatroom_num);
	}

	@Override
	public int deleteChatRoom(int chatroom_num,String type) {
		return adminMapper.deleteChatRoom(chatroom_num, type);
	}
	
	
	
}
