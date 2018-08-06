package com.xqy.yongyou.dao;
import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

/**
 * 集成基础的mapper
 * 
 * @author niyongsheng
 * @date 2017年10月11日
 * @param <T> 
 */
public interface BaseMapper<T> extends Mapper<T>, MySqlMapper<T> {

}
