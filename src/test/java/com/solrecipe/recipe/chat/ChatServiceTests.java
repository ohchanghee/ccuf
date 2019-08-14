package com.solrecipe.recipe.chat;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security/security-context.xml"})
@Log4j
public class ChatServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private ChatService service;
	
	/*
	@Test
	public void notNull() {
		assertNotNull(service);
		System.out.println(service);
	}
	
	@Test
	public void insert_ChatRoom_And_User() {
		
		Integer select = 0;
		ChatRoomVO vo = new ChatRoomVO();
		vo.setUser_num(1);
		vo.setChat_title("무랑 바꿉니다 선제염");
		vo.setChat_maxmember(3);
		vo.setChat_address("경기도 의왕시 내손동");
		service.insertChatRoom(vo, select);
		
		log.info("user_num: "+vo.getUser_num());
		log.info("chatroom_num: "+vo.getChatroom_num());
		
		ChatUserVO vo2 = new ChatUserVO();
		vo2.setChatroom_num(vo.getChatroom_num());
		vo2.setUser_num(vo.getUser_num());
		service.insertUser(vo2, select);
		
		service.deleteChatRoom(vo.getChatroom_num(), select);
		
		
	}
	*/
	
	
	@Test
	public void transactionTest() {
		
		Integer select = 0;
		ChatRoomVO vo = new ChatRoomVO();
		vo.setUser_num(2);
		vo.setChat_title("FOR TEST TITLE!!!");
		vo.setChat_maxmember(3);
		vo.setChat_address("FOR TEST ADDRESS!!!");
		int i = service.makeChatRoom(vo, select);

		System.out.println(i);
		
		
	}
	
	
}
