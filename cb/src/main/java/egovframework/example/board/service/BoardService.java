package egovframework.example.board.service;

import java.util.List;

import egovframework.example.board.vo.BoardVO;
import egovframework.example.board.vo.Search;

public interface BoardService {
	
	/*데이터 리스트*/
	public List<BoardVO> selectBoard(BoardVO boardVO) throws Exception;
	
	/*데이터 입력*/
	public void insertBoard(BoardVO boardVO) throws Exception;
	
	/*데이터 상세*/
	public BoardVO selectDetail(BoardVO boardVO) throws Exception;
	
	/*데이터 수정*/
	public void updateBoard(BoardVO boardVO) throws Exception;
	
	/*데이터 삭제*/
	public void deleteBoard(BoardVO boardVO) throws Exception;
	
	//총 게시글 개수 확인
	public int getBoardListCnt(Search search) throws Exception;
	
	//행정동 리스트
	public List<BoardVO> dongList(BoardVO boardVO) throws Exception;

	

	

	

	
	
	
	
	
	







	

}
