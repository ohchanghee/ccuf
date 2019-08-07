package com.solrecipe.recipe.foodvideo;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface FoodVideoMapper {

	List<FoodVideoVO> getNewList();
	List<FoodVideoVO> getMoreNewlist(int startNum);
	FoodVideoVO getFVO(int video_num);
	List<FoodVideoVO> getPlayList(String playList);
	List<FoodVideoVO> getMorePlaylist(@Param("startNum") int startNum, @Param("playList") String playList);
	List<FoodVideoVO> getBestList();
	List<FoodVideoVO> getListWithSearch(Criteria cri);
	List<FoodVideoVO> getMoreSearchlist(@Param("startNum") int startNum, @Param("cri_search")String cri_search);
	int insertVideo(FoodVideoVO fvVO);
}
