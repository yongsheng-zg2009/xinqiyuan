package com.xqy.yongyou.controller;

import com.xqy.yongyou.constant.CateInfoEnum;
import com.xqy.yongyou.dao.NewsCataMapper;
import com.xqy.yongyou.dao.NewsDataMapper;
import com.xqy.yongyou.entity.NewsCata;
import com.xqy.yongyou.entity.NewsData;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

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

	private void fetchLeftCommonProductData(final ModelAndView  mv){
	    // 一次性取出推荐的分类
		List<NewsCata> cateList = newsCataMapper.getNewsCatasByCataIds(CateInfoEnum.GetRecommendCateIds());
        NewsCata bigMiddleSeriesCate,cloudCate,middleSmallSeriesCate,otherSeriesCate,affairSeriesCate,relationSeriesCate;
        bigMiddleSeriesCate = null;
        cloudCate = null;
        middleSmallSeriesCate = null;
        otherSeriesCate = null;
        affairSeriesCate = null;
        relationSeriesCate = null;

		 for(int i=0 ; i< cateList.size(); i++ ){
			 NewsCata tempData = cateList.get(i);
			 if(CateInfoEnum.bigMiddleSeries.getCode().equals(tempData.getRootId())){
                 bigMiddleSeriesCate = tempData;
			 }else if(CateInfoEnum.cloud.getCode().equals(tempData.getRootId())){
                 cloudCate = tempData;
			 }else if(CateInfoEnum.middleSmallSeries.getCode().equals(tempData.getRootId())){
                 middleSmallSeriesCate = tempData;
			 }else if(CateInfoEnum.otherSeries.getCode().equals(tempData.getRootId())){
                 otherSeriesCate = tempData;
			 }else if(CateInfoEnum.affairSeries.getCode().equals(tempData.getRootId())){
                 affairSeriesCate = tempData;
			 }else if(CateInfoEnum.relationSeries.getCode().equals(tempData.getRootId())){
                 relationSeriesCate = tempData;
			 }
		 }

		List<NewsData> allList = newsDataMapper.getNewsDatasByCataIds(CateInfoEnum.GetRecommendCateIds(), 0, DEFAULT_SIZE);
		List<NewsData>  yybigMiddleNews = new ArrayList<NewsData>();
		List<NewsData>  yyCloudNews = new ArrayList<NewsData>();
		List<NewsData>  yyMiddleSmalleNews = new ArrayList<NewsData>();
		List<NewsData>  yyOtherSeriesNews = new ArrayList<NewsData>();
		List<NewsData>  affairSeriesNews = new ArrayList<NewsData>();
		List<NewsData>  yyRelationSeriesNews = new ArrayList<NewsData>();
		for(int i=0 ; i< allList.size(); i++ ){
			NewsData tempData = allList.get(i);
			if(CateInfoEnum.bigMiddleSeries.getCode().equals(tempData.getCataId())){
				yybigMiddleNews.add(tempData);
			}else if(CateInfoEnum.middleSmallSeries.getCode().equals(tempData.getCataId())){
				yyMiddleSmalleNews.add(tempData);
			}else if(CateInfoEnum.cloud.getCode().equals(tempData.getCataId())){
				yyCloudNews.add(tempData);
			}else if(CateInfoEnum.otherSeries.getCode().equals(tempData.getCataId())){
				yyOtherSeriesNews.add(tempData);
			}else if(CateInfoEnum.affairSeries.getCode().equals(tempData.getCataId())){
				affairSeriesNews.add(tempData);
			}else if(CateInfoEnum.relationSeries.getCode().equals(tempData.getCataId())){
				yyRelationSeriesNews.add(tempData);
			}
		}
		mv.addObject("yybigMiddleSeriesCata", bigMiddleSeriesCate);
		mv.addObject("yybigMiddleNews", yybigMiddleNews);
		mv.addObject("yyCloudCata", cloudCate);
		mv.addObject("yyCloudNews", yyCloudNews);
		mv.addObject("yyMiddleSmalleSeriesCata", middleSmallSeriesCate);
		mv.addObject("yyMiddleSmalleNews", yyMiddleSmalleNews);
		mv.addObject("yyOtherSeriesCata", otherSeriesCate);
		mv.addObject("yyOtherSeriesNews", yyOtherSeriesNews);
		mv.addObject("affairSeriesCata", affairSeriesCate);
		mv.addObject("affairSeriesNews", affairSeriesNews);
		mv.addObject("yyRelationSeriesCata", relationSeriesCate);
		mv.addObject("yyRelationSeriesNews", yyRelationSeriesNews);
	}

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
	 * @param cataId
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
		List<Integer> ids = new ArrayList<Integer>();
		ids.add(837);
		ids.add(750);
		ids.add(838);
		ids.add(752);
		ids.add(747);
		ids.add(735);
		ids.add(770);
		ids.add(758);
		ids.add(751);
        List<NewsData> list = newsDataMapper.getNewsDatasByIds(ids);
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
		NewsData newsData = newsDataMapper.getNewsDataById(productId);;
		mv.addObject("newsData", newsData);
        return mv;
    }
	
}
