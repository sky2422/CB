package egovframework.example.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.board.dao.BoardDAO;
import egovframework.example.board.service.BoardService;
import egovframework.example.board.vo.BoardVO;
import egovframework.example.board.vo.Search;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDAO boardDAO;
	
	/*데이터 목록 보기*/
	@Override
	public List<BoardVO> selectBoard(Search search) throws Exception {
		return boardDAO.selectBoard(search);
	}

	/*데이터 입력*/
	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		boardDAO.insertBoard(boardVO);
	}	
	
	//총 게시글 개수 확인
	@Override
	public int getBoardListCnt(Search search) throws Exception {
		return boardDAO.getBoardListCnt(search);
	}
	
	/*센서명 가져오기*/
	
	

	
	
	







	

}
