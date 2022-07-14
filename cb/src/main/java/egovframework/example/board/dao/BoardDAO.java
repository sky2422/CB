package egovframework.example.board.dao;

import java.util.List;

import egovframework.example.board.vo.BoardVO;
import egovframework.example.board.vo.Search;

public interface BoardDAO {
	
	/*데이터 목록 보기*/
	List<BoardVO> selectBoard(Search search) throws Exception;
	
	/*데이터 입력*/
	void insertBoard(BoardVO boardVO) throws Exception;
	
	/*총 게시글 개수 확인*/
	public int getBoardListCnt(Search search) throws Exception;
		
	/*센서명 가져오기*/
	



}
