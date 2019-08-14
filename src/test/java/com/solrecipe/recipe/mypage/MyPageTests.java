package com.solrecipe.recipe.mypage;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.solrecipe.recipe.recipe.Recipe_basicVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security/security-context.xml"})
public class MyPageTests {
	
	@Autowired
	MyPageMapper myMapper;
	
	@Test
	public void Exist() {
		assertNotNull(myMapper);
		System.out.println(myMapper);
	}
	
	@Test
	public void getMarkedRecipes() {
		System.out.println("-----------------------getMarkedRecipes-----------------------");
		ArrayList<Recipe_basicVO> list = myMapper.getMarkedRecipes(5);
		list.forEach(s->System.out.println(s));
	}
	
	@Test
	public void getMoreRecipes() {
		System.out.println("-----------------------getMoreRecipes-----------------------");
		ArrayList<Recipe_basicVO> list = myMapper.getMoreRecipes(5, 6);
		list.forEach(s->System.out.println(s));
	}
}


