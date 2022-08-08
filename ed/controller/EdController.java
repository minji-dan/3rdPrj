package kr.co.biztechpartners.serveSocket.ed.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EdController {
	private static final Logger log = LoggerFactory.getLogger(EdController.class);
	
	@GetMapping("/ed/csrList")
	public ModelAndView csrList(HttpSession session){
		ModelAndView view = new ModelAndView();
		
		view.setViewName("ed/csrList");
		return view;
	}
	
	@GetMapping("/ed/ed1List")
	public ModelAndView ed1List(HttpSession session){
		ModelAndView view = new ModelAndView();
		
		view.setViewName("ed/ed1List");
		return view;
	}
	
	@GetMapping("/ed/ed2List")
	public ModelAndView ed2List(HttpSession session){
		ModelAndView view = new ModelAndView();
		
		view.setViewName("ed/ed2List");
		return view;
	}
	
	@GetMapping("/ed/ed3List")
	public ModelAndView ed3List(HttpSession session){
		ModelAndView view = new ModelAndView();
		
		view.setViewName("ed/ed3List");
		return view;
	}
}
