package com.xqy.yongyou.controller;

import com.alibaba.fastjson.JSONObject;
import com.xqy.yongyou.dao.NewsCataMapper;
import com.xqy.yongyou.dao.NewsDataMapper;
import com.xqy.yongyou.dto.Result;
import com.xqy.yongyou.entity.NewsCata;
import com.xqy.yongyou.entity.NewsData;
import com.xqy.yongyou.util.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Random;

@RestController
@RequestMapping(value = "/manager/")
public class ManagerNewsController {
	
	private static Logger logger = LoggerFactory.getLogger(ManagerNewsController.class);
	@Autowired
	private NewsCataMapper newsCataMapper;
	@Autowired
	private NewsDataMapper newsDataMapper;

	/**
	 * 进入资源列表页
	 * @return
	 */
	@RequestMapping("listall/news")
    public ModelAndView listAllNews(){
		ModelAndView mv = new ModelAndView("admin/all_news");
		List<NewsData> cataNews = newsDataMapper.listManagerAllNews( 0, 10000);
		mv.addObject("cataNews", cataNews);
        return mv;
    }
	
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
	 * 进入资源添加页
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

	/**
	 * 更新资源信息
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "updateNewsAjax")
	@ResponseBody
	public String updateNewsAjax(HttpServletRequest request, HttpServletResponse response){
		Result rs = new Result();
		String newsId = request.getParameter("newsId");
		String title = request.getParameter("title");
		String changeCataId = request.getParameter("changeCataId");
		String sourceCataId = request.getParameter("sourceCataId");
		String newsContent = request.getParameter("newsContent");
		String cataId = sourceCataId;
		if(StringUtils.isBlank(newsId) || StringUtils.isBlank(title)|| StringUtils.isBlank(changeCataId)|| StringUtils.isBlank(sourceCataId) || StringUtils.isBlank(newsContent)){
			rs.setSuccess(false);
			rs.setMessage("缺少必填参数");
			return JSONObject.toJSON(rs).toString();
		}
		if(!changeCataId.trim().equals(sourceCataId.trim())){
			cataId = changeCataId.trim();
		}
		NewsData data = new NewsData();
		data.setId(Integer.parseInt(newsId));
		data.setCataId(cataId);
		data.setTitle(title);
		data.setContent(newsContent);
		newsDataMapper.updateData(data);
		rs.setSuccess(true);
		return JSONObject.toJSON(rs).toString();
    }
	
	/**
	 * 添加资源
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/addNewsAjax")
	@ResponseBody
	 public String addNewsAjax(HttpServletRequest request, HttpServletResponse response){
	
		Result rs = new Result();
 
		String title = request.getParameter("title");
		String cataId = request.getParameter("cataId");
		String newsContent = request.getParameter("newsContent");
		if(StringUtils.isBlank(cataId) || StringUtils.isBlank(title) || StringUtils.isBlank(newsContent)){
			rs.setSuccess(false);
			rs.setMessage("缺少必填参数");
			return JSONObject.toJSON(rs).toString();
		}
		NewsData newsData = new NewsData();
		newsData.setCataId(cataId);
		newsData.setContent(newsContent);
		newsData.setTitle(title);
		newsData.setHits(getRandom(1000,9000));
		newsDataMapper.insertData(newsData);
		
		NewsData updateData = new NewsData();
		updateData.setId(newsData.getId());
		updateData.setSortId(Float.parseFloat(String.valueOf(newsData.getId())));
		newsDataMapper.updateData(updateData);
		rs.setSuccess(true);
		return JSONObject.toJSON(rs).toString();
	 }
	
	/**
	 * 资源下架
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/hideNewsAjax")
	@ResponseBody
	 public String hideNewsAjax(HttpServletRequest request, HttpServletResponse response){
	
		Result rs = new Result();
		String newsId = request.getParameter("newsId");
		if(StringUtils.isBlank(newsId)){
			rs.setSuccess(false);
			rs.setMessage("缺少必填参数");
			return JSONObject.toJSON(rs).toString();
		}
		NewsData newsData = new NewsData();
		newsData.setStatus(-1);
		newsData.setId(Integer.parseInt(newsId));
		newsDataMapper.updateData(newsData);
		rs.setSuccess(true);
		return JSONObject.toJSON(rs).toString();
	 }
	
	
	/**
	 * 资源下架
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/showNewsAjax")
	@ResponseBody
	 public String showNewsAjax(HttpServletRequest request, HttpServletResponse response){
	
		Result rs = new Result();
		String newsId = request.getParameter("newsId");
		if(StringUtils.isBlank(newsId)){
			rs.setSuccess(false);
			rs.setMessage("缺少必填参数");
			return JSONObject.toJSON(rs).toString();
		}
		NewsData newsData = new NewsData();
		newsData.setStatus(1);
		
		newsData.setId(Integer.parseInt(newsId));
		newsDataMapper.updateData(newsData);
		rs.setSuccess(true);
		return JSONObject.toJSON(rs).toString();
	 }
	
	public static String getRandom(int min, int max){
	    Random random = new Random();
	    int s = random.nextInt(max) % (max - min + 1) + min;
	    return String.valueOf(s);

	}
}
