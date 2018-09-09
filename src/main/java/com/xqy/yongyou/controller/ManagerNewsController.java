package com.xqy.yongyou.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.xqy.yongyou.dao.NewsCataMapper;
import com.xqy.yongyou.dao.NewsDataMapper;
import com.xqy.yongyou.entity.NewsCata;
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
	 * 查看所有的新闻咨询
	 * @return
	 */
	@RequestMapping("listall/news")
    public ModelAndView listAllNews(){
		ModelAndView mv = new ModelAndView("admin/all_news");
		
		List<NewsData> cataNews = newsDataMapper.listAllNews( 0, 10000);
		mv.addObject("cataNews", cataNews);
        return mv;
    }
	
	/**
	 * 进入咨询编辑页面
	 * @param newsId
	 * @return
	 */
	@RequestMapping("news2edit/{newsId}")
    public ModelAndView news2edit(@PathVariable("newsId") String newsId){
		ModelAndView mv = new ModelAndView("admin/news_edit");  
		
		NewsData data = newsDataMapper.getNewsDataById(Integer.valueOf(newsId));
		List<NewsCata> allCatas = newsCataMapper.listAll();
		if(data == null ){
			data = new NewsData();
		}
		mv.addObject("newsData", data);
		mv.addObject("allCatas", allCatas);
        return mv;
    }
	
	
	/**
	 * 进入添加咨询页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "toNewsAddPage")
	public ModelAndView toNewsAddPage(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("admin/news_add"); 
		List<NewsCata> allCatas = newsCataMapper.listAll();

		mv.addObject("allCatas", allCatas);
		return mv;
		
	}
	@RequestMapping(value = "updateNews")
	public ModelAndView updateNews(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mv = new ModelAndView("admin/news_edit"); 
		String newsId = request.getParameter("newsId");
		String title = request.getParameter("title");
		String changeCataId = request.getParameter("changeCataId");
		String newsContent = request.getParameter("newsContent");
		System.out.println(newsId);
		System.out.println(title);
		System.out.println(changeCataId);
		System.out.println(newsContent);
		System.out.println("-0---------------------------------------------------------------------------");

//		NewsData data = newsDataMapper.getNewsDataById(Integer.valueOf(newsId));
/*		if(data == null ){
			data = new NewsData();
		}
		mv.addObject("newsData", data);*/
        return mv;
    }
	
	
	
	@RequestMapping("/addNews")
	 public ModelAndView addNews(HttpServletRequest request, HttpServletResponse response){
	//	ModelAndView mv = new ModelAndView("admin/news_add"); 
		
		
		String newsId = request.getParameter("newsId");
		String title = request.getParameter("title");
		String cataId = request.getParameter("cataId");
		String newsContent = request.getParameter("newsContent");
		System.out.println(newsId);
		System.out.println(title);
		System.out.println(cataId);
		System.out.println(newsContent);
		 
		System.out.println("----------------------------------------------------------------------");
		NewsData newsData = new NewsData();
		newsData.setCataId(cataId);
		newsData.setContent(newsContent);
		newsData.setTitle(title);
		newsData.setHits(getRandom(1000,9000));
		newsDataMapper.insertData(newsData);
		System.out.println("查看新闻id："+ newsData.getId() );
		ModelAndView mv = listAllNews();
		return mv;
		
	 }
	
	
	public static String getRandom(int min, int max){
	    Random random = new Random();
	    int s = random.nextInt(max) % (max - min + 1) + min;
	    return String.valueOf(s);

	}
	
	
	
}
