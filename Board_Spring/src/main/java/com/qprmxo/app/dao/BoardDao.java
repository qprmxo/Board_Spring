package com.qprmxo.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.qprmxo.app.vo.BoardVo;

@Repository
public class BoardDao {

	@Autowired
	private SqlSession sqlSession;

	private final String NAMESPACE = "sqlmap.BoardMapper";
	
	public List<BoardVo> getList(HashMap<String, Object> map){
		List<BoardVo> list = sqlSession.selectList(NAMESPACE + ".getList",map);
		return list;
	}
	
	public int insert(BoardVo vo){
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
	
	public int delete(int num) {
		return sqlSession.delete(NAMESPACE + ".delete",num);
	}
	
	public int update(BoardVo vo) {
		return sqlSession.update(NAMESPACE + ".update",vo);
	}
	
	public BoardVo getInfo(int num) {
		return sqlSession.selectOne(NAMESPACE + ".getInfo",num);
	}
	
	public int getCount() {
		return sqlSession.selectOne(NAMESPACE + ".getCount");
	}
}
