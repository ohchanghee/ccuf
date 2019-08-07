package com.solrecipe.recipe.admin;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.solrecipe.recipe.chat.AdminChatRoomVO;
import com.solrecipe.recipe.chat.AdminChatVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;
	
//	@Test
//	public void exist() {
//		assertNotNull(mapper);
//	}
	
//	@Test
//	public void getChatListCount() {
//		System.out.println("검색  keyword : \"\" : "+mapper.getChatRoomCnt(""));
//		System.out.println("검색  keyword : ㄴㅇㄹ : "+mapper.getChatRoomCnt("ㄴㅇㄹ"));
//		
//	}
	
//	@Test
//	public void getChatList() {
//		int startNum = 0;
//		String keyword = "ㄴㅇㄹ";
//		List<AdminChatRoomVO> vo = mapper.getChatRoomList(startNum, keyword);
//		vo.forEach(s->System.out.println(s));
//	}

	@Test
	public void getChattingList() {
		List<AdminChatVO> vo = mapper.getChattingList(14);
		vo.forEach(s->System.out.println(s));
	}
}
