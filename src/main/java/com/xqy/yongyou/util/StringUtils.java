package com.xqy.yongyou.util;

/**
 * 日期工具类。<br>
 *
 * @author niyongsheng
 * @version 1.0
 */
public class StringUtils {

	
	public static boolean isBlank(String str){
		
		if(null == str) return true;
		if(str.trim().length()== 0) return true;
		
		return false;
	}

}