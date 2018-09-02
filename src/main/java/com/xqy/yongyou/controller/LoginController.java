package com.xqy.yongyou.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.xqy.yongyou.util.StringUtils;


@RestController
@RequestMapping("/login")
public class LoginController {
	
	private static Logger logger = LoggerFactory.getLogger(LoginController.class);
	/**
	 * 首页
	 * @return
	 */
	@RequestMapping("/page")
    public ModelAndView index(){
		ModelAndView mv = new ModelAndView("admin/login");     
        return mv;
    }
	
	
	/**
	 * 首页
	 * @return
	 */
	@RequestMapping("/auth")
    public ModelAndView auth(HttpServletRequest request, HttpServletResponse respons){
		
		ModelAndView mv = new ModelAndView("admin/login");   
		
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		 if(!StringUtils.isBlank(userName)&& !StringUtils.isBlank(password)){
			 // 生成token
			 HttpSession session = request.getSession();
			 session.setAttribute("username", "testsession"); //存储在Session中  
		 }
		 
		try {
			respons.sendRedirect("/manager/index");
		} catch (IOException e) {
			 
			e.printStackTrace();
		}
		
        return mv;
    }
	
	
	
}
