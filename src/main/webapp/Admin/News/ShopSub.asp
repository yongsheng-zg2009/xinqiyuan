<%
sub carshow(T_CataID,Pmcount,more,T_Special,page,T_title)
%>
<style type="text/css">
<!--
.utd {
	color: #000066;
}
.utd2 {
	color: #FF3300;
}
-->
</style>

<table width="100%" border="0" cellpadding="0" cellspacing="1"   style="word-break:break-all;">
  <%
dim s_keyword,Pageno,lh
lh=7
Pmcount=Pmcount*3
If T_Special = "ok" Then		
	sSql = "SELECT  * FROM ProductData WHERE D_CataID LIKE '"&T_CataID&"%' And D_Special =1 ORDER BY D_SortID DESC"
Else
If T_Special = "hot" Then
	sSql = "SELECT * FROM ProductData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_SortID DESC"
Else
	sSql = "SELECT  * FROM ProductData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Picture <> '' ORDER BY D_ID DESC"
End If
End If
Set oRs = Server.CreateObject( "ADODB.Recordset" )
oRs.Open sSql, oConn, 1, 1
Dim Rcount, Loopno, Mpage
Rcount = oRs.Recordcount
oRs.Pagesize = pmcount   	'设置每页数
Mpage = oRs.Pagecount    	'得到总页数
Pageno = GetSafeInt(Request("Pageno"),1)
If Cint(Pageno) < 1  Then Pageno = 1
If Cint(Pageno) > Mpage Then Pageno = Mpage
If oRs.Bof and oRs.Eof then
	Response.write "<tr><td colspan='6'>&nbsp;&nbsp;暂时没有任何新闻！</td></tr>"
Else
	oRs.Absolutepage = Pageno	'将指针移至指定页的第一条记录
	Loopno = Pmcount/3
	Do While Not oRs.Eof and Loopno > 0
%>
  <tr>
    <td align="center" valign="bottom">
      <% if not (oRs.eof) then %>
      <table  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center" valign="middle"><table width="135" height="115" border="0" cellpadding="0" cellspacing="1">
              <tr>
                <td align="center" valign="middle" background="images/roombg.gif"><a href="Mall_Show.asp?id=<%=oRs("D_id")%>&cataid=<%=oRs("D_CataID")%>"><img  src="<%=oRs("D_Picture")%>" width="120" height="100" border="1"></a></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td align="center" valign="middle"><table height="50" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td>品名：</td>
                <td class="utd"><%=left(oRs("D_Title"),lh)%></td>
              </tr>
              <tr>
                <td>价格：</td>
                <td class="utd2"><%=oRs("Price")%>￥</td>
              </tr>
          </table></td>
        </tr>
      </table>
      <% 
	  oRs.MoveNext
	  end if
	%>
    </td>
    <td align="center" valign="bottom"><% if not (oRs.eof) then %>
        <table  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center" valign="middle">
              <table width="135" height="115" border="0" cellpadding="0" cellspacing="1">
                <tr>
                  <td align="center" valign="middle" background="images/roombg.gif"><a href="Mall_Show.asp?id=<%=oRs("D_id")%>&cataid=<%=oRs("D_CataID")%>"><img  src="<%=oRs("D_Picture")%>" width="120" height="100" border="1"></a></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td align="center" valign="middle"><table height="50" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td>品名：</td>
                  <td class="utd"><%=left(oRs("D_Title"),lh)%></td>
                </tr>
                <tr>
                  <td>价格：</td>
                  <td class="utd2"><%=oRs("Price")%>￥</td>
                </tr>
            </table></td>
          </tr>
        </table>
        <% 
	  oRs.MoveNext
	  end if
	%></td>
    <td align="center" valign="bottom"><% if not (oRs.eof) then %>
        <table  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center" valign="middle"><table width="135" height="115" border="0" cellpadding="0" cellspacing="1">
                <tr>
                  <td align="center" valign="middle" background="images/roombg.gif"><a href="Mall_Show.asp?id=<%=oRs("D_id")%>&cataid=<%=oRs("D_CataID")%>"><img  src="<%=oRs("D_Picture")%>" width="120" height="100" border="1"></a></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td align="center" valign="middle"><table height="50" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td>品名：</td>
                  <td class="utd"><%=left(oRs("D_Title"),lh)%></td>
                </tr>
                <tr>
                  <td>价格：</td>
                  <td class="utd2"><%=oRs("Price")%>￥</td>
                </tr>
            </table></td>
          </tr>
        </table>
        <% 
	  oRs.MoveNext
	  end if
	%>
    </td>
  </tr>
  <%
		Loopno=Loopno-1
		Loop		
		oRs.Close
		Set oRs=Nothing
		End if
		%>
</table>
<% if page="ok" then %>
<table border="0" align="left" cellpadding="0" cellspacing="0">
                <form name="pageform" method="post" action="">
                  <tr>
                    <td height="25">
                      <div align="left">&nbsp;&nbsp;共&nbsp;<%=Cstr(rcount)%>&nbsp;条信息&nbsp;当前为：<font color="#FF0000"><%=Cstr(Pageno)&"</font>/"&Cstr(Mpage)%>页 每页 <%=pmcount%> 条</font></div></td>
                    <td>                      <div align="right">
                        <%If Cint(Pageno)>1 Then%>
                        <font face="Webdings" color="#FF0000">7</font>&nbsp;<a href='?cataid=<%=s_cataid%>&keyword=<%=s_keyword%>&pageno=<%=Pageno-1%>' class="tt5">上一页</a>
                        <%End If
								  If Cint(Pageno) < Cint(Mpage) Then
								  %>
                        <font face="Webdings" color="#FF0000">8</font>&nbsp;<a href='?cataid=<%=s_cataid%>&keyword=<%=s_keyword%>&pageno=<%=Pageno+1%>' class="tt5">下一页</a>
                        <%End If%>
                跳到第&nbsp;
                <input type=text size=3 name="Pageno" value="<%=pageno%>" class="button1">&nbsp;页&nbsp;
                <input type="hidden" name="cataid" value="<%=T_CataID%>">
                <input type="hidden" name="keyword2" value="<%=s_keyword%>">
				<input type="submit" name="Submit" value="确定">
				</div></td>
                  </tr>
                </form>
</table>
<% end if %>
<% end sub %>

