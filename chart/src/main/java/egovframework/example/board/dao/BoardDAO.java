package egovframework.example.board.dao;

import java.util.List;

import egovframework.example.board.vo.BoardVO;
import egovframework.example.board.vo.Search;

public interface BoardDAO {

	/*데이터 리스트*/
//	List<BoardVO> selectBoard(BoardVO boardVO) throws Exception;
	
	/*데이터 입력*/
	void insertBoard(BoardVO boardVO) throws Exception;
	
	/*데이터 상세*/
	BoardVO selectDetail(BoardVO boardVO) throws Exception;
	
	/*데이터 수정*/
	void updateBoard(BoardVO boardVO) throws Exception;
	
	/*데이터 삭제*/
	void deleteBoard(BoardVO boardVO) throws Exception;
		
	//행정동 리스트
	List<BoardVO> dongList(BoardVO boardVO) throws Exception;
	
	//센서 리스트
	List<BoardVO> sensorList(BoardVO boardVO) throws Exception;
	
	//검색&페이징 데이터 리스트
	List<BoardVO> selectBoard(Search search) throws Exception;
	
	//데이터 갯수
	int getBoardListCnt(Search search) throws Exception;
	

	
	

	

	

	

	
	

	
	



}
