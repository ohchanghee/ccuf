package com.solrecipe.recipe.chat;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import com.solrecipe.recipe.user.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ChatMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private ChatMapper mapper;
	
	
	@Autowired
	private PlatformTransactionManager manager;
	
	/*
	@Test 
	public void newInsertUserTest() {
		ChatUserVO vo2 = new ChatUserVO();
		vo2.setChatroom_num(1);
		vo2.setUser_num(2);
		int test1 = mapper.insertUser(vo2,0);
		
		vo2  = new ChatUserVO();
		vo2.setChatroom_num(1);
		vo2.setUser_num(2);
		int test2 = mapper.insertUser(vo2,0);
		
		System.out.println("test1: "+test1+" / test2: "+test2);
		//test1은 1, test2가 0이면 성공이다.
		//같은 채팅방에 같은 user_num이 있으면 insert가 안되는 것을 보기 위함이다.
	}
	*/
	
	
	/*
	@Test 
	public void getChatUsers() {
		
	}
	
	@Test
	public void getChatRoomDetail() {
		
	}
	*/
	
//	
//	@Test
//	public void insertChangeUser() {
//		
//		
//		//트래잭션 처리 꼭해주기
//		ChatRoomVO vo = null;
//		
//		TransactionStatus status =  manager.getTransaction(new DefaultTransactionDefinition());
//		try {
//			vo = new ChatRoomVO();
//			vo.setUser_num(2);
//			vo.setChat_title("for Test!!!");
//			vo.setChat_maxmember(3);
//			vo.setChat_address("for Test Address!!!");
//			mapper.insertChatRoom(vo,0);
//			
//			
//			/*
//			 	-- 트리거 생성! 이제 연속해서 insert를 일일이 코드하지 않아도 된다.
//			 	
//			  	CREATE OR REPLACE TRIGGER make_chat_user_tb 
//				AFTER INSERT ON CHANGE_TB FOR EACH ROW 
//				BEGIN 
//				INSERT INTO change_user_tb(user_num, chatroom_num) values(:NEW.user_num, :NEW.chatroom_num);
//				END;
//				/
//			 
//			 */
////			ChatUserVO vo2 = new ChatUserVO();
////			vo2.setChatroom_num(vo.getChatroom_num());
////			vo2.setUser_num(vo.getUser_num());
////			mapper.insertUser(vo2,0);
////			System.out.println(vo2);
//			manager.commit(status);
//		} catch (Exception e) {
//			e.printStackTrace();
//			manager.rollback(status);
//		}
//		
//		System.out.println("user_num: " +vo.getUser_num());
//		System.out.println("chatroom_num: "+vo.getChatroom_num());
////		mapper.deleteChatRoom(vo.getChatroom_num(), 0);//초기화
//		
//		
//	}
//	
	
	
	/*
	@Test
	public void transactionTemplateTest() {
		ChatRoomVO vo = new ChatRoomVO();
		vo.setUser_num(1);
		vo.setChat_title("무랑 바꿉니다 선제염");
		vo.setChat_maxmember(3);
		vo.setChat_address("경기도 의왕시 내손동");
		
		
		
		Object t = transactionTemplate.execute(new TransactionCallback<Boolean>() {

			@Override
			public Boolean doInTransaction(TransactionStatus status) {
				try {
					mapper.insertChatRoom(vo,0);
					ChatUserVO vo2 = new ChatUserVO();
					vo2.setChatroom_num(vo.getChatroom_num());
					vo2.setUser_num(0);
					mapper.insertUser(vo2,0);
				} catch (Exception e) {
					e.printStackTrace();
					status.setRollbackOnly();
					return false;
				}
				return true;
			
			}
			
		});
		
		
		System.out.println(t);
		
	}
	*/
	
//	@Test
//	public void getChatList() {
//		System.out.println("getChatList Testing!!!!");
//		List<ChatRoomVO> list =  mapper.getChatList(0, 0);
//		list.forEach(what->System.out.println(what));
//	}
//	
//	
//	@Test
//	public void getTotalCnt() {
//		log.info(mapper.getTotalCnt(0));
//	}
	
	/*
	@Test
	public void getChatRoomUsers() {
		List<MemberVO> list= mapper.getChatRoomUsers(8,0);
		list.forEach(show->System.out.println(show));
	}
	*/
	
	/*
	@Test
	public void getChatRoomDetail() {
		Integer chatroom_num = 8;
		Integer select = 0;
		ChatRoomVO vo = mapper.getChatRoomDetail(chatroom_num, select);
		System.out.println(vo);
	}
	*/
	
	/*
	@Test
	public void plusChatUserNum() {
		int i = mapper.plusChatUserNum(11, 0);
		int i2 = mapper.plusChatUserNum(10, 0);
		System.out.println("chatroom_num 8: "+i+" / chatroom_num 2: "+i2);
	}
	*/
	
//	@Test
//	public void deleteChatUser_AND_minusChatUserNum() {
		
		
//		int chatroom_num =12 ;
//		int user_num = 3;
//		int select = 0;
//		
//		TransactionStatus status =  manager.getTransaction(new DefaultTransactionDefinition());
//		try {
//		
//			mapper.deleteChatUser(chatroom_num, user_num, select);
//			int i = mapper.minusChatUserNum(chatroom_num, select);
//			manager.commit(status);
////			
//		} catch (Exception e) {
//			e.printStackTrace();
//			manager.rollback(status);
//		}
		
//	}
	
//	@Test
//	public void getSeach() {
//		List<ChatRoomVO>  vo = mapper.getChatList(0,1, "경기", null);
//		vo.forEach(w->System.out.println(w));
//	}
	
	@Test
	public void getChatListfromWith() {
		List<ChatRoomVO> vo = mapper.getChatList(1, 1, null, null);
		vo.forEach(s->System.out.println(s));
	}
	
}









