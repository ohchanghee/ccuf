package com.solrecipe.recipe.mypage;

import java.util.ArrayList;

public interface MyPageService {
	ArrayList<MyVideoVO>getMarkedVideos(int user_num);
	ArrayList<MyVideoVO>getMoreVideos(int user_num, int startNum);
}
