package egovframework.example.board.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.example.board.dao.BoardDAO;
import egovframework.example.board.service.BoardMapper;
import egovframework.example.board.vo.BoardVO;
import egovframework.example.board.vo.Search;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	/*데이터 리스트*/
	@Override
	public List<BoardVO> selectBoard(BoardVO boardVO) throws Exception {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class); 
		return mapper.selectBoard(boardVO);
	}
	
	/*데이터 등록*/
	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		mapper.insertBoard(boardVO);
	}
	
	/*데이터 상세*/
	@Override
	public BoardVO selectDetail(BoardVO boardVO) throws Exception {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.selectDetail(boardVO);
	}
	
	/*데이터 수정*/
	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		mapper.updateBoard(boardVO);
	}
	
	/*데이터 삭제*/
	@Override
	public void deleteBoard(BoardVO boardVO) throws Exception {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		mapper.deleteBoard(boardVO);
	}
	
	/*총 게시글 개수 확인*/
	@Override
	public int getBoardListCnt(Search search) throws Exception {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.getBoardListCnt(search);
	}

	//행정동 리스트
	@Override
	public List<BoardVO> dongList(BoardVO boardVO) throws Exception {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.dongList(boardVO);
	}

		
	

}
