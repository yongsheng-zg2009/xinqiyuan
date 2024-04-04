package com.xqy.yongyou.constant;

import java.util.ArrayList;
import java.util.List;

/**
 * CateInfoEnum 产品分类枚举
 */
 public enum CateInfoEnum {
    bigMiddleSeries("A00020001", "用友大中型系列"),
    middleSmallSeries("A00020002", "用友中小型系列"),
    otherSeries("A00020003", "用友其他系列"),
    affairSeries("A00020004", "行政职能系列"),
    relationSeries("A00020005", "关联产品"),
    cloud("A00020006", "用友云系列"),;
    String code;
    String desc;

    CateInfoEnum(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }


    public static List<String> GetRecommendCateIds(){
        List<String> list = new ArrayList<>();
        list.add(bigMiddleSeries.code);
        list.add(middleSmallSeries.code);
        list.add(otherSeries.code);
        list.add(affairSeries.code);
        list.add(relationSeries.code);
        list.add(cloud.code);
        return list;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
