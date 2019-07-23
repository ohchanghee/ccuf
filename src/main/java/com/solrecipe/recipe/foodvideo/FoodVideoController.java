package com.solrecipe.recipe.foodvideo;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class FoodVideoController {

	@Autowired
	FoodVideoService foodVideoServiceImpl;
	
	ArrayList<FoodVideoVO> moreList = new ArrayList<FoodVideoVO>();
	
	@GetMapping("/foodvideo_index")
	public String foodvideo_index(Model model) {
		// 인기영상
		ArrayList<FoodVideoVO> bestList = (ArrayList)foodVideoServiceImpl.getBestList();
		
		// 최신영상(최초 9개)
		ArrayList<FoodVideoVO> newList = (ArrayList)foodVideoServiceImpl.getNewList();
		
		model.addAttribute("bestList", bestList);
		model.addAttribute("newList", newList);
		return ("/foodvideo/foodvideo_index");
	}
	
	@PostMapping(value="/getMoreNewlist", produces="application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<FoodVideoVO> getMoreNewlist(String startNum){
		// index 무한스크롤
		ArrayList<FoodVideoVO> moreNewlist = (ArrayList) foodVideoServiceImpl.getMoreNewlist(Integer.parseInt(startNum));
		return moreNewlist;
	}
	
	@GetMapping("/foodvideo_detail")
	public String foodvideo_detail(int video_num, Model model) {
		FoodVideoVO fvVO = foodVideoServiceImpl.getFVO(video_num);
		ArrayList<FoodVideoVO> playList = (ArrayList) foodVideoServiceImpl.getPlayList(fvVO.getVideo_playlist());
		model.addAttribute("fvVO", fvVO);
		model.addAttribute("playList", playList);
		return ("/foodvideo/foodvideo_detail");
	}
	
	@GetMapping("/foodvideo_test")
	public String foodvideo_test(Model model) {
		FoodVideoVO fvVO = new FoodVideoVO();
		fvVO.setVideo_id("HMeJTkf9Jo4");
		fvVO.setVideo_content("SNS https://www.instagram.com/life.kimiforest/\\nE-MAIL ymgs1888@naver.com");
		fvVO.setVideo_playlist("PLv3Ue3wDYx4NRU7_PDekbW0ZfMcGdxv9V");
		fvVO.setVideo_title("[Cooking ASMR] 강식당 탕수육 라면 Kang's Kitchen Korean ramyun recipe 키미 Kimi");
		ArrayList<FoodVideoVO> playList = (ArrayList) foodVideoServiceImpl.getPlayList(fvVO.getVideo_playlist());
		model.addAttribute("fvVO", fvVO);
		model.addAttribute("playList", playList);
		return ("/foodvideo/foodvideo_detail");
	}
	
	// detail-관련영상 무한스크롤
	@RequestMapping(method=RequestMethod.POST, value="/getMorePlaylist", produces ="application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<FoodVideoVO> getMorePlaylist(String startNum, String playList) {
		ArrayList<FoodVideoVO> morePlaylist = (ArrayList) foodVideoServiceImpl.getMorePlaylist(Integer.parseInt(startNum), playList);
//		ArrayList maps = new ArrayList();
//		for(int i=0; i<morePlaylist.size(); i++) {
//			HashMap hm = new HashMap();
//			hm.put("video_num",morePlaylist.get(i).getVideo_num());
//			hm.put("video_title",morePlaylist.get(i).getVideo_title());
//			hm.put("video_thumbnail",morePlaylist.get(i).getVideo_thumbnail());
//			maps.add(hm);
//		}
		return morePlaylist;
	}
	
	
	@GetMapping("/foodvideo_search")
	public String fv_search_list(@ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("list", foodVideoServiceImpl.search_list(cri));
		model.addAttribute("cri_Recipe_search", cri.getRecipe_search());
		return "/foodvideo/foodvideo_search";
	}
	
	@PostMapping(value="/getMoreSearchlist", produces="application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<FoodVideoVO> getMoreSearchlist(String startNum, Criteria cri){
		// index 무한스크롤
		ArrayList<FoodVideoVO> moreSearchlist = (ArrayList) foodVideoServiceImpl.getMoreSearchlist(Integer.parseInt(startNum), cri);
		return moreSearchlist;
	}
	
}