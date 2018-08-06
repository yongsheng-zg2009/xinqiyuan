<!--#include file = "../Include/DBClass.inc.asp"-->

<%
' =============================================================
' Made By Xiasp & 三峡在线 http://www.sxzx.net/ QQ群：8617001
' =============================================================
%>

<%
Dim s_keyword, s_cataid, s_bystr
s_keyword = GetSafeStr(Trim(Request("keyword")))
s_cataid = GetSafeStr(Trim(Request("cataid")))
s_bystr = GetSafeStr(Trim(Request("bystr")))

Dim Pmcount,Pageno
'//设置新闻显示数量
Pmcount = News_Front_Count

%>

<HTML>
<HEAD>
<TITLE><%=Homepage_Title%>-搜索结果</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
<link rel="stylesheet" href="/Css/Style.css" type="text/css">
</HEAD>

<BODY LeftMargin=0 TopMargin=0 Background="../images/bg.gif">
<!--#include file = "../Include/Header.asp"-->
<table width="778" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#FFFFFF">
  <tr> 
    <td height="100" background="../images/av_news.jpg">
      <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="777" height="100">
        <param name=movie value="../images/movie.swf">
        <param name=quality value=high>
        <param name="wmode" value="transparent">
        <param name="menu" value="false">
        <embed src="../images/movie.swf" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="777" height="100" wmode="transparent" menu="false">
        </embed> 
      </object></td>
  </tr>
</table>
<table cellspacing=0 cellpadding=0 width=770 align=center border=0 bgcolor="#FFFFFF">
  <tbody> 
  <tr> 
    <td valign=top width=173 bgcolor=#F5F5F5> 
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody>
          <tr>
            <td background="../images/line_3.gif" height=1></td>
          </tr>
          <tr>
            <td bgcolor=#f5f5f5 height=30>
              <table width="180" border="0" cellspacing="0" cellpadding="0" align="center">
                <form action="searchresult.asp" method="post" name="searchLeftForm">
                  <tr bgcolor="CAF6F4" align="center">
                    <td height="25" background="images/bg_1.gif"><font color="#cc0000"><b>□ 站 内 搜 索 □</b></font></td>
                  </tr>
                  <tr align="center">
                    <td style="line-height:150%" height=60> 请输入查询的字符串:<br>
                        <input type="text" name="keyword" style="width:150" class="button1">
                    </td>
                  </tr>
                  <tr align="center">
                    <td>
<select name="cataid" class="button1" id="cataid" style="width:150">
<option value="" selected>==&gt; 综合查询 &lt;==</option>
<%
	'开始读取数据库中已经定义的新闻类别
	'其实这么写，感觉太没有效率了，应该定义一个子程序
	
	Dim gRs, gSql, k, TempCataStr
	Set gRs = Server.CreateObject( "ADODB.Recordset" )
	gSql = "SELECT * FROM NewsCata WHERE C_ID <> 1 ORDER BY C_RootID"
	gRs.Open gSql, oConn, 1, 3
	Do While Not gRs.EOF	
		TempCataStr = "<option value='"&Trim(gRs("C_RootID"))&"'"
		If Trim(gRs("C_RootID")) = Trim(s_cataid) Then TempCataStr = TempCataStr&" selected"
		TempCataStr = TempCataStr&">"
		TempCataStr = TempCataStr&"&nbsp;|&nbsp;|"
		
		For k = 1 To Int(Len(Trim(gRs("C_RootID")))/4) - 1
			TempCataStr = TempCataStr&"&nbsp;|"
		Next

		TempCataStr = TempCataStr&"_"&Trim(gRs("C_Title"))&"</option>"
		Response.Write TempCataStr
			
	gRs.MoveNext
	Loop 
  	gRs.Close
  	Set gRs = Nothing
%>
                        </select>
                      <br>
                      <br>
                      <input name="bystr" type="radio" value="title" checked>
                标题查询
                <input type="radio" name="bystr" value="content">
                内容查询 <br>
                <br>
                <input type="SUBMIT" name="Action" value=" 查 询 " class="button2">
                <input type="RESET" name="Clear" value=" 重 写 " class="button2">
                    </td>
                  </tr>
                  <tr align="center">
                    <td height="10"></td>
                  </tr>
                </form>
            </table></td>
          </tr>
          <tr>
            <td bgcolor=#f5f5f5>
              <table cellspacing=0 cellpadding=0 width="80%" align=center border=0>
                <tbody>
                  <tr>
                    <td width="100%" background="../images/line_3.gif" height=1></td>
                  </tr>
                
            </table></td>
          </tr>
        
      </table></td>
    <td valign=top bgcolor=#ffffff style="border-left:1px #000000 dotted"><br>
      <table cellspacing=0 cellpadding=0 width=596 border=0>
        <tbody> 
        <tr> 
          <td valign=top> 
            <table cellspacing=0 cellpadding=0 width="96%" align=center border=0>
              <tbody> 
              <tr> 
                <td><img src="../images/title_result.gif" width="550" height="78"></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="10" cellpadding="0">
                  <tr>
                    <td>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#E1F0FF">
                        <form name="search" method="post" action="SearchResult.asp">
                          <tr>
                            <td height="20">搜索结果如下：</td>
                            </tr>
                        </form>
                      </table>
                      <br>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0" bordercolordark="#FFFFFF" bordercolorlight="#000000" style="word-break:break-all;">
                        <%
