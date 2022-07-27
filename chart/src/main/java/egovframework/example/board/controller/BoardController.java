package egovframework.example.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.example.board.service.BoardService;
import egovframework.example.board.vo.BoardVO;
import egovframework.example.board.vo.Search;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
		
//	@RequestMapping(value = "/boardList.do")
//	public String boardListDO(@ModelAttribute BoardVO boardVO, Model model) throws Exception{
//		model.addAttribute("list", boardService.selectBoard(boardVO));
//		
//		//행정동 리스트
//		model.addAttribute("dongList", boardService.dongList(boardVO));	
//		
//		//센서 리스트
//		model.addAttribute("sensorList", boardService.sensorList(boardVO));
//		
//		return "board/boardList";
//	}
	
	//검색&페이징 데이터 리스트
	@RequestMapping(value = "/boardList.do")
	public String boardListDO(BoardVO boardVO, Model model
							 ,@RequestParam(required=false, defaultValue="1")int page
							 ,@RequestParam(required=false, defaultValue="1")int range
							 ,@RequestParam(required=false)String admi
							 ,@RequestParam(required=false)String sensor
							 ,@RequestParam(required=false)String period
							 ,@ModelAttribute("search")Search search) throws Exception{
		
		//검색
		model.addAttribute("search", search);
		search.setAdmi(admi);
		search.setSensor(sensor);
		search.setPeriod(period);
				
		//행정동 리스트
		model.addAttribute("dongList", boardService.dongList(boardVO));	
		
		//센서 리스트
		model.addAttribute("sensorList", boardService.sensorList(boardVO));
				
		//전체 데이터 개수
		int listCnt = boardService.getBoardListCnt(search);
		
		//검색 후 페이지
		search.pageInfo(page, range, listCnt);
		//페이징
		model.addAttribute("pagination", search);
		//데이터 화면 출력
		model.addAttribute("list", boardService.selectBoard(search));
		
		//list를 json으로 변환
		//List 생성
		List<BoardVO> dataList = boardService.selectBoard(search);			
		//jackson objectmapper 객체 생성
		ObjectMapper objectMapper = new ObjectMapper();
		//List -> Json 문자열
		String jList = objectMapper.writeValueAsString(dataList);			
		//Json 문자열 출력
		System.out.println(jList);
		model.addAttribute("jList", jList);
			
		//검색란에 검색어 유지
		String sPeriod = search.getPeriod();
		String sSensor = search.getSensor();
		String sAdmi = search.getAdmi(); 
				
		model.addAttribute("sPeriod", sPeriod);
		model.addAttribute("sSensor", sSensor);
		model.addAttribute("sAdmi", sAdmi);
		
		System.out.println(sPeriod);
		System.out.println(sSensor);
		System.out.println(sAdmi);
		
		
		return "board/boardList";
	}

	
	//데이터 작성 클릭시 데이터 작성 페이지로 이동
	@RequestMapping(value = "/boardRegister.do")
	public String boardRegister(@ModelAttribute BoardVO boardVO, Model model) throws Exception {			
		
		//행정동 리스트
		model.addAttribute("dongList", boardService.dongList(boardVO));	
		
		//센서 리스트
		model.addAttribute("sensorList", boardService.sensorList(boardVO));
		
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






































