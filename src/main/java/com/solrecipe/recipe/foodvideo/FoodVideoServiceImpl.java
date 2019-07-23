package com.solrecipe.recipe.foodvideo;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class FoodVideoServiceImpl implements FoodVideoService{

//	@Autowired
//	private SqlSession sqlSession; 
	

	@Setter(onMethod_= @Autowired)
	private FoodVideoMapper foodVideoMapper;
	
	@Override
	public List<FoodVideoVO> getNewList() {
		return foodVideoMapper.getNewList();
	}

	@Override
	public List<FoodVideoVO> getMoreNewlist(int startNum) {
		return foodVideoMapper.getMoreNewlist(startNum);
	}
	
	@Override
	public FoodVideoVO getFVO(int video_num) {
		return foodVideoMapper.getFVO(video_num);
	}

	@Override
	public List<FoodVideoVO> getPlayList(String playList) {
		return foodVideoMapper.getPlayList(playList);
	}

	@Override
	public List<FoodVideoVO> getMorePlaylist(int startNum, String playList) {
//		HashMap<String, Object> hm = new HashMap<String, Object>();
//		hm.put("startNum", startNum);
//		hm.put("playList", playList);
//		return foodVideoMapper.getMoreList(hm);
		return foodVideoMapper.getMorePlaylist(startNum, playList);
	}

	@Override
	public List<FoodVideoVO> getBestList() {
		return foodVideoMapper.getBestList();
	}

	@Override
	public List<FoodVideoVO> search_list(Criteria cri) {
		return foodVideoMapper.getListWithSearch(cri);
	}

	@Override
	public List<FoodVideoVO> getMoreSearchlist(int startNum, Criteria cri) {
		String cri_search = cri.getRecipe_search();
		return foodVideoMapper.getMoreSearchlist(startNum, cri_search);
	}
}
