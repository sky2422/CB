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
import egovframework.example.board.vo.Search;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
		// 데이터 목록 리스트, 페이징, 검색
		@RequestMapping(value = "/boardList.do")
		public String boardListDo(Model model
				,@RequestParam(required = false, defaultValue = "1") int page
				,@RequestParam(required = false, defaultValue = "1") int range
				,@RequestParam(required = false, defaultValue = "ym") String searchType
				,@RequestParam(required = false) String keyword,
				@ModelAttribute("search") Search search
				) throws Exception {

			//검색
			model.addAttribute("search", search);
			search.setSearchType(searchType);
			search.setKeyword(keyword);
			
			// 전체 데이터 개수를 얻어와 listCnt에 저장
			int listCnt = boardService.getBoardListCnt(search);

			//검색
			search.pageInfo(page, range, listCnt);
			//페이징
			model.addAttribute("pagination", search);
			//데이터 화면 출력
			model.addAttribute("list", boardService.selectBoard(search));

			return "board/boardList";
		}
		
		//데이터 작성 클릭시 데이터 작성 페이지로 이동
		@RequestMapping(value = "/boardRegister.do")
		public String boardRegister() {			
			
			
			
			return "board/boardRegister";
		}
		
		//데이터 작성 버튼 구현
		@RequestMapping(value = "/insertBoard.do")
		public String write(@ModelAttribute("boardVO") BoardVO boardVO, RedirectAttributes rttr) throws Exception{
			boardService.insertBoard(boardVO);
						
			return "redirect:boardList.do";
			
		}
		
		//센서명 리스트
		
	
		
}






































