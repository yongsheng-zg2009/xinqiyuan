package com.xqy.yongyou.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.xqy.yongyou.dao.NewsCataMapper;
import com.xqy.yongyou.dao.NewsDataMapper;
import com.xqy.yongyou.entity.NewsCata;
import com.xqy.yongyou.entity.NewsData;


@RestController
public class IndexController {
	
	private static Logger logger = LoggerFactory.getLogger(IndexController.class);
	private static Integer DEFAULT_SIZE = 100;
	
	@Autowired
	private NewsCataMapper newsCataMapper;
	@Autowired
	private NewsDataMapper newsDataMapper;
	
	/**
	 * 首页
	 * @return
	 */
	@RequestMapping("/index")
    public ModelAndView index(){
		ModelAndView mv = new ModelAndView("index");
		//left cataId;
		fetchLeftCommonProductData(mv);
		fetchCompanyNews(mv);
		fetchRecommendProducts(mv);
		productsSign(mv);
                
        return mv;
    }
	
	
	public void fetchLeftCommonProductData(final ModelAndView  mv){
		
		List<String> cataIds =  new ArrayList<String>();
		cataIds.add("A00020001");
		cataIds.add("A00020002");
		cataIds.add("A00020003");
		cataIds.add("A00020004");
		cataIds.add("A00020005");
		cataIds.add("A00020006");
		List<NewsCata> cataList = newsCataMapper.getNewsCatasByCataIds(cataIds);
		// 用友大中型系列
		NewsCata yybigMiddleSeriesCata = null;
		//用友云系列
		NewsCata  yyCloudCata = null;
		// 用友中小型系列
		NewsCata yyMiddleSmalleSeriesCata = null;
		// 用友其他系列
		NewsCata yyOtherSeriesCata = null;
		// 行政职能系列
		NewsCata affairSeriesCata = null;
		// 关联产品
		NewsCata yyRelationSeriesCata = null;
		
		 for(int i=0 ; i< cataList.size(); i++ ){
			 NewsCata tempData = cataList.get(i); 
			 if("A00020001".equals(tempData.getRootId())){
				 yybigMiddleSeriesCata = tempData; 
			 }else if("A00020006".equals(tempData.getRootId())){
				 yyCloudCata = tempData;
			 }else if("A00020002".equals(tempData.getRootId())){
				 yyMiddleSmalleSeriesCata = tempData;
			 }else if("A00020003".equals(tempData.getRootId())){
				 yyOtherSeriesCata = tempData;
			 }else if("A00020004".equals(tempData.getRootId())){
				 affairSeriesCata = tempData;
			 }else if("A00020005".equals(tempData.getRootId())){
				 yyRelationSeriesCata = tempData;
			 }
			 
		 }
/*		// 用友大中型系列
		NewsCata yybigMiddleSeriesCata = newsCataMapper.getNewsCataByCataId("A00020001");
		//用友云系列
		NewsCata  yyCloudCata = newsCataMapper.getNewsCataByCataId("A00020006");
		// 用友中小型系列
		NewsCata yyMiddleSmalleSeriesCata = newsCataMapper.getNewsCataByCataId("A00020002");
		// 用友其他系列
		NewsCata yyOtherSeriesCata = newsCataMapper.getNewsCataByCataId("A00020003");
		// 行政职能系列
		NewsCata affairSeriesCata = newsCataMapper.getNewsCataByCataId("A00020004");
		// 关联产品
		NewsCata yyRelationSeriesCata = newsCataMapper.getNewsCataByCataId("A00020005");*/
		
/*		List<String> cataIds =  new ArrayList<String>();
		cataIds.add("A00020001");
		cataIds.add("A00020002");
		cataIds.add("A00020003");
		cataIds.add("A00020004");
		cataIds.add("A00020005");
		cataIds.add("A00020006");*/
		List<NewsData> allList = newsDataMapper.getNewsDatasByCataIds(cataIds, 0, DEFAULT_SIZE);
		
		List<NewsData>  yybigMiddleNews = new ArrayList<NewsData>(); 
		List<NewsData>  yyCloudNews = new ArrayList<NewsData>();
		List<NewsData>  yyMiddleSmalleNews = new ArrayList<NewsData>();
		List<NewsData>  yyOtherSeriesNews = new ArrayList<NewsData>();
		List<NewsData>  affairSeriesNews = new ArrayList<NewsData>();
		List<NewsData>  yyRelationSeriesNews = new ArrayList<NewsData>();
		for(int i=0 ; i< allList.size(); i++ ){
			NewsData tempData = allList.get(i);
			if("A00020001".equals(tempData.getCataId())){
				yybigMiddleNews.add(tempData);
			}else if("A00020006".equals(tempData.getCataId())){
				yyCloudNews.add(tempData);
			}else if("A00020002".equals(tempData.getCataId())){
				yyMiddleSmalleNews.add(tempData);
			}else if("A00020006".equals(tempData.getCataId())){
				yyCloudNews.add(tempData);
			}else if("A00020003".equals(tempData.getCataId())){
				yyOtherSeriesNews.add(tempData);
			}else if("A00020004".equals(tempData.getCataId())){
				affairSeriesNews.add(tempData);
			}else if("A00020005".equals(tempData.getCataId())){
				yyRelationSeriesNews.add(tempData);
			}
		}
		mv.addObject("yybigMiddleSeriesCata", yybigMiddleSeriesCata);
		mv.addObject("yybigMiddleNews", yybigMiddleNews);
		
		mv.addObject("yyCloudCata", yyCloudCata);
		mv.addObject("yyCloudNews", yyCloudNews);
		
		mv.addObject("yyMiddleSmalleSeriesCata", yyMiddleSmalleSeriesCata);
		mv.addObject("yyMiddleSmalleNews", yyMiddleSmalleNews);
		
		mv.addObject("yyOtherSeriesCata", yyOtherSeriesCata);
		mv.addObject("yyOtherSeriesNews", yyOtherSeriesNews);
		
		mv.addObject("affairSeriesCata", affairSeriesCata);
		mv.addObject("affairSeriesNews", affairSeriesNews);
		
		mv.addObject("yyRelationSeriesCata", yyRelationSeriesCata);
		mv.addObject("yyRelationSeriesNews", yyRelationSeriesNews);
	}
	
	
	
