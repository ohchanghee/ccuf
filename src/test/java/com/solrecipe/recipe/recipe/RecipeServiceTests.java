package com.solrecipe.recipe.recipe;

import static org.junit.Assert.assertNotNull;

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
public class RecipeServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private RecipeService service;
	
	@Test
	public void notNull() {
		assertNotNull(service);
		System.out.println(service);
	}
	
	@Test
	public void getAll_RECIPE_EXCEL() {
		List<Recipe_basicVO> list = service.getAll_RECIPE_EXCEL();
		list.forEach(what -> log.info(what));
	}
	
}
