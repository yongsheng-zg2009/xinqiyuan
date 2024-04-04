package com.xqy.yongyou.controller;

import com.xqy.yongyou.dao.SysAdminMapper;
import com.xqy.yongyou.util.Md5Util;
import com.xqy.yongyou.util.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@RestController
@RequestMapping("/login")
public class LoginController {
	
	private static Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private SysAdminMapper sysAdminMapper;
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
			 
			 String enryPwd = Md5Util.getPwd(password.trim());
			 int num = sysAdminMapper.countUserNum(userName.trim(), enryPwd);
			 if(num > 0){
				 // 生成token
				 HttpSession session = request.getSession();
				 session.setAttribute("username", "testsession"); //存储在Session中  
			 }
		 }
		 
		try {
			respons.sendRedirect("/manager/index");
		} catch (IOException e) {
			e.printStackTrace();
		}
        return mv;
    }
}
