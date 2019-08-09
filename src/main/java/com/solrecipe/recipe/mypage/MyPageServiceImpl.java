package com.solrecipe.recipe.mypage;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageMapper myPageMapper;

	@Override
	public ArrayList<MyVideoVO> getMarkedVideos(int user_num) {
		return myPageMapper.getMarkedVideos(user_num);
	}
	
	@Override
	public ArrayList<MyVideoVO> getMoreVideos(int user_num, int startNum) {
		return myPageMapper.getMoreVideos(user_num, startNum);
	}

}
