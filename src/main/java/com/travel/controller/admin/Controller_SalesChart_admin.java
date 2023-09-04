package com.travel.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.service.admin.Interface_TravelService;
import com.travel.service.admin.Service_SalesChart_select_admin;
import com.travel.service.admin.Service_SalesChart_staypopup_admin;

@Controller
@RequestMapping("admin")
public class Controller_SalesChart_admin {
	
	@Autowired
	private SqlSession sqlSession;
	private Interface_TravelService service;
	
	@RequestMapping(value="saleschart")
	public String saleschart(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		service = new Service_SalesChart_select_admin(sqlSession);
		service.execute(model);
		
		return "admin/saleschart_admin";
	}
	
	@RequestMapping(value="stay_popup")
	public String stay_popup(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		service = new Service_SalesChart_staypopup_admin(sqlSession);
		service.execute(model);
		
		return "admin/saleschart_admin";
	}
}