If News_Check = 1 Then
	If s_bystr ="title" Then
		If s_keyword <> "" Then
			sSql = "SELECT * FROM NewsData WHERE D_CataID LIKE '"&s_cataid&"%' and D_Title LIKE '%"&s_keyword&"%' and D_Num = 1 ORDER BY D_SortID DESC"
		Else
			sSql = "SELECT * FROM NewsData WHERE D_CataID LIKE '"&s_cataid&"%' and D_Num = 1 ORDER BY D_SortID DESC"
		End If
	Else
		If s_keyword <> "" Then
			sSql = "SELECT * FROM NewsData WHERE D_CataID LIKE '"&s_cataid&"%' and D_Content LIKE '%"&s_keyword&"%' and D_Num = 1 ORDER BY D_SortID DESC"
		Else
			sSql = "SELECT * FROM NewsData WHERE D_CataID LIKE '"&s_cataid&"%' and D_Num = 1 ORDER BY D_SortID DESC"
		End If
	End If
Else
	If s_bystr ="title" Then
		If s_keyword <> "" Then
			sSql = "SELECT * FROM NewsData WHERE D_CataID LIKE '"&s_cataid&"%' and D_Title LIKE '%"&s_keyword&"%' ORDER BY D_SortID DESC"
		Else
			sSql = "SELECT * FROM NewsData WHERE D_CataID LIKE '"&s_cataid&"%' ORDER BY D_SortID DESC"
		End If
	Else
		If s_keyword <> "" Then
			sSql = "SELECT * FROM NewsData WHERE D_CataID LIKE '"&s_cataid&"%' and D_Content LIKE '%"&s_keyword&"%' ORDER BY D_SortID DESC"
		Else
			sSql = "SELECT * FROM NewsData WHERE D_CataID LIKE '"&s_cataid&"%' ORDER BY D_SortID DESC"
		End If
	End If
End If

oRs.Open sSql, oConn, 1, 1

Dim Rcount, Loopno, Mpage
Rcount = oRs.Recordcount

If Pmcount="" or isempty(Pmcount) or Pmcount<1 then
        Pmcount=20
End If
	oRs.Pagesize = pmcount   	'设置每页数
	Mpage = oRs.Pagecount    	'得到总页数
	Pageno = GetSafeInt(Request("Pageno"),1)
	
If Cint(Pageno) < 1  Then Pageno = 1
If Cint(Pageno) > Mpage Then Pageno = Mpage

If oRs.Bof and oRs.Eof then
	Response.write "<tr><td colspan='6'>&nbsp;&nbsp;暂时没有任何新闻！</td></tr>"
Else
	oRs.Absolutepage = Pageno	'将指针移至指定页的第一条记录
	Loopno = Pmcount
	Do While Not oRs.Eof and Loopno > 0
%>
                        <tr>
                          <td width="3%" height="24"><img height=6 src="../images/pot_1.gif" width="4" nowrap></td>
                          <td width="97%" background="images/bg.gif" height=24> <a href='Show.asp?id=<%=oRs("D_ID")%>' class='tt1' target='_blank'>
                            <%Response.Write oRs("D_Title")%>
                            </a>
                              <%
							if Trim(oRs("D_SavePathFileName"))<>"" then
								Response.Write " <img src='images/news.gif' border=0>"
							end if
							%>
                              <a title="<%=oRs("D_AddTime")%>"><font color="#FF9900">[ </font><font color=#FF9900><%=FormatDateTime(oRs("D_AddTime"),vbshortdate)%> 浏览：<%=oRs("D_Hits")%> ]</font></a></td>
                        </tr>
                        <%
		oRs.Movenext						
		Loopno=Loopno-1
		Loop		
		
		oRs.Close
		Set oRs=Nothing
End if
%>
                      </table>
                      <br>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#E1F0FF">
                        <form name="pageform" method="post" action="SearchResult.asp">
                          <tr>
                            <td height="25">
                              <div align="left">&nbsp;&nbsp;共&nbsp;<%=Cstr(rcount)%>&nbsp;条新闻&nbsp;当前为：<font color="#FF0000"><%=Cstr(Pageno)&"</font>/"&Cstr(Mpage)%>页 每页 <%=pmcount%> 条</font></div></td>
                            <td>
                              <div align="right">
                                <%If Cint(Pageno)>1 Then%>
                                <font face="Webdings" color="#FF0000">7</font>&nbsp;<a href='?cataid=<%=s_cataid%>&keyword=<%=s_keyword%>&bystr=<%=s_bystr%>&pageno=<%=Pageno-1%>' class="tt5">上一页</a>
                                <%End If
								  If Cint(Pageno) < Cint(Mpage) Then
								  %>
                                <font face="Webdings" color="#FF0000">8</font>&nbsp;<a href='?cataid=<%=s_cataid%>&keyword=<%=s_keyword%>&bystr=<%=s_bystr%>&pageno=<%=Pageno+1%>' class="tt5">下一页</a>
                                <%End If%>
                跳到第&nbsp;
                <input type=text size=3 name="pageno" value="<%=pageno%>" class="button1">&nbsp;页&nbsp;
         	 	<input type="hidden" name="cataid" value="<%=s_cataid%>">
          		<input type="hidden" name="keyword" value="<%=s_keyword%>">
				<input type="hidden" name="bystr" value="<%=s_bystr%>">
                <input name="imageField2" type="image" src="../Images/Go.gif" border="0" align="absmiddle">
                            </div></td>
                          </tr>
                        </form>
                    </table></td>
                  </tr>
                </table> </td>
              </tr>
               
            </table>
          </td>
        </tr>
         
      </table>
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td bgcolor=#9ac7cf height=1></td>
        </tr>
         
      </table>
    </td>
  </tr>
   
</table>
<!--#include file = "../Include/Footer.asp"-->
<%
Call Footer()
%>
