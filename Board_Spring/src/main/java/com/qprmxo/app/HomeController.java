package com.qprmxo.app;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.qprmxo.app.service.boardService;
import com.qprmxo.app.vo.BoardVo;
import com.util.page.PageUtil;


@Controller
public class HomeController {
	
	@Autowired
	private boardService b_service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "home";
	}
	
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String board(Model model,
			@RequestParam(value="pageNum",defaultValue="1")  int pageNum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int totalRowCount = b_service.getCount();
		PageUtil pu = new PageUtil(pageNum, 5, 5, totalRowCount);
	
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		List<BoardVo> list = b_service.getList(map);
		
		model.addAttribute("pu",pu);
		model.addAttribute("list",list);
		
		return "board";
	}
	
	@RequestMapping(value="/insert",method = RequestMethod.GET)
	public String insert() {
		
		return "insert";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insertOk(String title, String content, Model model) {
		int n = b_service.insert(new BoardVo(title, content));
		if(n>0) {
			model.addAttribute("result", "글쓰기 성공!");
		}else {
			model.addAttribute("result", "글쓰기 실패!");
		}
		return "result";
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String delete(String num,Model model) {
		
		String[] num1 = num.split("/");
		int cnt=0;
		for(int i=0; i<num1.length; i++) {
			b_service.delete(Integer.parseInt(num1[i]));
			cnt++;
		}
		model.addAttribute("result",cnt-1 + "개의 글 삭제 성공!");
		
		return "result";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String update(String num,Model model) {
	
		BoardVo vo = b_service.getInfo(Integer.parseInt(num));
		model.addAttribute("vo",vo);
		
		return "update";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updateOk(String title,String content,String num,Model model) {
		
		b_service.update(new BoardVo(Integer.parseInt(num), title, content));
		
		model.addAttribute("result", "글 수정 성공!");
		
		return "result";
	}
}
