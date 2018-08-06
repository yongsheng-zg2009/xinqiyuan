<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--顶部-->

    <td width=568 vAlign=top>
      <table border=0 cellSpacing=0 cellPadding=0 width="568">
        <TBODY>
        <!-- 公司动态模块儿-----------------------------------------------------------------------------------开始 -->
        <tr>
          <td valign="top">
            <table border=0 cellSpacing=0 cellPadding=0 width="100%">
              <TBODY>
              <tr>
                <td width=11></td>
                <td>
                  <table border=0 cellSpacing=0 cellPadding=0 width="100%">
                    <TBODY>
                    <tr>
                      <td height=50 colSpan=3>
                        <table border=0 cellSpacing=0 cellPadding=0 
width="100%">
                          <TBODY>
                          <tr>
                            <td width=169><IMG alt="" 
                              src="image/index_hs_zh_48.jpg" 
                              width=169 height=50></td>
                            <td background=image/index_hs_zh_49.jpg 
                            width=368>
                              <table border=0 cellSpacing=0 cellPadding=0 
                              width="100%">
                                <TBODY>
                                <tr>
                                <td height=19></td></tr>
                                <tr>
                                <td align=right><A 
                                href="/newsCata/A00010004.html"><IMG 
                                border=0 
                                src="image/index_hs_zh_53.jpg" 
                                width=33 
                              height=12></A>&nbsp;</td></tr></TBODY></table></td>
                            <td width=15><IMG alt="" 
                              src="image/index_hs_zh_51.jpg" 
                              width=15 height=50></td></tr></TBODY></table></td></tr>
                    <tr>
                      <td height=108 
                      background=image/index_hs_zh_62.jpg 
                      width=5></td>
                      <td vAlign=top width=532>
                        <table border=0 cellSpacing=0 cellPadding=0 
width="100%">
                          <TBODY>
                          <tr>
                            <td height=108 vAlign=top width=72><IMG alt="" 
                              src="image/index_hs_zh_66.jpg" 
                              width=84 height=110></td>
                            <td 
                            width=7></td>
                            <td vAlign=top width=438><div style="width:99%; padding:3px">
	<table width="97%" border="0" cellpadding="0" cellspacing="0" style="word-break:break-all;" valign="top">
	  <!-- 公司动态新闻-----------------------------------------------------------------------------------开始 -->
		<c:forEach items="${companyNews}" var="data">
		  <tr align="center">
		    <td width="25%" valign="bottom">
		      
		      <table width="100%" border="0" cellpadding="0" cellspacing="0" style="padding-left:10px">
		        <tr>
		          <td height="22"><img src="/Admin/Images/flag.jpg" align="absmiddle"> <a target="_blank" href="/news/${data.id }.html"  class="blackbig"><font color=>${data.title }</font></a>
					
				  </td>
		          <td align="right">${data.createTimeMMDD }</td>
		        </tr>
				<tr>
		          <td height="1" colspan="2"  background="/Admin/Images/jiange.gif"></td>
		        </tr>
		      </table>
		      </td>
		  </tr>
		  </c:forEach>
	  <!-- 公司动态新闻-----------------------------------------------------------------------------------结束 -->
	</table>
</div>
                              </td>
                          </tr></TBODY></table></td>
                      <td background=image/index_hs_zh_64.jpg  width=15></td></tr>
                    <tr>
                      <td><IMG alt="" 
                        src="image/index_hs_zh_81.jpg" width=5 
                        height=6></td>
                      <td background=image/index_hs_zh_82.jpg 
                      width=532></td>
                      <td width=15><IMG alt="" 
                        src="image/index_hs_03.jpg" width=15 
                        height=6></td></tr></TBODY></table></td>
                <td width=9></td></tr></TBODY></table></td></tr>
        
     <!-- 公司动态模块儿-----------------------------------------------------------------------------------结束 -->
        
        <tr>
          <td height=170>
            <table border=0 cellSpacing=0 cellPadding=0 width="100%">
              <TBODY>
              
			  <!-- 推荐产品------------------------------------------------------------------------------------开始 -->
              
              <tr>
                <td height=159 vAlign=bottom>
                  <table border=0 cellSpacing=0 cellPadding=0 width="100%">
                    <TBODY>
                    <tr>
                      <td width=9></td>
                      <td>
                        <table border=0 cellSpacing=0 cellPadding=0 width="100%">
                          <TBODY>
                          <tr>
                            <td height=50 colSpan=3>
                              <table border=0 cellSpacing=0 cellPadding=0 
                              width="100%">
                                <TBODY>
                                <tr>
                                <td width=169><IMG alt="" src="image/index_hs_zh_48_cp.jpg" 
                                width=169 height=50></td>
                                <td background=image/index_hs_zh_49.jpg width=368>
                                <table border=0 cellSpacing=0 cellPadding=0 width="100%">
                                <TBODY>
                                <tr>
                                <td height=19></td></tr>
                                <tr>
                                <td align=right><A 
                                href="products"><IMG 
                                border=0 
                                src="image/index_hs_zh_53.jpg" 
                                width=33 
                                height=12></A>&nbsp;</td></tr></TBODY></table></td>
                                <td width=15><IMG alt="" src="image/index_hs_zh_51.jpg" width=15 height=50></td></tr></TBODY></table></td></tr>
                          <tr>
                            <td height=108 background=image/index_hs_zh_62.jpg width=5></td>
                            <td width=532>
                            
				<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >                      
				   <tr align='center'>                         
					   <c:forEach items= "${recommendProducts }" var="data" varStatus="i">
					   		<c:if test="${i.index > 0 && (i.index) % 3 == 0 }">
					   		</tr><tr align="center">
					   		</c:if>
					
							<td width='20%' valign='middle' align=center>
								<table border=0 cellspacing=0 cellpadding=0 width=90% align=center>  
								<tr><td align=center valign=middle style='border:0px solid #cccccc' width=33% height=124>
								<a href='${data.id }.html' TARGET=_blank><img src='/Admin/News/UploadFile/${data.saveFileName }' border='2' style='border-color:#ffffff' width=120 height=120 onload="javascript:DrawImage(this,120,120);"></a></td></tr>  <tr><td bordercolor=#35aa04 bgcolor=#ffffff align=center height=15 >
								<a href='${data.id }.html' TARGET=_blank>
								${data.title }</a></td></tr></table>
							</td>
						</c:forEach>		
					</tr>
				</table>
