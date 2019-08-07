package com.solrecipe.recipe.recipe;

import java.sql.Date;

import com.solrecipe.recipe.user.domain.MemberVO;

import lombok.Data;

@Data
public class Recipe_basicVO {
	
	Long recipe_num;		//레시피 번호
	String recipe_title;	//레시피 타이틀
	int user_num;	// 08/05 추가 -> 등록한 유저 넘버(관리자는 -1)
	String recipe_img;		//레시피 대표 이미지 URL
	Date firstdate;			//게시한 날짜
	Date updatedate;		//수정한 날짜
	String recipe_food_main;//주재료 
	String recipe_food_suv;//부재료
	int excel;				//xml에서 읽어들인건지 아닌지를 구별
	MemberVO memberVO; // 08/05 추가 -> 닉네임 저장을 위한 변수
}
