package com.xqy.yongyou.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.xqy.yongyou.dao.NewsCataMapper;
import com.xqy.yongyou.dao.NewsDataMapper;
import com.xqy.yongyou.entity.NewsData;

@RestController
@RequestMapping(value = "/manager/")
public class ManagerNewsController {
	
	private static Logger logger = LoggerFactory.getLogger(ManagerNewsController.class);
	@Autowired
	private NewsCataMapper newsCataMapper;
	@Autowired
	private NewsDataMapper newsDataMapper;

	/**
	 * 所有的新闻
	 * @return
	 */
	@RequestMapping("listall/news")
    public ModelAndView listAllNews(){
		ModelAndView mv = new ModelAndView("admin/all_news");
		//left cataId;   
        return mv;
    }
	
	
	@RequestMapping("news2edit/{newsId}")
    public ModelAndView news2edit(@PathVariable("newsId") String newsId){
		ModelAndView mv = new ModelAndView("admin/news_edit");  
		
		NewsData data = newsDataMapper.getNewsDataById(Integer.valueOf(newsId));
		if(data == null ){
			data = new NewsData();
		}
		mv.addObject("newsData", data);
        return mv;
    }
}
