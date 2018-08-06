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
              <embed src="image/banner.swf" quality="high" 
                  pluginspage="http://www.macromedwia.com/go/getflashplayer" 
                  type="application/x-shockwave-flash" width="743" height="178"></embed></OBJECT>
          </td>
        </tr>
      </TBODY>
    </table></td>
    </tr>
  <tr>
    <jsp:include page="indexCenter.jsp"></jsp:include>
    <td vAlign=top width=193 style="padding-top:3px">

     <jsp:include page="right_navigation.jsp"></jsp:include>
        </td></tr>
  </TBODY></table>
<jsp:include page="qq_float.jsp"></jsp:include>
<jsp:include page="bottom_brief.jsp"></jsp:include>

</BODY></HTML>