	/**
	 * 获取相关产品列表信息
	 * @param mv
	 
	public void fetchLeftCommonProductData(final ModelAndView  mv){
		// 用友大中型系列
		NewsCata yybigMiddleSeriesCata = newsCataMapper.getNewsCataByCataId("A00020001");
		List<NewsData>  yybigMiddleNews = newsDataMapper.getNewsDataByCataId("A00020001", 0, DEFAULT_SIZE);
		
		//用友云系列
		NewsCata  yyCloudCata = newsCataMapper.getNewsCataByCataId("A00020006");
		List<NewsData>  yyCloudNews = newsDataMapper.getNewsDataByCataId("A00020006", 0, DEFAULT_SIZE);
		
		// 用友中小型系列
		NewsCata yyMiddleSmalleSeriesCata = newsCataMapper.getNewsCataByCataId("A00020002");
		List<NewsData>  yyMiddleSmalleNews = newsDataMapper.getNewsDataByCataId("A00020002", 0, DEFAULT_SIZE);
		// 用友其他系列
		NewsCata yyOtherSeriesCata = newsCataMapper.getNewsCataByCataId("A00020003");
		List<NewsData>  yyOtherSeriesNews = newsDataMapper.getNewsDataByCataId("A00020003", 0, DEFAULT_SIZE);
		// 行政职能系列
		NewsCata affairSeriesCata = newsCataMapper.getNewsCataByCataId("A00020004");
		List<NewsData>  affairSeriesNews = newsDataMapper.getNewsDataByCataId("A00020004", 0, DEFAULT_SIZE);
		// 关联产品
		NewsCata yyRelationSeriesCata = newsCataMapper.getNewsCataByCataId("A00020005");
		List<NewsData>  yyRelationSeriesNews = newsDataMapper.getNewsDataByCataId("A00020005", 0, DEFAULT_SIZE);
		
		mv.addObject("yybigMiddleSeriesCata", yybigMiddleSeriesCata);
		mv.addObject("yybigMiddleNews", yybigMiddleNews);
		
		mv.addObject("yyCloudCata", yyCloudCata);
		mv.addObject("yyCloudNews", yyCloudNews);
		
		mv.addObject("yyMiddleSmalleSeriesCata", yyMiddleSmalleSeriesCata);
		mv.addObject("yyMiddleSmalleNews", yyMiddleSmalleNews);
		
		mv.addObject("yyOtherSeriesCata", yyOtherSeriesCata);
		mv.addObject("yyOtherSeriesNews", yyOtherSeriesNews);
		
		mv.addObject("affairSeriesCata", affairSeriesCata);
		mv.addObject("affairSeriesNews", affairSeriesNews);
		
		mv.addObject("yyRelationSeriesCata", yyRelationSeriesCata);
		mv.addObject("yyRelationSeriesNews", yyRelationSeriesNews);
	}
	*/

	
	
