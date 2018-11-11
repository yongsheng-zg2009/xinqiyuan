package com.xqy.yongyou.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xqy.yongyou.entity.NewsData;


/**
  * @Author:niyongsheng
  * 消息处理mapper
  */
public interface NewsDataMapper {

    List<NewsData> getNewsDataByCataId(@Param("cataId") String cataId,@Param("startNo")int startNo,@Param("size")int size);
    int insertData(NewsData newsData);
    int updateData(NewsData newsData);
    List<NewsData> getNewsDataByCataIdRelation(@Param("cataId") String cataId);
    List<NewsData> getRecommendProducts(@Param("cataId") String cataId);
    List<NewsData> listAllNews(@Param("startNo") int startNo, @Param("size") int size);
    List<NewsData> listManagerAllNews(@Param("startNo") int startNo, @Param("size") int size);
    NewsData getNewsDataById(@Param("newsId") Integer newsId);
    List<NewsData> getNewsDatasByIds(@Param("ids") List<Integer> ids);
    
}
