package com.xqy.yongyou.dao;

import org.apache.ibatis.annotations.Param;


/**
  * @Author:niyongsheng
  * 消息处理mapper
  */
public interface SysAdminMapper {

    int countUserNum(@Param("userId") String userId,@Param("pwd")String pwd);

}
