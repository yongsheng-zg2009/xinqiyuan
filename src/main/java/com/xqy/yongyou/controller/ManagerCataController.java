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

@RestController
@RequestMapping(value = "/manager/")
public class ManagerCataController {
	
	private static Logger logger = LoggerFactory.getLogger(ManagerCataController.class);
	@Autowired
	private NewsCataMapper newsCataMapper;
	@Autowired
	private NewsDataMapper newsDataMapper;

	/**
	 * 进入后台页面
	 * @return
	 */
	@RequestMapping("index")
    public ModelAndView index(){
		ModelAndView mv = new ModelAndView("admin/index");
		//left cataId;   
        return mv;
    }
	
	/**
	 * 所有资源类型列表
	 * @return
	 */
	@RequestMapping("listall/catas")
    public ModelAndView listAllCatas(){
		ModelAndView mv = new ModelAndView("admin/all_catas");
		mv.addObject("allCatas", newsCataMapper.listAll());
        return mv;
    }
	
	

	/**
	 *单类型下的所有资源
	 * @return
	 */
	@RequestMapping("/cata/{cataId}.html")
	public ModelAndView newsDetail(@PathVariable("cataId") String cataId){
		ModelAndView mv = new ModelAndView("admin/cata_news");
		mv.addObject("cataNews", newsDataMapper.getNewsDataByCataId(cataId, 0, 1000));
        return mv;
    }
	
/*	@RequestMapping(value = "allCataAjax",method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Result listAllCata(){
		Result rs = new Result();
		
		List<NewsCata> newsCatas = newsCataMapper.listAll();
		rs.setSingleData(newsCatas);
		rs.setSuccess(true); 
        return rs;
    }*/

	
}
