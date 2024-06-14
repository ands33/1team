package com.springbook.view.board;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardDAO;

@Controller
public class GetBoardListController {

	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
//		conditionMap.put("작성자", "WRITER");
//		conditionMap.put("작성일", "REGDATE");
		return conditionMap;
	}

	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardVO vo, BoardDAO boardDAO, Model model) {
		if (vo.getSearchCondition() == null)
			vo.setSearchCondition("TITLE");
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");
		// 검색조건이 입력되면 수행
		model.addAttribute("boardList", boardDAO.getBoardList(vo));
		return "getBoardList.jsp";
	}

//   @RequestMapping("/getBoardList.do")
//   public String getBoardList(
//		   @RequestParam(value="searchCondition", defaultValue="TITLE", required=false)String condition,
//		   @RequestParam(value="searchKeyword", defaultValue="", required=false)String keyword,
////		   BoardVO vo,
//		   BoardDAO boardDAO,
//		   Model model)
//   {
//	   System.out.println("검색조건" + condition);
//	   System.out.println("검색어" + keyword);
//	   return "getBoardList.jsp";
//   }

	/*
	 * @RequestMapping("/getBoardList.do") public ModelAndView getBoardList(BoardVO
	 * vo, BoardDAO boardDAO, ModelAndView mav) { mav.addObject("boardList",
	 * boardDAO.getBoardList(vo)); //값 mav.setViewName("getBoardList.jsp"); //값이
	 * jsp한테 넘어감 return mav; //dispatcherservlet ->으로 반환 }
	 */
}