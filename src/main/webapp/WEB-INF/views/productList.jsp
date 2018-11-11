<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 类目横向排列 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<TITLE>产品展示 >> 河南新起源软件科技有限公司</TITLE>
<script language="javascript" src="/js/common.js"></script>
<META name=GENERATOR content="MSHTML 8.00.6001.19019">
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<meta name="keywords" content="郑州用友,郑州用友软件,郑州用友财务软件,郑州用友软件公司,用友T1,用友酒店管理软件,用友协同OA,用友餐饮管理软件,用友客户管理软件,用友T3,用友T6,用友办公OA">
<meta name="description" content="郑州用友,郑州用友软件,郑州用友财务软件,郑州用友软件公司,用友T1,用友酒店管理软件,用友协同OA,用友餐饮管理软件,用友客户管理软件,用友T3,用友T6,用友办公OA">
<LINK rel=stylesheet type=text/css href="/image/css.css">
</HEAD>
<BODY bottomMargin=0 leftMargin=0 rightMargin=0 topMargin=0>
<jsp:include page="head.jsp"></jsp:include>    


<TABLE border=0 cellSpacing=0 cellPadding=0 width=956 align=center><!--DWLayoutTable-->
  <TBODY>
    <TR>
    <jsp:include page="left_navigation.jsp"></jsp:include>
    <TD height="100" vAlign=top width="758"><TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
      <TBODY>
        <TR>
          <TD height=11 colSpan=2></TD>
        </TR>
        <TR>
          <TD width=9></TD>
          <TD align="right"><OBJECT codeBase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" 
                  classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width=751   height=113                >
            <PARAM NAME="movie" VALUE="/image/banner_2.swf">
            <PARAM NAME="quality" VALUE="high">
            <PARAM NAME="wmode" VALUE="transparent">
              <embed src="/image/banner_2.swf" quality="high" pluginspage="http://www.macromedwia.com/go/getflashplayer" 
                  type="application/x-shockwave-flash" width="751"       height="113"              ></embed>
          </OBJECT></TD>
        </TR>
      </TBODY>
    </TABLE></TD>
    </TR>
  <TR>
    <TD vAlign=top><TABLE cellSpacing=0 cellPadding=0 width="100%" align=center 
                  border=0>
                    <TBODY>
					<TR>
                      <TD width= align="right" vAlign=top id=E><DIV style="PADDING-TOP:9px"></DIV>
                        <TABLE height=40 cellSpacing=0 cellPadding=0 width=750 
                        align=center  border=0>
                          <TBODY>
                          <TR>
                            <TD vAlign=top  height="180"style="padding-bottom:10px"><TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
                    <TBODY>
                    <TR vAlign=top>
                      <TD height=21 align="center" ><table width="100%" height="533" border="0" align="right" cellpadding="1" cellspacing="1" bgcolor="#dfdfdf">
        <tr>
          <td height="30" style="background:url(/image/banner_bj_x.jpg) bottom repeat-x">&nbsp;
            <a href=/>网站首页</a><img src="/Admin/img/i_dot.gif"><a href='/products/'><font color=red>产品展示</font></a></td>
        </tr>
        <tr>
          <td valign="top" bgcolor="#ffffff">
          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td class="content"><table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
          <tbody><tr>
            <td height="24" align="left" valign="top">
			</td></tr>
			 <tr align="center">
		 			<c:forEach items= "${newsDatas }" var="data" varStatus="i">
						<c:if test="${(i.index) % 4 == 0 }">
							</tr><tr align="center">
						</c:if>
						<td width="25%" valign="bottom">
								<table border="0" cellspacing="0" cellpadding="0" width="90%" align="center">  
									<tbody><tr><td align="center" valign="bottom" width="162" height="150">
											<a href="${data.id }.html" target="_blank">
											<img src="/Admin/News/UploadFile/${data.saveFileName }" border="2" style="border-color:#ffffff" width="162" height="150" onload="javascript:DrawImage(this,162,150);"></a></td></tr>  <tr><td align="center" height="15">
											<a href="${data.id }.html" target="_blank">${data.title }</a></td></tr></tbody></table>
						</td>
					</c:forEach> 
			</tr>
        </tbody></table></td>
            </tr>
          </tbody></table>
          <!-- 分页 开始 -->
          <!--  
          <table width="100%" border="0" cellspacing="0" cellpadding="5" class="s"><tbody><tr><td height="20" class="nav" align="center">共30条记录 每页显示12条 共3页 当前为第1页 首页 | 上一页 | <a href="?CataID=A0002&amp;page=2">下一页</a> | <a href="?CataID=A0002&amp;page=3">末页</a> </td></tr></tbody></table>
          -->
          <!-- 分页 结束 -->
        </td>
        </tr>
          </table></td>
        </tr>
      </table></TD>
      </TR></TBODY></TABLE></TD>
      </TR></TBODY></TABLE>                      </TD>
                  </TR></TBODY></TABLE></TD>
    </TR>
  </TBODY></TABLE>
  
	<jsp:include page="qq_float.jsp"></jsp:include>
	<jsp:include page="bottom_brief.jsp"></jsp:include>

</BODY></HTML>