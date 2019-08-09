package com.solrecipe.recipe.mypage;

import java.security.Principal;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.solrecipe.recipe.CommonServiceImpl;
import com.solrecipe.recipe.foodvideo.FoodVideoServiceImpl;
import com.solrecipe.recipe.foodvideo.FoodVideoVO;
import com.solrecipe.recipe.user.domain.MemberVO;

@Controller
public class MyPageController {

	@Autowired
	CommonServiceImpl commonService;
	@Autowired
	MyPageServiceImpl myPageService;
	@Autowired
	FoodVideoServiceImpl foodVideoService;
	
	@GetMapping("/myPage_mark")
	public String myPage_mark(Principal principal, Model model) {
		
		//user_num을 가져옴
		String username = principal.getName();
		MemberVO myVO = commonService.getMyVO(username);//myVO는 user_num이랑 user_nickname 을 들고 있다.
		
		ArrayList<MyVideoVO> getMarkedVideos = myPageService.getMarkedVideos(myVO.getUser_num());
		model.addAttribute("myVideoVO", getMarkedVideos);
		return ("/my/myPage_mark");
	}
	
	@GetMapping("/deleteMarkedVideo")
	public String deleteMarkedVideo(Principal principal, int video_num) {
		
		//user_num을 가져옴
		String username = principal.getName();
		MemberVO myVO = commonService.getMyVO(username);//myVO는 user_num이랑 user_nickname 을 들고 있다.
		
		int result = foodVideoService.unmarking(myVO.getUser_num(), video_num);
		return "redirect:/myPage_mark";
	}
	
	
	// 무한스크롤
	@RequestMapping(method=RequestMethod.GET, value="/getMoreVideos", produces ="application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<MyVideoVO> getMorePlaylist(Principal principal, int startNum) {
		//user_num을 가져옴
		String username = principal.getName();
		MemberVO myVO = commonService.getMyVO(username);//myVO는 user_num이랑 user_nickname 을 들고 있다.
		
		ArrayList<MyVideoVO> moreVideos =myPageService.getMoreVideos(myVO.getUser_num(), startNum);
		return moreVideos;
	}
}