	/**
	 * 新闻信息详情
	 * @param newsId
	 * @return
	 */
	@RequestMapping("/news/{newsId}.html")
    public ModelAndView newsDetail(@PathVariable("newsId") Integer newsId){
		ModelAndView mv = new ModelAndView("newsDetail");
		NewsData newsData = newsDataMapper.getNewsDataById(newsId);
		mv.addObject("newsData", newsData);
        return mv;
    }
	
	/**
	 * 新闻信息详情
	 * @param newsId
	 * @return
	 */
	@RequestMapping("/newsCata/{cataId}.html")
    public ModelAndView cataNews(@PathVariable("cataId") String cataId){
		ModelAndView mv = new ModelAndView("newsList");
		List<NewsData> newsDatas = newsDataMapper.getNewsDataByCataIdRelation(cataId);
		mv.addObject("newsDatas", newsDatas);
        return mv;
    }

	
	
	
	
	
	/**
	 * 获取最新的公司动态
	 * @param mv
	 */
	public void fetchCompanyNews(final ModelAndView  mv){
		// 用友大中型系列
		List<NewsData>  companyNews = newsDataMapper.getNewsDataByCataId("A00010004", 0, 5);
		mv.addObject("companyNews", companyNews);
	}
	
	/**
	 * 产品推荐
	 * @param mv
	 */
	public void fetchRecommendProducts(final ModelAndView  mv){
		
		List<NewsData> list = new ArrayList<NewsData>();
		list.add(newsDataMapper.getNewsDataById(837));
		list.add(newsDataMapper.getNewsDataById(750));
		list.add(newsDataMapper.getNewsDataById(838));
		list.add(newsDataMapper.getNewsDataById(752));
		list.add(newsDataMapper.getNewsDataById(747));
		list.add(newsDataMapper.getNewsDataById(735));
		list.add(newsDataMapper.getNewsDataById(770));
		list.add(newsDataMapper.getNewsDataById(758));
		list.add(newsDataMapper.getNewsDataById(751));

		if(list.isEmpty()){
			// 用友大中型系列
			List<NewsData> recommendProducts = newsDataMapper.getRecommendProducts("A0002");
			if(null != recommendProducts){
				list.addAll(recommendProducts);
			}
		}
		mv.addObject("recommendProducts", list);
	}
	
	/**
	 * 产品签约
	 * @param mv
	 */
	public void productsSign(final ModelAndView  mv){
		// 用友大中型系列
		List<NewsData> productsSign = newsDataMapper.getRecommendProducts("A00010005");
		mv.addObject("productsSign", productsSign);
	}

	
	@RequestMapping("/products")
    public ModelAndView productsAll(){
		
		ModelAndView mv = new ModelAndView("productList");
		fetchLeftCommonProductData(mv);	
		List<NewsData> list = new ArrayList<NewsData>();
		List<Integer> ids = new ArrayList<Integer>();
		ids.add(837);ids.add(750);ids.add(838);
		ids.add(752);ids.add(747);ids.add(735);
		ids.add(770);ids.add(758);ids.add(751);
		list = newsDataMapper.getNewsDatasByIds(ids);
		if(list.isEmpty()){
			// 用友大中型系列
			List<NewsData> recommendProducts = newsDataMapper.getRecommendProducts("A0002");
			if(null != recommendProducts){
				list.addAll(recommendProducts);
			}
		}
		mv.addObject("newsDatas", list);
        return mv;
    }
	@RequestMapping("/products/{cataId}.html")
    public ModelAndView productsCata(@PathVariable("cataId") String cataId){
		ModelAndView mv = new ModelAndView("productList");
		fetchLeftCommonProductData(mv);	
		List<NewsData> newsDatas = newsDataMapper.getNewsDataByCataIdRelation(cataId);
		mv.addObject("newsDatas", newsDatas);
        return mv;
    }
	
	/**
	 * 产品详情
	 * @param productId
	 * @return
	 */
	@RequestMapping("/{productId}.html")
    public ModelAndView productDetail(@PathVariable("productId") Integer productId){
		ModelAndView mv = new ModelAndView("productDetail");
		fetchLeftCommonProductData(mv);
		NewsData newsData = newsDataMapper.getNewsDataById(productId);
//		newsData.setContent(newsData.getContent().replace("/admin/", "/Admin/"));
		mv.addObject("newsData", newsData);
        return mv;
    }
	
}