</td>
                            <td background=image/index_hs_zh_64.jpg 
                            width=15></td></tr>
                          <tr>
                            <td><IMG alt="" 
                              src="image/index_hs_zh_81.jpg" width=5 
                              height=6></td>
                            <td background=image/index_hs_zh_82.jpg 
                            width=532></td>
                            <td width=15><IMG alt="" 
                              src="image/index_hs_03.jpg" width=15 
                              height=6></td></tr></TBODY></table></td>
                      <td width=9></td></tr></TBODY></table></td></tr>
              
              
            <!-- 推荐产品------------------------------------------------------------------------------------结束 -->

              
            <!-- 最新签约-------------------------------------------------------------------------------------开始 -->
              <tr>
                <td>
                  <table border=0 cellSpacing=0 cellPadding=0 width="100%">
                    <TBODY>
                    <tr>
                      <td width=9></td>
                      <td>
                        <table border=0 cellSpacing=0 cellPadding=0 
width="100%">
                          <TBODY>
                          <tr>
                            <td height=50 colSpan=3>
                              <table border=0 cellSpacing=0 cellPadding=0 
                              width="100%">
                                <TBODY>
                                <tr>
                                <td width=169><IMG alt="" 
                                src="image/index_hs_zh_48_bot.jpg" 
                                width=169 height=50></td>
                                <td 
                                background=image/index_hs_zh_49.jpg 
                                width=368>
                                <table border=0 cellSpacing=0 cellPadding=0 
                                width="100%">
                                <TBODY>
                                <tr>
                                <td height=19></td></tr>
                                <tr>
                                <td align=right><A 
                                href="/newsCata/A00010005.html"><IMG 
                                border=0 
                                src="image/index_hs_zh_53.jpg" 
                                width=33 
                                height=12></A>&nbsp;</td></tr></TBODY></table></td>
                                <td width=15><IMG alt="" 
                                src="image/index_hs_zh_51.jpg" 
                                width=15 
height=50></td></tr></TBODY></table></td></tr>
                          <tr>
                            <td height=108 
                            background=image/index_hs_zh_62.jpg 
                            width=5></td>
                            <td width=532>
                              <table border=0 cellSpacing=0 cellPadding=0 
                              width="100%">
                                <TBODY>
                                <tr>
                                <td height=108 vAlign=top width=72><IMG alt="" 
                                src="image/index_hs_zh_154.jpg" 
                                width=84 height=110></td>
                                <td 
                                width=7>&nbsp;</td>
                                <td vAlign=top width=438><div style="width:99%; padding:3px">

















<table width="97%" border="0" cellpadding="0" cellspacing="0" style="word-break:break-all;" valign="top">
  <c:forEach items= "${productsSign }" var="data" varStatus="i">			   		
  <tr align="center">
    <td width="25%" valign="bottom">
      
      <table width="100%" border="0" cellpadding="0" cellspacing="0" style="padding-left:10px">
        <tr>
          <td height="22"><img src="/Admin/Images/flag.jpg" align="absmiddle"> <a target="_blank" href="/news/${data.id}.html" title="文章标题：用友ERP成功应用在飞龙糖酒&#13发布时间：2012-05-12 15:39:57&#13查看次数：1643" class="blackbig"><font color=>${data.title }</font></a></td>
          <td align="right">${data.createTimeMMDD } </td>
        </tr>
		<tr>
          <td height="1" colspan="2"  background="/Admin/Images/jiange.gif"></td>
        </tr>
      </table>
      </td>
  </tr>
  </c:forEach>
</table>
</div></td></tr></TBODY></table></td>
                            <td background=image/index_hs_zh_64.jpg 
                            width=15></td></tr>
                          <tr>
                            <td><IMG alt="" 
                              src="image/index_hs_zh_81.jpg" width=5 
                              height=6></td>
                            <td background=image/index_hs_zh_82.jpg 
                            width=532></td>
                            <td width=15><IMG alt="" 
                              src="image/index_hs_03.jpg" width=15 
                              height=6></td></tr></TBODY></table></td>
                      <td width=9></td></tr></TBODY></table></td></tr></TBODY></table></td></tr>
</TBODY></table></td>
    
           
                     