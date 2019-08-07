package com.solrecipe.recipe.admin;

import java.util.List;

import com.solrecipe.recipe.chat.AdminChatRoomVO;
import com.solrecipe.recipe.chat.AdminChatVO;
import com.solrecipe.recipe.foodvideo.FoodVideoVO;
import com.solrecipe.recipe.recipe.Recipe_CookingVO;
import com.solrecipe.recipe.recipe.Recipe_basicVO;

public interface AdminService {
	int getTotalCnt(String whichPage);
	int getSearchedCnt(String whichPage, String keyword);
	
	List<Recipe_basicVO> getRecipeList(int page);
	List<Recipe_basicVO> getSearchedRecipeList(int page, String keyword);
	Recipe_basicVO getRecipeDetail(Long recipe_num, int excel);
	List<Recipe_CookingVO> getCookingDetail(Long recipe_num, int excel);
	int deleteRecipe(int excel, int recipe_num);
	
	List<FoodVideoVO> getFoodVideoList(int page);
	List<FoodVideoVO> getSearchedFoodVideoList(int page, String keyword);
	int deleteFoodVideo(int videoNum);

	
	//admin_chat 관련 , 마감된 방만 읽어온다( =>  chat_status = 0 인 row들! )
	List<AdminChatRoomVO> getChatRoomList(int startNum, String keyword);
	List<AdminChatVO> getChattingList(int chatroom_num);
	int getChatRoomCnt(String keyword);
	int deleteChatRoom(int chatroom_num,String type);
	
	
}
