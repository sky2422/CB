package egovframework.example.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.board.service.BoardService;
import egovframework.example.board.vo.BoardVO;


@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/boardList.do")
	public String boardListDO(@ModelAttribute BoardVO boardVO, Model model) throws Exception{
		model.addAttribute("list", boardService.selectBoard(boardVO));
		return "board/boardList";
	}
	
	//데이터 작성 클릭시 데이터 작성 페이지로 이동
	@RequestMapping(value = "/boardRegister.do")
	public String boardRegister(@ModelAttribute BoardVO boardVO, Model model) throws Exception {			
		
		//행정동 리스트
		model.addAttribute("dongList", boardService.dongList(boardVO));			
		
		return "board/boardRegister";
	}
	
	//데이터 작성 버튼 구현
	@RequestMapping(value = "/insertBoard.do")
	public String write(@ModelAttribute("boardVO") BoardVO boardVO, RedirectAttributes rttr) throws Exception{
		boardService.insertBoard(boardVO);
					
		return "redirect:boardList.do";
		
	}
	
	//데이터번호 선택시 상세보기
	@RequestMapping(value = "/boardDetail.do")
	public String viewForm(@ModelAttribute("boardVO") BoardVO boardVO, Model model, HttpServletRequest request) throws Exception{
		
		int unq = Integer.parseInt(request.getParameter("unq")); 
		boardVO.setUnq(unq);
		
		BoardVO resultVO = boardService.selectDetail(boardVO);
		model.addAttribute("result", resultVO);
		
		return "board/boardDetail";
	}
	
	//데이터 수정
	@RequestMapping(value = "/updateBoard.do")
	public String updateBoard(@ModelAttribute("boardVO") BoardVO boardVO, HttpServletRequest request) throws Exception{
		boardService.updateBoard(boardVO);
		return "redirect:boardList.do";			
	}
	
	//데이터 삭제
	@RequestMapping(value = "/deleteBoard.do")
	public String deleteBoard(@ModelAttribute("boardVO") BoardVO boardVO) throws Exception{
		boardService.deleteBoard(boardVO);
		return "redirect:boardList.do";
	}
		
		
}






































