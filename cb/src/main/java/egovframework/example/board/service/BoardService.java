package egovframework.example.board.service;

import java.util.List;

import egovframework.example.board.vo.BoardVO;

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
	
	//행정동 리스트
	public List<BoardVO> dongList(BoardVO boardVO) throws Exception;

	

	

	

	
	
	
	
	
	







	

}
