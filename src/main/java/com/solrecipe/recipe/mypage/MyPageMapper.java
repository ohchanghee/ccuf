package com.solrecipe.recipe.mypage;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.solrecipe.recipe.user.domain.MemberVO;

public interface MyPageMapper {
	ArrayList<MyVideoVO>getMarkedVideos(@Param("userNum")int user_num);
	ArrayList<MyVideoVO>getMoreVideos(@Param("userNum")int user_num, @Param("startNum")int startNum);
	int modifyPW(@Param("userNum")int userNum, @Param("userPW")String userPW);
	int updateProfile_tb(@Param("userNum")int userNum, @Param("userIntro")String userIntro, @Param("userImg")String userImg, @Param("isOpen")int isOpen);
	int updateDetail_tb(@Param("userNum")int userNum, @Param("userNickname")String userNickname, @Param("userName")String userName);
	int checkNickname(@Param("userNickname")String userNickname);
	String getENPW(@Param("userNum")int userNum);
}
