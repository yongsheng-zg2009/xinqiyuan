package com.xqy.yongyou.dao;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xqy.yongyou.entity.NewsCata;
 


/**
  * @Author:niyongsheng
  * 门类处理mapper
  */
public interface NewsCataMapper{
    NewsCata getNewsCataByCataId(@Param("cataNo") String cataNo);
    List<NewsCata> listAll();
}
