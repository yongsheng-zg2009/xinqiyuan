package com.xqy.yongyou.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.xqy.yongyou.dao.NewsCataMapper;
import com.xqy.yongyou.dto.Result;
import com.xqy.yongyou.entity.NewsCata;

@RestController
public class ManagerController {
	
	private static Logger logger = LoggerFactory.getLogger(ManagerController.class);
	@Autowired
	private NewsCataMapper newsCataMapper;



	@RequestMapping(value = "/admin/allCataAjax",method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Result listAllCata(){
		Result rs = new Result();
		
		List<NewsCata> newsCatas = newsCataMapper.listAll();
		rs.setSingleData(newsCatas);
		rs.setSuccess(true); 
        return rs;
    }
 
	

	
}
