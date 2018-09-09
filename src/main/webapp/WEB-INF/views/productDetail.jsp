<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<!-- 类目横向排列 -->
<HTML xmlns="http://www.w3.org/1999/xhtml">
<head>
	<script language="javascript" src="js/common.js"></script>
	<META name=GENERATOR content="MSHTML 8.00.6001.19019">
	<jsp:include page="seo_title.jsp"></jsp:include>
	<li rel=stylesheet type=text/css href="image/css.css">
</head>

<body bottomMargin=0 leftMargin=0 rightMargin=0 topMargin=0>
<link rel=stylesheet type=text/css href="image/css.css">
<jsp:include page="head.jsp"></jsp:include>    
<!--居左的开始-->
<table border=0 cellSpacing=0 cellPadding=0 width=956 align=center><!--DWLayouttable-->
  <TBODY>
    <tr>
    <jsp:include page="left_navigation.jsp"></jsp:include>
    <td height="100" colspan="2" vAlign=top width="758"><table border=0 cellSpacing=0 cellPadding=0 width="100%">
      <TBODY>
        <tr>
          <td height=11 colSpan=2></td>
        </tr>
        <tr>
          <td width=9></td>
          <td align="right"><OBJECT codeBase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" 
                  classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width=743   height=178                >
            <PARAM NAME="movie" VALUE="image/banner.swf">
            <PARAM NAME="quality" VALUE="high">
            <PARAM NAME="wmode" VALUE="transparent">
              <!-- <embed src="image/banner.swf" quality="high" 
                  pluginspage="http://www.macromedwia.com/go/getflashplayer" 
                  type="application/x-shockwave-flash" width="743" height="178"></embed></OBJECT> -->
                  
                  
                  <embed src="image/banner_2.swf" quality="high" pluginspage="http://www.macromedwia.com/go/getflashplayer" type="application/x-shockwave-flash" width="751" height="113">
                  
          </td>
        </tr>
      </TBODY>
    </table></td>
    </tr>
  <tr>
    <td width=568 vAlign=top>
      <table border=0 cellSpacing=0 cellPadding=0 width="568">
        <TBODY>
        <tr>

      <td valign="top"><table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tbody>
					<tr>
                      <td width="align=&quot;right&quot;" valign="top" id="E"><div style="PADDING-TOP:9px"></div>
                        <table height="40" cellspacing="0" cellpadding="0" width="750" align="center" border="0">
                          <tbody>
                          <tr>
                            <td valign="top" height="180" style="padding-bottom:10px"><table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tbody>
                    <tr valign="top">
                      <td height="21" align="center"><table width="100%" height="533" border="0" align="right" cellpadding="1" cellspacing="1" bgcolor="#dfdfdf">
        <tbody><tr>
          <td height="30" style="background:url(image/banner_bj_x.jpg) bottom repeat-x">&nbsp;
       <a href="/">网站首页</a><img src="/Admin/img/i_dot.gif"><a href="/newsCata/A0002">产品展示</a><img src="/Admin/img/i_dot.gif"><a href="Product.asp?cataid=A00020002"><font color="red">用友中小型ERP系列</font></a><img src="/Admin/img/i_dot.gif">正文</td>
        </tr>
        <tr>
          <td valign="top" bgcolor="#ffffff"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td class="content"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td class="content"><table width="98%" border="0" align="center" cellspacing="0" cellpadding="5" bordercolordark="#FFFFFF" bordercolorlight="#000000" style="TABLE-LAYOUT: fixed; WORD-BREAK: break-all">
            <tbody><tr>
              <td width="100%" align="center"><br>
                  <b>
                    <h2>${newsData.title }</h2>
                    </b>
                  <hr size="1" color="#d5d5d5" width="100%" noshade="noshade"></td>
            </tr>
            <tr>
              <td><div align="right"></div></td>
            </tr>
            <tr>
              <td width="100%" valign="top" style="line-height:150%;"><p> 
              <font id="zoom" style="line-height:150%; font-size:14px">
              <c:if test="${not empty newsData.saveFileName}">
              	<img src="/Admin/News/UploadFile/${newsData.saveFileName}" border="0"/>
              </c:if>
              
              ${newsData.content }
            </tr>
            <tr>
              <td><p>
              
              </p><p></p></td>
            </tr>
          </tbody></table></td>
            </tr>
          </tbody></table></td>
            </tr>
          </tbody></table></td>
        </tr>
      </tbody></table></td>
                    </tr></tbody></table></td>
                      </tr></tbody></table>                      </td>
                  </tr></tbody></table></td>
      <hr/>

        <tr>
          <td></td></tr></TBODY></table></td>
    <td vAlign=top width=193 style="padding-top:3px">

        </td></tr>
  </TBODY></table>
<jsp:include page="qq_float.jsp"></jsp:include>
<jsp:include page="bottom_brief.jsp"></jsp:include>
 
</BODY></HTML>