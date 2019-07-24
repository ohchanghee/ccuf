package com.solrecipe.recipe.recipe;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class RecipeMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private RecipeMapper mapper;
	
	
	/*
	@Test
	public void getAll_RECIPE_XML() {
		List<Recipe_basicVO> list = mapper.getAll_RECIPE_XML();
		list.forEach(what -> log.info(what));
	}
	*/
	
	/*
	@Test
	public void getAll_RECIPE() {
		List<Recipe_basicVO> list = mapper.getAll_RECIPE();
		list.forEach(what -> log.info(what));
	}
	*/
	
	
	/*
	@Test
	public void getSearchTest() {
		String[] ingredients = {};
		List<Recipe_basicVO> list = mapper.searchEXCEL_RECIPE(ingredients);
		System.out.println("list: "+list+"\nlist size: "+list.size());//검석하는 것이 존재하지 않으면 빈 리스트를 반환한다.
		list.forEach(what->log.info(what));
	}
	*/
	
	/*
	@Test
	public void searchEXCEL_RECIPE() {
		String[] ingredients = {"감자"};
		List<Recipe_basicVO> list = mapper.searchEXCEL_RECIPE(ingredients);
		System.out.println("list: "+list+"\nlist size: "+list.size());//검석하는 것이 존재하지 않으면 빈 리스트를 반환한다.
		list.forEach(what->log.info(what));
	}
	*/
	
	/*
	@Test
	public void search_RECIPE() {
		String[] ingredients = {"김치"};
		List<Recipe_basicVO> list = mapper.search_RECIPE(ingredients);
		System.out.println("list: "+list+"\nlist size: "+list.size());//검석하는 것이 존재하지 않으면 빈 리스트를 반환한다.
		list.forEach(what->log.info(what));
	}
	*/
	
	/*
	@Test
	public void insertRecipe() {
		Recipe_basicVO basic = new Recipe_basicVO();
//		basic.setRecipe_num(1L);
		basic.setRecipe_title("라면볶음밥");
		basic.setRecipe_img("http://localhost:8090");
		basic.setRecipe_food_main("밥,김치,참기름,");
		basic.setRecipe_food_suv("");
		basic.setExcel(0);
		
		
			mapper.insertRecipe(basic);
		
		
		System.out.println(basic.getRecipe_num());
	}
	*/
	
	/*
	@Test 
	public void insertCooking() {
		Recipe_CookingVO cooking = new Recipe_CookingVO();
		cooking.setCooking_num(1L);
		cooking.setCooking_img("http://localhost:8090/Recipe/Cooking_IMG/cooking_1");
		cooking.setCooking_content("1.라면스프를 따로 두고, 냄비에 라면을 끓입니다");
		
		mapper.insertCooking(cooking);
		
		System.out.println(cooking.getRecipe_num());
	}
	*/
	
	
//	@Test
//	public void countRecipe() {
//		System.out.println(mapper.getRecipeNum());
//	}
	
	/*
	@Test
	public void getRecipeDetail() {
		//180344,1
		//1,0
		Recipe_basicVO vo = mapper.getRecipeDetail(1L,0);
		System.out.println(vo);
		String ss = "ssss,ttt,dd,s,";
		System.out.println(ss.substring(0,ss.length()-1));
	}
	*/
	
	
//	@Test
//	public void getCookingDetail() {
//		
//		List<Recipe_CookingVO> cooking  = mapper.getCookingDetail(1L, 1);
//		cooking.forEach(s -> System.out.println(s));
//		
//	}
	
	
}
