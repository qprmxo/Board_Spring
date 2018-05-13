package com.qprmxo.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qprmxo.app.dao.BoardDao;
import com.qprmxo.app.vo.BoardVo;

@Service
public class boardService {

	@Autowired
	private BoardDao dao;
	
	public List<BoardVo> getList(HashMap<String, Object> map){
		return dao.getList(map);
	}
	
	public int insert(BoardVo vo) {
		return dao.insert(vo);
	}
	
	public int delete(int num) {
		return dao.delete(num);
	}
	
	public int update(BoardVo vo) {
		return dao.update(vo);
	}
	
	public BoardVo getInfo(int num) {
		return dao.getInfo(num);
	}
	
	public int getCount() {
		return dao.getCount();
	}
}
