package com.solrecipe.recipe.mypage;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface MyPageMapper {
	ArrayList<MyVideoVO>getMarkedVideos(@Param("userNum")int user_num);
	ArrayList<MyVideoVO>getMoreVideos(@Param("userNum")int user_num, @Param("startNum")int startNum);
}
