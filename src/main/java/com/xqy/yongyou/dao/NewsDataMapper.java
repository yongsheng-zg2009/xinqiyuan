package com.xqy.yongyou.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.xqy.yongyou.entity.NewsCata;
import com.xqy.yongyou.entity.NewsData;


/**
  * @Author:niyongsheng
  * 省市编码表
  */
public interface NewsDataMapper /* extends BaseMapper<NewsData>*/{
	
    /**
     *
     * @return
    
    @Select("	SELECT D_ID as id, D_CataID as cataId, D_Title as title, D_Content as content,"
    		+ " 	D_Picture as picture, D_SaveFileName as saveFileName, D_SavePathFileName as savePathFileName,"
    		+ "		D_AddTime as createTime, D_Num as num , D_Hits as hits "
    		+ "  	FROM newsdata where D_CataID = #{cataId} order by D_ID desc limit #{startNo}, #{size};")
    List<NewsData> getNewsDataByCataId(@Param("cataId") String cataId,@Param("startNo")int startNo,@Param("size")int size);
    
    
    @Select("	SELECT D_ID as id, D_CataID as cataId, D_Title as title, D_Content as content,"
    		+ " 	D_Picture as picture, D_SaveFileName as saveFileName, D_SavePathFileName as savePathFileName,"
    		+ "		D_AddTime as createTime, D_Num as num , D_Hits as hits "
    		+ "  	FROM newsdata where D_CataID like CONCAT(#{cataId}, '%') order by D_ID  limit 0, 12 ;")
    List<NewsData> getNewsDataByCataIdRelation(@Param("cataId") String cataId);
    
    
    @Select("	SELECT D_ID as id, D_CataID as cataId, D_Title as title, D_Content as content,"
    		+ " 	D_Picture as picture, D_SaveFileName as saveFileName, D_SavePathFileName as savePathFileName,"
    		+ "		D_AddTime as createTime, D_Num as num , D_Hits as hits "
    		+ "  	FROM newsdata where D_CataID like CONCAT(#{cataId}, '%') order by D_ID limit 0, 9 ;")
    List<NewsData> getRecommendProducts(@Param("cataId") String cataId);
    
    
    
    @Select("	SELECT D_ID as id, D_CataID as cataId, D_Title as title, D_Content as content,"
    		+ " 	D_Picture as picture, D_SaveFileName as saveFileName, D_SavePathFileName as savePathFileName,"
    		+ "		D_AddTime as createTime, D_Num as num , D_Hits as hits "
    		+ "  	FROM newsdata where D_ID = #{newsId};")
    NewsData getNewsDataById(@Param("newsId") Integer newsId); */
	
	

    List<NewsData> getNewsDataByCataId(@Param("cataId") String cataId,@Param("startNo")int startNo,@Param("size")int size);
    
    int insertData(/*@Param("newsData")*/ NewsData newsData);
    
    List<NewsData> getNewsDataByCataIdRelation(@Param("cataId") String cataId);
    
    

    List<NewsData> getRecommendProducts(@Param("cataId") String cataId);
    
    List<NewsData> listAllNews(@Param("startNo") int startNo, @Param("size") int size);
    

    NewsData getNewsDataById(@Param("newsId") Integer newsId);
    
    
    
    
}
