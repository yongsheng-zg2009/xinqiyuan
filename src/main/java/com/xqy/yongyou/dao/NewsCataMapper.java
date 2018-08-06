package com.xqy.yongyou.dao;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xqy.yongyou.entity.NewsCata;
 


/**
  * @Author:niyongsheng
  * 省市编码表
  */
public interface NewsCataMapper/* extends BaseMapper<NewsCata>*/{
	
    /**
     *
     * @return
    
    @Select("SELECT C_ID as id, C_Title as title, C_RootID as rootId,C_Number as number, C_Remark as remark, C_AddTime as createTime"
    		+ "  FROM newscata where C_RootID = #{cataNo};") 
    NewsCata getNewsCataByCataId(@Param("cataNo") String cataNo);*/
	
    NewsCata getNewsCataByCataId(@Param("cataNo") String cataNo);
    
    
    List<NewsCata> listAll();
    
    
    

}
