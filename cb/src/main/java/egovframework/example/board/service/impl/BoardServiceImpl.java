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
	
	/*데이터 리스트*/
	@Override
	public List<BoardVO> selectBoard(BoardVO boardVO) throws Exception {
		return boardDAO.selectBoard(boardVO);
	}

	/*데이터 입력*/
	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		boardDAO.insertBoard(boardVO);
	}	
	
	/*데이터 상세*/
	@Override
	public BoardVO selectDetail(BoardVO boardVO) throws Exception {
		return boardDAO.selectDetail(boardVO);
	}
	
	/*데이터 수정*/
	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		boardDAO.updateBoard(boardVO);
	}
	
	/*데이터 삭제*/
	@Override
	public void deleteBoard(BoardVO boardVO) throws Exception {
		boardDAO.deleteBoard(boardVO);		
	}

	
	//총 게시글 개수 확인
	@Override
	public int getBoardListCnt(Search search) throws Exception {
		return boardDAO.getBoardListCnt(search);
	}

	//행정동 리스트
	@Override
	public List<BoardVO> dongList(BoardVO boardVO) throws Exception {
		return boardDAO.dongList(boardVO);
	}

	

	
	

	
	
	
	
	
	
	

	
	
	







	

}
