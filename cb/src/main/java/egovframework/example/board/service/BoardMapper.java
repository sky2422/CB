package egovframework.example.board.service;

import java.util.List;

import egovframework.example.board.vo.BoardVO;
import egovframework.example.board.vo.Search;

public interface BoardMapper {
	
	/*데이터 목록 보기*/
	public List<BoardVO> selectBoard(Search search) throws Exception;
	
	/*데이터 입력*/
	public void insertBoard(BoardVO boardVO) throws Exception;
	
	/*총 게시글 개수 확인*/
	public int getBoardListCnt(Search search) throws Exception;

	
	
}


