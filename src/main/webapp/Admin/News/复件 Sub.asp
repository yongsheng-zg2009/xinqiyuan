<%
sub twoimg(T_CataID,Pmcount,T_Special)
%>
<table width="100%" border="0" cellpadding="2" cellspacing="1"   style="word-break:break-all;">
  <%
If T_Special = "ok" Then		
	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' And D_Special =1 ORDER BY D_SortID DESC"
Else
If T_Special = "hot" Then
	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_SortID DESC"
Else
	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Picture <> '' ORDER BY D_ID DESC"
End If
End If
Set oRs = Server.CreateObject( "ADODB.Recordset" )
oRs.Open sSql, oConn, 1, 1
Dim Rcount, Loopno, Mpage
If oRs.Bof and oRs.Eof then
	Response.write "<tr><td colspan='6'>&nbsp;&nbsp;暂时没有任何信息！</td></tr>"
Else
	Do While Not oRs.Eof
%>
  <tr align="center">
    <td valign="bottom">
      <% if not (oRs.eof) then 
	  %>
      <table width="60" height="60" border="0" cellpadding="1" cellspacing="1" bgcolor="c0c0c0">
        <tr>
          <td bgcolor="#FFFFFF"><a href="<%=oRs("D_Picture")%>" target="_blank"><img  src="<%=oRs("D_Picture")%>" width="110" height="87" border="0"></a></td>
        </tr>
      </table>
      <table width="110" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="20" align="center" valign="bottom"><%=oRs("D_Title")%></td>
        </tr>
      </table>
      <%
	  oRs.MoveNext
	  end if
	%></td>
    <td valign="bottom"><% if not (oRs.eof) then 
	  %>
        <table width="60" height="60" border="0" cellpadding="1" cellspacing="1" bgcolor="c0c0c0">
          <tr>
            <td bgcolor="#FFFFFF"><a href="<%=oRs("D_Picture")%>" target="_blank"><img  src="<%=oRs("D_Picture")%>" width="110" height="87" border="0"></a></td>
          </tr>
        </table>
        <table width="110" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="20" align="center" valign="bottom"><%=oRs("D_Title")%></td>
          </tr>
      </table>
        <%
	  oRs.MoveNext
	  end if
	%></td>
  </tr>
  <%
		Loop		
		oRs.Close
		Set oRs=Nothing
		End if
		%>
</table>
<% end sub %>


<%
sub carshow(T_CataID,Pmcount,more,T_Special,page,T_title)
%>

<table width="487" border="0" cellpadding="2" cellspacing="1"   style="word-break:break-all;">
  <%
dim s_keyword,Pageno,lh
lh=7
If T_Special = "ok" Then		
	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' And D_Special =1 ORDER BY D_SortID DESC"
Else
If T_Special = "hot" Then
	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_SortID DESC"
Else
	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Picture <> '' ORDER BY D_ID DESC"
End If
End If
Set oRs = Server.CreateObject( "ADODB.Recordset" )
oRs.Open sSql, oConn, 1, 1
Dim Rcount, Loopno, Mpage
If Cint(Pageno) < 1  Then Pageno = 1
If Cint(Pageno) > Mpage Then Pageno = Mpage
If oRs.Bof and oRs.Eof then
	Response.write "<tr><td colspan='6'>&nbsp;&nbsp;暂时没有任何信息！</td></tr>"
Else
	Do While Not oRs.Eof
%>
  <tr>
    <td width="50%" valign="bottom">
      <% if not (oRs.eof) then 
	  response.Write "<img src=""img/zm_07.gif"" hspace=""2""> " 
	  response.Write "<a href=view.asp?id="&oRs("D_id")&"&cataid="&oRs("D_CataID")&">"&oRs("D_Title")&"</a>"
	  oRs.MoveNext
	  end if
	%></td>
    <td width="50%" valign="bottom">
      <% if not (oRs.eof) then 
	  response.Write "<img src=""img/zm_07.gif"" hspace=""2""> " 
	  response.Write "<a href=view.asp?id="&oRs("D_id")&"&cataid="&oRs("D_CataID")&">"&oRs("D_Title")&"</a>"
	  oRs.MoveNext
	  end if
	%></td>
  </tr>
  <%
		Loop		
		oRs.Close
		Set oRs=Nothing
		End if
		%>
</table>
<% end sub %>


<%
sub xg(T_CataID,Pmcount,more,T_Special,page,T_title)
%>
<table width="520" border="0" cellpadding="2" cellspacing="1"   style="word-break:break-all;">
  <%
dim s_keyword,Pageno,lh
lh=7
If T_Special = "ok" Then		
	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' And D_Special =1 ORDER BY D_SortID DESC"
Else
If T_Special = "hot" Then
	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_SortID DESC"
Else
	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Picture <> '' ORDER BY D_ID DESC"
End If
End If
Set oRs = Server.CreateObject( "ADODB.Recordset" )
oRs.Open sSql, oConn, 1, 1
Dim Rcount, Loopno, Mpage
If Cint(Pageno) < 1  Then Pageno = 1
If Cint(Pageno) > Mpage Then Pageno = Mpage
If oRs.Bof and oRs.Eof then
	Response.write "<tr><td colspan='6'>&nbsp;&nbsp;暂时没有任何信息！</td></tr>"
Else
	Do While Not oRs.Eof
%>
  <tr align="center">
    <td width="25%" valign="bottom">
      <% if not (oRs.eof) then 
	  %>
      <table width="90" height="90" border="0" cellpadding="1" cellspacing="1" bgcolor="c0c0c0">
        <tr>
          <td bgcolor="#FFFFFF"><a href="view.asp?id=<%=oRs("D_id")%>&cataid=<%=oRs("D_CataID")%>"><img  src="<%=oRs("D_Picture")%>" width="100" height="90" border="0"></a></td>
        </tr>
      </table>
      <%
	  oRs.MoveNext
	  end if
	%></td>
    <td width="25%" valign="bottom"><% if not (oRs.eof) then 
	  %>
        <table width="90" height="90" border="0" cellpadding="1" cellspacing="1" bgcolor="c0c0c0">
          <tr>
            <td bgcolor="#FFFFFF"><a href="view.asp?id=<%=oRs("D_id")%>&cataid=<%=oRs("D_CataID")%>"><img  src="<%=oRs("D_Picture")%>" width="100" height="90" border="0"></a></td>
          </tr>
        </table>
        <%
	  oRs.MoveNext
	  end if
	%></td>
    <td width="25%" valign="bottom">
      <% if not (oRs.eof) then 
	  %>
      <table width="90" height="90" border="0" cellpadding="1" cellspacing="1" bgcolor="c0c0c0">
        <tr>
          <td bgcolor="#FFFFFF"><a href="view.asp?id=<%=oRs("D_id")%>&cataid=<%=oRs("D_CataID")%>"><img  src="<%=oRs("D_Picture")%>" width="100" height="90" border="0"></a></td>
        </tr>
      </table>
      <%
	  oRs.MoveNext
	  end if
	%></td>
    <td width="25%" valign="bottom"><% if not (oRs.eof) then 
	  %>
        <table width="90" height="90" border="0" cellpadding="1" cellspacing="1" bgcolor="c0c0c0">
          <tr>
            <td bgcolor="#FFFFFF"><a href="view.asp?id=<%=oRs("D_id")%>&cataid=<%=oRs("D_CataID")%>"><img  src="<%=oRs("D_Picture")%>" width="100" height="90" border="0"></a></td>
          </tr>
        </table>
        <%
	  oRs.MoveNext
	  end if
	%></td>
  </tr>
  <%
		Loop		
		oRs.Close
		Set oRs=Nothing
		End if
		%>
</table>
<% end sub %>


<%
sub toppic(T_CataID,Pmcount,T_Special)
%>
<table width="100%" border="0" align="center"  valign="bottom"cellpadding="0" cellspacing="0"   style="word-break:break-all;">
  <%
dim lh
lh=7
If T_Special = "ok" Then		'热点含图片特别新闻
	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' And D_Special =1 and D_Picture <> '' ORDER BY D_SortID DESC"
ElseIf T_Special = "top" Then		'最新含图片特别新闻
	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' And D_Special =1 and D_Picture <> '' ORDER BY D_ID DESC"
ElseIf T_Special = "hot" Then		'最亲含图片新闻
	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_SortID DESC"
Else							'最新含图片新闻
	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Picture <> '' ORDER BY D_ID DESC"
End If
Set oRs = Server.CreateObject( "ADODB.Recordset" )
oRs.Open sSql, oConn, 1, 1
Dim Rcount, Mpage
If oRs.Bof and oRs.Eof then
	Response.write "<tr><td colspan='6'>&nbsp;&nbsp;暂时没有任何信息！</td></tr>"
Else
	Do While Not oRs.Eof
%>
  <tr align="left">
    <td valign="top">
      <% if not (oRs.eof) then 
	  %>
      <table width="95%" border="0" cellspacing="0" cellpadding="0" align=center valign=bottom>
        <tr>
          <td width="120" rowspan="2" valign=top><table border="0" cellpadding="2" cellspacing="1" bgcolor="c0c0c0">
            <tr valign=top>
              <td bgcolor="#FFFFFF" valign=top><img src="<%=oRs("D_Picture")%>" width="120" height="100" border="0"></td>
            </tr></table>
		  </td>
		  <TD width=8 rowspan="2" align="left"><IMG height=100 src="img/r01.gif" width=6 border=0> </TD>
		  <TD height=18><b><a href="SceneView.asp?id=<%=oRs("D_ID")%>&cataid=<%=oRs("D_CataID")%>"><font color=#FF0000><%=oRs("D_Title")%></font></a></b></TD></TR>
		  <TR>
			<TD style="line-height:150%" valign="top">&nbsp;&nbsp;&nbsp;<%=Left(oRs("E_Title"),45)&"..."%></TD>
		  </TR>
      </table>
      <%
	  oRs.MoveNext
	  end if
	%></td>
  </tr>
  <%
		Loop		
		oRs.Close
		Set oRs=Nothing
		End if
		%>
</table>
<% end sub %>

<%
sub toplistcata(T_CataID,Pmcount,strlen,T_Special)
%>
<table width="100%" border="0" align="right" cellpadding="0" cellspacing="0"   style="word-break:break-all;">
  <%
dim lh
lh=7
If News_Check = 1 Then
	If T_Special = "ok" Then		
		sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' And D_Special =1  and D_Num = 1 ORDER BY D_SortID DESC"
	ElseIf T_Special = "hot" Then
		sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Num = 1 ORDER BY D_Hits DESC"
	Else	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Num = 1 ORDER BY D_ID DESC"
	End If
Else
	If T_Special = "ok" Then		
		sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' And D_Special =1 ORDER BY D_SortID DESC"
	ElseIf T_Special = "hot" Then
		sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_Hits DESC"
	Else	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_ID DESC"
	End If
End if

Set oRs = Server.CreateObject( "ADODB.Recordset" )
oRs.Open sSql, oConn, 1, 1
Dim Rcount, Mpage,theday,ss_newsid
If oRs.Bof and oRs.Eof then
	Response.write "<tr><td colspan='6'>&nbsp;&nbsp;暂时没有任何信息！</td></tr>"
Else
	Do While Not oRs.Eof and pmcount>0
if pmcount<=0 then exit do
theday=oRs("D_AddTime")
ss_newsid=oRs("D_ID")
%>
  <tr align="center">
    <td valign="bottom">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
        <tr>
          <td height="22"><img src="/admin/Images/flag.gif" border="0" align="absmiddle" />&nbsp;<FONT COLOR="#000000">[<a href='NewsDir.asp?cataid=<%=oRs("D_cataid")%>' class='tt1'><FONT COLOR="#006600"><%call GetCataNames(ss_newsid)%></FONT></a>]</FONT> <a target="_blank" href="NewsView.asp?id=<%=oRs("D_id")%>&cataid=<%=oRs("D_CataID")%>" title="文章标题：<%=oRs("D_Title")%>&#13;发布时间：<%=oRs("D_AddTime")%>&#13;查看次数：<%=oRs("D_Hits")%>"><font color=<%=oRs("D_Title_color")%>><%=left(oRs("D_Title"),strlen)%></font></a>
		  <%
				if	(oRs("D_Icon")<>"") Then 
			%>
				<img src='<%=oRs("D_Icon")%>'>
			<%
				End if
			%>
		  </td>
          <td align="right"><%=Month(FormatDateTime(oRs("D_AddTime"),2))&"."&Day(FormatDateTime(oRs("D_AddTime"),2))%></td>
        </tr>
		<tr>
          <td height="1" colspan="2"  background="/Admin/Images/jiange.gif"></td>
        </tr>
      </table>
</td>
  </tr>
  <%oRs.MoveNext
pmcount=pmcount-1
		Loop		
		oRs.Close
		set oRs=nothing
		End if
		%>
</table>
<% end sub %>
<%
sub toplistpage(T_CataID,Pmcount,strlen,T_Special,sPage)
%>
<table width="100%" border="0" align="right" cellpadding="0" cellspacing="0"   style="word-break:break-all;">
  <%
dim lh
lh=7
If News_Check = 1 Then
	If T_Special = "ok" Then		
		sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' And D_Special =1  and D_Num = 1 ORDER BY D_SortID DESC"
	ElseIf T_Special = "hot" Then
		sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Num = 1 ORDER BY D_Hits DESC"
	Else	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Num = 1 ORDER BY D_ID DESC"
	End If
Else
	If T_Special = "ok" Then		
		sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' And D_Special =1 ORDER BY D_SortID DESC"
	ElseIf T_Special = "hot" Then
		sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_Hits DESC"
	Else	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_ID DESC"
	End If
End if

Set oRs = Server.CreateObject( "ADODB.Recordset" )
oRs.Open sSql, oConn, 1, 1
Dim Rcount, Mpage,theday
If oRs.Bof and oRs.Eof then
	Response.write "<tr><td colspan='6'>&nbsp;&nbsp;暂时没有任何信息！</td></tr>"
Else
	Do While Not oRs.Eof and pmcount>0
if pmcount<=0 then exit do
theday=oRs("D_AddTime")
%>
  <tr align="center">
    <td valign="bottom">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
        <tr>
          <td height="22">&nbsp;<img src="/admin/Images/flag.gif" border="0" align="absmiddle" /> <a target="_blank" href="<%=sPage%>?id=<%=oRs("D_id")%>&cataid=<%=oRs("D_CataID")%>" title="文章标题：<%=oRs("D_Title")%>&#13;发布时间：<%=oRs("D_AddTime")%>&#13;查看次数：<%=oRs("D_Hits")%>"><font color=<%=oRs("D_Title_color")%>><%=left(oRs("D_Title"),strlen)%></font></a>
		  </td>
        </tr>
		<!-- <TR><TD background=/Admin/Images/jiange.gif height=1></TD></TR> -->
      </table>
</td>
  </tr>
  <%oRs.MoveNext
pmcount=pmcount-1
		Loop		
		oRs.Close
		set oRs=nothing
		End if
		%>
</table>
<% end sub %>
<%
sub toplist(T_CataID,Pmcount,strlen,T_Special)
%>
<table width="100%" border="0" align="right" cellpadding="0" cellspacing="0"   style="word-break:break-all;">
  <%
dim lh
lh=7
If News_Check = 1 Then
	If T_Special = "ok" Then		
		sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' And D_Special =1  and D_Num = 1 ORDER BY D_SortID DESC"
	ElseIf T_Special = "hot" Then
		sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Num = 1 ORDER BY D_Hits DESC"
	Else	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Num = 1 ORDER BY D_ID DESC"
	End If
Else
	If T_Special = "ok" Then		
		sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' And D_Special =1 ORDER BY D_SortID DESC"
	ElseIf T_Special = "hot" Then
		sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_Hits DESC"
	Else	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_ID DESC"
	End If
End if

Set oRs = Server.CreateObject( "ADODB.Recordset" )
oRs.Open sSql, oConn, 1, 1
Dim Rcount, Mpage,theday
If oRs.Bof and oRs.Eof then
	Response.write "<tr><td colspan='6'>&nbsp;&nbsp;暂时没有任何信息！</td></tr>"
Else
	Do While Not oRs.Eof and pmcount>0
if pmcount<=0 then exit do
theday=oRs("D_AddTime")
%>
  <tr align="center">
    <td valign="bottom">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
        <tr>
          <td height="22">&nbsp;<B>&middot;</B> <a target="_blank" href="NewsView.asp?id=<%=oRs("D_id")%>&cataid=<%=oRs("D_CataID")%>" title="文章标题：<%=oRs("D_Title")%>&#13;发布时间：<%=oRs("D_AddTime")%>&#13;查看次数：<%=oRs("D_Hits")%>"><font color=<%=oRs("D_Title_color")%>><%=left(oRs("D_Title"),strlen)%></font><%
				if	(oRs("D_Icon")<>"") Then 
			%>
				<img src='<%=oRs("D_Icon")%>' border=0>
			<%
				End if
			%>&nbsp;<FONT COLOR="#8C8C8C">(<%=Month(FormatDateTime(oRs("D_AddTime"),2))&"."&Day(FormatDateTime(oRs("D_AddTime"),2))%>)</FONT></a>
		  </td>
        </tr>
		<TR><TD  background="/Admin/Images/jiange.gif"></td></tr>
      </table>
</td>
  </tr>
  <%oRs.MoveNext
pmcount=pmcount-1
		Loop		
		oRs.Close
		set oRs=nothing
		End if
		%>
</table>
<% end sub %>
<%
sub toplist_date(T_CataID,Pmcount,strlen,T_Special,UrlPage)
%>
<table width="97%" border="0" cellpadding="0" cellspacing="0"   style="word-break:break-all;" valign="top">
  <%
dim lh
lh=7
If News_Check = 1 Then
	If T_Special = "ok" Then		
		sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' And D_Special =1 and D_Num = 1 ORDER BY D_SortID DESC"
	ElseIf T_Special = "top" Then
		sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' And D_Special <>1 and D_Num = 1 ORDER BY D_SortID DESC"
	ElseIf T_Special = "hot" Then
		sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Num = 1 ORDER BY D_SortID DESC"
	Else
		sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Num = 1 ORDER BY D_ID DESC"
	End If
Else
	If T_Special = "ok" Then		
		sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' And D_Special =1 ORDER BY D_SortID DESC"
	ElseIf T_Special = "top" Then
		sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' And D_Special <>1 ORDER BY D_SortID DESC"
	ElseIf T_Special = "hot" Then
		sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_SortID DESC"
	Else
		sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_ID DESC"
	End If
	
End if
Set oRs = Server.CreateObject( "ADODB.Recordset" )
oRs.Open sSql, oConn, 1, 1
Dim Rcount, Mpage
If oRs.Bof and oRs.Eof then
	Response.write "<tr><td colspan='6'>&nbsp;&nbsp;暂时没有任何信息！</td></tr>"
Else
	Do While Not oRs.Eof
%>
  <tr align="center">
    <td width="25%" valign="bottom">
      <% if not (oRs.eof) then 
	  %>
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="22"><img src="/admin/Images/flag.gif" align="absmiddle">&nbsp;&nbsp;<a target="_blank" href="<%=UrlPage%>?id=<%=oRs("D_id")%>&cataid=<%=oRs("D_CataID")%>" title="文章标题：<%=oRs("D_Title")%>&#13发布时间：<%=oRs("D_AddTime")%>&#13查看次数：<%=oRs("D_Hits")%>" class="blackbig"><font color=<%=oRs("D_Title_color")%>><%=left(oRs("D_Title"),strlen)%></font></a>
			<%
				if	(oRs("D_Icon")<>"") Then 
			%>
				<img src='<%=oRs("D_Icon")%>'>
			<%
				End if
			%>
		  </td>
          <td align="right"><FONT COLOR="#8C8C8C"><%=Month(FormatDateTime(oRs("D_AddTime"),2))&"."&Day(FormatDateTime(oRs("D_AddTime"),2))%></font></td>
        </tr>
		<tr>
          <td height="0" colspan="2"  background="/Admin/Images/jiange.gif" ></td>
        </tr>
      </table>
      <%
	  oRs.MoveNext
	  end if
	%></td>
  </tr>
  <%
		Loop		
		oRs.Close
		End if
		%>
</table>
<% end sub %>
<%
sub toplist_date1(T_CataID,Pmcount,strlen,T_Special)
%>
<table width="85%" border="0" cellpadding="0" cellspacing="0" align="center" valign="top">
		<TR>
          <TD height="6"></TD>
        </TR>
<%
If T_Special = "ok" Then		
	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' And D_Special =1 ORDER BY D_SortID DESC"
Else
	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_SortID DESC"
End If
Set oRs = Server.CreateObject( "ADODB.Recordset" )
oRs.Open sSql, oConn, 1, 1
Dim Rcount, Mpage
If oRs.Bof and oRs.Eof then
	Response.write "<tr><td colspan='3'>&nbsp;&nbsp;暂时没有任何通知公告！</td></tr>"
Else
	Do While Not oRs.Eof
%>

      <% if not (oRs.eof) then 
	  %>
  <tr>
    <td style="line-height:150%"><a target="_blank" href="NoticeView.asp?id=<%=oRs("D_id")%>&cataid=<%=oRs("D_CataID")%>" title="<%=oRs("D_Title")%>" ><%=left(oRs("D_Content"),strlen)%>……</a></td>
  </tr>
 <tr><td align="right"><a href="NoticeView.asp?id=<%=oRs("D_id")%>&cataid=<%=oRs("D_CataID")%>" target="_blank"><font color="#FF0000">查看详细&raquo;</font></a>&nbsp;&nbsp;</td>
   </tr>
      <%
	  oRs.MoveNext
	  end if
	%>
  <%
		Loop		
		oRs.Close
		End if
		%>
</table>
<% end sub %>
<%
sub smallpic(T_CataID,Pmcount,T_Special)
%>
<table border="0" cellpadding="2" cellspacing="1"   style="word-break:break-all;">
  <%
dim lh
lh=7
If T_Special = "ok" Then		
	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' And D_Special =1 and D_Picture <> '' ORDER BY D_SortID DESC"
Else
If T_Special = "hot" Then
	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_SortID DESC"
Else
	sSql = "SELECT top "&Pmcount&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Picture <> '' ORDER BY D_ID DESC"
End If
End If
Set oRs = Server.CreateObject( "ADODB.Recordset" )
oRs.Open sSql, oConn, 1, 1
Dim Rcount, Mpage
If oRs.Bof and oRs.Eof then
	Response.write "<tr><td colspan='6'>&nbsp;&nbsp;暂时没有任何信息！</td></tr>"
Else
	Do While Not oRs.Eof
%>
  <tr align="center">
    <td valign="bottom">
      <% if not (oRs.eof) then 
	  %>
      <table width="60" height="60" border="0" cellpadding="1" cellspacing="1" bgcolor="c0c0c0">
        <tr>
          <td bgcolor="#FFFFFF"><a href="view.asp?id=<%=oRs("D_id")%>&cataid=<%=oRs("D_CataID")%>"><img  src="<%=oRs("D_Picture")%>" width="60" height="60" border="0"></a></td>
        </tr>
      </table>
      <%
	  oRs.MoveNext
	  end if
	%></td>
  </tr>
  <%
		Loop		
		oRs.Close
		Set oRs=Nothing
		End if
		%>
</table>
<% end sub %>
<%
sub content(sNewsID,strlen,about)
Dim s_RootID
s_RootID = "A" 
	'Dim sNewsID
	'sNewsID = GetSafeInt(Trim(Request("id")),0)
	Set oRs = Server.CreateObject( "ADODB.Recordset" )
	If sNewsID < 1 Then
		GoError "请通过页面上的链接进行操作，不要试图进行任何非法操作。"
	End If
	sSql="UPDATE NewsData SET D_Hits = D_Hits+1 WHERE D_ID="&sNewsID
	oConn.Execute sSql
	Dim sCataID, sTitle, sContent, sPicture, sOriginalFileName, sSaveFileName, sSavePathFileName, sFrom, sAddTime, sHits
	sSql = "SELECT * FROM NewsData WHERE D_ID=" & sNewsID
	oRs.Open sSql, oConn, 0, 1
	If Not oRs.Eof Then
		sCataID = oRs("D_CataID")
		sTitle = oRs("D_Title")
		sContent = oRs("D_Content")
		sFrom = oRs("D_From")
		sAddTime = oRs("D_AddTime")
		sHits = oRs("D_Hits")
	Else
		GoError "无效的信息ID，请点页面上的链接进行操作！"
	End If
	oRs.Close
	Set oRs = Nothing
	sContent = eWebEditor_DeCode(sContent, "SCRIPT")
	'sContent = outHTML(sContent)
	scontent=left(scontent,strlen)
	response.write sContent
%>
<% end sub %>
<%
sub CataList(T_CataID,T_Words,T_Num,T_Pic,T_More,C_Title,T_Special)
dim TempContent,T_Count,T_Date,Title,oTitle,Cata,rsCata,T_CataName
If T_CataID <> "" then
	Dim dRs, dSql, Flag
	Set dRs = Server.CreateObject( "ADODB.Recordset" )
	dSql = "SELECT * FROM NewsCata WHERE C_RootID = '"&T_CataID&"'"
	dRs.Open dSql, oConn, 0, 1
	If dRs.EOF Then
		Flag = 1	
	End If
	dRs.Close
	Set dRs = Nothing
Else
	Flag = 1
End If
	If Flag = 1 Then
		TempContent=TempContent&"此信息类别并不存在！"
	Else
		Dim fRs, fSql, AtempTitle, o_Char
		Set fRs = Server.CreateObject( "ADODB.Recordset" )
			fSql = "SELECT TOP "&T_Num&" * FROM NewsCata WHERE C_RootID LIKE '%"&T_CataID&"%'"
		fRs.Open fSql,oConn,0,1
		If fRs.EOF or fRs.BOF Then
			TempContent=TempContent&" 暂时没有任何信息！"
		End If
		dim i
		i=0
		Do While Not fRs.EOF
			if i>=T_Num then Exit Do
			i=i+1
			If Len(Trim(fRs("C_Title"))) > Cint(T_Words) Then
				AtempTitle = Left(Trim(fRs("C_Title")),T_Words)&""'..
		   	Else
				AtempTitle = Trim(fRs("C_Title"))
			End If
		%>
		<table border=0 align="center" cellpadding="3" cellspacing="0">
            <tr valign=top>
              <td width="120" align=left valign="middle"><img src=admin/images/b_26_28.gif border=0 align=absmiddle><a href="Article_Index.asp?cataid=<%=fRs("C_RootID")%>" target=_self> <%=left(AtempTitle,18)%></a> </td>
            </tr>
</table>
		<%
		fRs.MoveNext
		Loop
		fRs.Close
		Set fRs = Nothing
		If T_More <> "ok" Then
TempContent=TempContent&"      <img src=images/pot_8.gif>&nbsp;<a href=Info_List.asp?cataid="& T_CataID &">更多内容</a>"
		End If
	End If
'Call DBConnEnd()
response.write TempContent
end sub
sub topnews(T_CataID,T_Words,T_Num,T_More,T_Special)
dim TempContent,T_Count,T_Date,Title,oTitle,Cata,rsCata,T_CataName
If T_CataID <> "" then
	Dim dRs, dSql, Flag
	Set dRs = Server.CreateObject( "ADODB.Recordset" )
	dSql = "SELECT * FROM NewsCata WHERE C_RootID = '"&T_CataID&"'"
	dRs.Open dSql, oConn, 0, 1
	If dRs.EOF Then
		Flag = 1	
	End If
	dRs.Close
	Set dRs = Nothing
Else
	Flag = 1
End If
	If Flag = 1 Then
		TempContent=TempContent&"此信息类别并不存在！"
	Else
		Dim fRs, fSql, AtempTitle, o_Char
		Set fRs = Server.CreateObject( "ADODB.Recordset" )
		If T_Special = "ok" Then		
			fSql = "SELECT TOP "&T_Num&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' And D_Special =1 ORDER BY D_SortID DESC"
		Else
		If T_Special = "hot" Then
			fSql = "SELECT TOP "&T_Num&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_Hits DESC"
		Else
			fSql = "SELECT TOP "&T_Num&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_ID DESC"
		End If
		End If
		fRs.Open fSql,oConn,0,1
		If fRs.EOF or fRs.BOF Then
			TempContent=TempContent&"暂时没有任何信息！"
		End If
		dim i
		i=0
		Do While Not fRs.EOF
			if i>=T_Num then Exit Do
			i=i+1
			If Len(Trim(fRs("D_Title"))) > Cint(T_Words) Then
				AtempTitle = Left(Trim(fRs("D_Title")),T_Words)&""'..
		   	Else
				AtempTitle = Trim(fRs("D_Title"))
			End If
			cata="select * from NewsCata where C_RootID='"&fRs("D_CataID")&"'"
			set rsCata=oConn.execute(cata)
			T_CataName=trim(rsCata("C_Title"))
			rsCata.close
			set rsCata=nothing
			If T_Count = "ok" Then
				If s_date= "ok" Then
					o_Char ="["&FormatDateTime(fRs("D_AddTime"),vbshortdate)&" 浏览："&fRs("D_Hits")&"]"
				Else
					o_Char ="[浏览："&fRs("D_Hits")&"]"
				End If
			Else
				If T_Date= "ok" Then
					o_Char ="["&FormatDateTime(fRs("D_AddTime"),vbshortdate)&"]"
				Else
					o_Char =""
				End If
			End If
'oTitle="<img src=img/b_26_28.gif border=0>"
TempContent=TempContent&oTitle&"<li><a href='Article_View.asp?id="&fRs("D_ID")&"&cataid="&fRs("D_CataID")&"' target=_blank>"&left(AtempTitle,T_Words)&"</a>"&o_char
		fRs.MoveNext
		Loop
		fRs.Close
		Set fRs = Nothing
		If T_More <> "ok" Then
TempContent=TempContent&"  <tr>"
TempContent=TempContent&"    <td height=20>"
TempContent=TempContent&"      <div align=right><img src=images/arrbd.gif>&nbsp;<a href=Article_index.asp>更多内容</a>"
TempContent=TempContent&"      </div>"
TempContent=TempContent&"    </td>"
TempContent=TempContent&"  </tr>"
		End If
	End If
response.write TempContent
end sub
%>
<% sub linkdown(L_ID)%>
        <table border="0" cellpadding="4" cellspacing="0">
          <FORM name=formy action="" method=post>
		  <% dim Sql
		  Set oRs = Server.CreateObject( "ADODB.Recordset" )
		  Sql = "SELECT * FROM L_Class where L_Hide<>1 and L_ID="&L_ID&" order by L_Sort desc"
		  oRs.Open Sql, oConn, 1, 1
		  do while not oRs.eof
		  %>
            <tr>
              <td align="center">
                <SELECT   onchange=javascript:window.open(this.options[this.selectedIndex].value)  style="BACKGROUND-COLOR: #deebfc; COLOR: #484848; FONT-SIZE: 9pt; WIDTH: 180px">
                 <option value="">==<%=oRs("L_CName")%>==</option>
				  <%dim sqllink,Rslink
				 	sqllink = "SELECT * FROM L_Link where L_Class="&L_ID&" order by L_Sort"
					set Rslink=Server.CreateObject( "ADODB.Recordset" )
					Rslink.Open sqllink, oConn, 1, 1
					do while not Rslink.eof
					%>
                  <option value="<%=Rslink("L_Url")%>"><%=Rslink("L_Name")%></option>
				  	<%
					Rslink.Movenext
					Loop
					Rslink.Close
					%>
              </SELECT></td>
            </tr>
			<%
			oRs.Movenext
			Loop
			oRs.Close
			%>
          </FORM>
        </table>
		<% end sub %>
<%
sub Brandshow(T_CataID,Pmcount,more,T_Special,page)
%>
<table width="100%" height="90" border="0" cellpadding="0" cellspacing="1"   style="word-break:break-all;">
  <%
dim s_keyword,Pageno
Pmcount=Pmcount*3
If T_Special = "ok" Then		
	sSql = "SELECT  * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' And D_Special =1 ORDER BY D_SortID DESC"
Else
If T_Special = "hot" Then
	sSql = "SELECT * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_SortID DESC"
Else
	sSql = "SELECT  * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Picture <> '' ORDER BY D_SortID DESC"
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
      <table width="100%"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center" valign="middle"><table width="60" height="60" border="0" cellpadding="1" cellspacing="1" bgcolor="c0c0c0">
            <tr>
              <td bgcolor="#FFFFFF"><a href="Article_view.asp?id=<%=oRs("D_id")%>&cataid=<%=oRs("D_CataID")%>" target="_blank"><img  src="<%=oRs("D_Picture")%>" width="150" height="120" border="0" title="<%=ors("D_Title")%><br>发布时间：<%=oRs("D_AddTime")%><br>查看次数：<%=oRs("D_Hits")%>"></a></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="30" align="center" valign="middle"><%=oRs("D_Title")%></td>
        </tr>
      </table>
      <% 
	  oRs.MoveNext
	  end if
	%>
    </td>
    <td align="center" valign="bottom"><% if not (oRs.eof) then %>
        <table width="100%"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center" valign="middle"><table width="60" height="60" border="0" cellpadding="1" cellspacing="1" bgcolor="c0c0c0">
              <tr>
                <td bgcolor="#FFFFFF"><a href="Article_view.asp?id=<%=oRs("D_id")%>&cataid=<%=oRs("D_CataID")%>" target="_blank"><img  src="<%=oRs("D_Picture")%>" width="150" height="120" border="0" title="<%=ors("D_Title")%><br>发布时间：<%=oRs("D_AddTime")%><br>查看次数：<%=oRs("D_Hits")%>"></a></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="30" align="center" valign="middle"><%=oRs("D_Title")%></td>
          </tr>
        </table>
        <% 
	  oRs.MoveNext
	  end if
	%></td>
    <td align="center" valign="bottom"><% if not (oRs.eof) then %>
        <table width="100%"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="60" align="center" valign="middle">
              <table width="60" height="60" border="0" cellpadding="1" cellspacing="1" bgcolor="c0c0c0">
                <tr>
                  <td bgcolor="#FFFFFF"><a href="Article_view.asp?id=<%=oRs("D_id")%>&cataid=<%=oRs("D_CataID")%>" target="_blank"><img  src="<%=oRs("D_Picture")%>" width="150" height="120" border="0" title="<%=ors("D_Title")%><br>发布时间：<%=oRs("D_AddTime")%><br>查看次数：<%=oRs("D_Hits")%>"></a></td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td height="30" align="center" valign="middle"><%=oRs("D_Title")%></td>
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
<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
  <form name="pageform" method="post" action="">
    <tr>
      <td height="25">
        <div align="left">&nbsp;&nbsp;共&nbsp;<%=Cstr(rcount)%>&nbsp;条信息&nbsp;当前为：<font color="#FF0000"><%=Cstr(Pageno)&"</font>/"&Cstr(Mpage)%>页 每页 <%=pmcount%> 条</font></div></td>
      <td>
        <div align="right">
          <%If Cint(Pageno)>1 Then%>
          <font face="Webdings" color="#FF0000">7</font>&nbsp;<a href='?cataid=<%=s_cataid%>&keyword=<%=s_keyword%>&pageno=<%=Pageno-1%>' class="tt5">上一页</a>
          <%End If
								  If Cint(Pageno) < Cint(Mpage) Then
								  %>
          <font face="Webdings" color="#FF0000">8</font>&nbsp;<a href='?cataid=<%=s_cataid%>&keyword=<%=s_keyword%>&pageno=<%=Pageno+1%>' class="tt5">下一页</a>
          <%End If%>
          跳到第&nbsp;
          <input type=text size=3 name="Pageno" value="<%=pageno%>" class="button1">
&nbsp;页&nbsp;
          <input type="hidden" name="cataid" value="<%=T_CataID%>">
          <input type="hidden" name="keyword2" value="<%=s_keyword%>">
          <input type="submit" name="Submit" value="确定">
      </div></td>
    </tr>
  </form>
</table>
<% end if %>
<% end sub %>

<% sub Textlink(s_class)%>
<%
	dim sqllink,Rslink
	sqllink = "SELECT top 36 * FROM L_Link where L_Hide=1 and L_class="&s_class&" order by L_Sort"
	set Rslink=Server.CreateObject( "ADODB.Recordset" )
	Rslink.Open sqllink, oConn, 1, 1
	'Response.write "<TABLE cellSpacing=2 cellPadding=0 width='95%' align=center>"
	do while not Rslink.eof
	%>
	 <!-- <TR>
	<TD height="20"> --><B>&middot;</B> <A  href="<%=Rslink("L_Url")%>" target=_blank><%=Rslink("L_Name")%></A>&nbsp;&nbsp;  <!-- </TD>
	</TR>  -->
	<% 
	Rslink.Movenext
	Loop
	Rslink.Close
	'Response.write "</TABLE>"
end sub
%>

<% sub Textlink2(s_class)%>
<%
	dim sqllink,Rslink
	sqllink = "SELECT top 16 * FROM L_Link where L_Hide=1 and L_class="&s_class&" order by L_Sort"
	set Rslink=Server.CreateObject( "ADODB.Recordset" )
	Rslink.Open sqllink, oConn, 1, 1
	Response.write "<TABLE cellSpacing=2 cellPadding=0 width='95%' align=center>"
	do while not Rslink.eof
	%>
	 <TR>
	<TD height="20" width="50%">&middot;<A  href="<%=Rslink("L_Url")%>" target=_blank><%=Rslink("L_Name")%></A> </TD>
	<%
		Rslink.Movenext
		If Not Rslink.eof then
	%>
	<TD height="20">&middot;<A  href="<%=Rslink("L_Url")%>" target=_blank><%=Rslink("L_Name")%></A> </TD>
	<%
		else
	%>
	<TD height="20">&nbsp; </TD>
		<%End if%>
	</TR>
	<% 
	If Not Rslink.eof then
	Rslink.Movenext
	End If 
	Loop
	Rslink.Close
	Response.write "</TABLE>"
end sub
%>
<% sub GetCataNameS(s_ID)%>
<%
	dim sqllink,Rslink,S_CataID
	sqllink = "SELECT  D_CataID FROM NewsData WHERE D_ID = " & s_ID 
	set Rslink=Server.CreateObject( "ADODB.Recordset" )
	Rslink.Open sqllink, oConn, 1, 1
	do while not Rslink.eof
		S_CataID=Rslink("D_CataID")
	Rslink.Movenext
	Loop
	Rslink.Close
	Set Rslink=Nothing

	sqllink = "SELECT  C_Title FROM NewsCata WHERE C_RootID = '" & S_CataID &"'"
	set Rslink=Server.CreateObject( "ADODB.Recordset" )
	Rslink.Open sqllink, oConn, 1, 1
	do while not Rslink.eof
		Response.write Rslink("C_Title")
	Rslink.Movenext
	Loop
	Rslink.Close
	Set Rslink=Nothing
	
end sub
%>

<% sub GetCataNameC(C_ID)%>
<%
	dim sqllink,Rslink

	sqllink = "SELECT  C_Title FROM NewsCata WHERE C_RootID = '" & C_ID &"'"
	set Rslink=Server.CreateObject( "ADODB.Recordset" )
	Rslink.Open sqllink, oConn, 1, 1
	do while not Rslink.eof
		Response.write Rslink("C_Title")
	Rslink.Movenext
	Loop
	Rslink.Close
	Set Rslink=Nothing
	
end sub
%>

<% sub GetCataList_h(s_CataID)%>
<%
	dim Qrysql,Rslink,S_CataID_New,S_Img,i

	Qrysql = "SELECT  * FROM NewsCata WHERE C_RootID like '" & S_CataID &"%' and C_RootID <> '" & S_CataID &"' order by C_RootID"
	set Rslink=Server.CreateObject( "ADODB.Recordset" )
	Rslink.Open Qrysql, oConn, 1, 1
	do while not Rslink.eof
		i=i+1
		'if Len(Rslink("C_RootID"))=9 Then
		'	S_Img="&nbsp;<IMG  src=img/class3.gif align=absMiddle>"
		'End If
		'If Len(Rslink("C_RootID"))=13 Then
		'	S_Img="&nbsp;<IMG src=img/class4.gif align=absMiddle>"
		'End If
		Response.write S_Img&"&nbsp;&nbsp;<a href=Product.asp?CataID="&Rslink("C_RootID")&"><font color='#FFFFFF'>"&Rslink("C_Title")&"</font></a>"
		'If i<>Rslink.RecordCount  Then
		'Response.write "<BR>"
		'End if
	Rslink.Movenext
	Loop
	Rslink.Close
	Set Rslink=Nothing
	
end sub
%>

<% sub GetCataList(s_CataID)%>
<%
	dim Qrysql,Rslink,S_CataID_New,S_Img,i,sinfolink
	'If Left(s_CataID,5)<>"A0004" Then
	'	s_CataID="A0003"
	'End if
	If s_cataID="A0006" then
	Qrysql = "SELECT  * FROM NewsCata WHERE C_Title<>'。。。' and C_RootID like '" & S_CataID &"%' and C_RootID <> '" & S_CataID &"' order by C_RootID"
	Else
	Qrysql = "SELECT  * FROM NewsCata WHERE (C_Title<>'。。。' and C_RootID like '" & S_CataID &"%' and C_RootID <> '" & S_CataID &"')  order by C_RootID"
	End If 
	set Rslink=Server.CreateObject( "ADODB.Recordset" )
	Rslink.Open Qrysql, oConn, 1, 1
	Response.write "<TABLE cellSpacing=2 cellPadding=0 width='100%' align=center>"
	do while not Rslink.eof
		i=i+1
		if Len(Rslink("C_RootID"))=5 Then
			S_Img="&nbsp;<IMG  src=img/class3.gif align=absMiddle>"
		End If
		if Len(Rslink("C_RootID"))=9 Then
			S_Img="&nbsp;<IMG  src=img/class3.gif align=absMiddle>"
		End If
		If Len(Rslink("C_RootID"))=13 Then
			S_Img="&nbsp;<IMG src=img/class4.gif align=absMiddle>"
		End If
		sinfolink="NewsDir.asp"
		If Left(Rslink("C_RootID"),5)="A0006" Then
			sinfolink="Product.asp"
		End if
		Response.write "<TR><TD height=22 width=30 align=center valign=middle>"&S_Img&"&nbsp;</td><td><a href="&sinfolink&"?CataID="&Rslink("C_RootID")&"><font style='FONT-SIZE: 14px;  FONT-FAMILY: 宋体'>"&Rslink("C_Title")&"</font></a></tr><tr><td height=1 colspan=2 background=/adminc/img/jg.gif style='padding-left:20px'></td></tr>"
		If i<>Rslink.RecordCount  Then
		End if
	Rslink.Movenext
	Loop
		Response.write "</table>"
	Rslink.Close
	Set Rslink=Nothing
	
end sub
%>

<% sub GetInfoList(s_CataID)%>
<%
	dim Qrysql,Rslink,S_CataID_New,S_Img,i,sinfolink
	'If Left(s_CataID,5)<>"A0004" Then
	'	s_CataID="A0003"
	'End if
	Qrysql = "SELECT  * FROM NewsData WHERE D_CataID like '" & S_CataID &"%' order by D_SortID"
	set Rslink=Server.CreateObject( "ADODB.Recordset" )
	Rslink.Open Qrysql, oConn, 1, 1
	Response.write "<TABLE cellSpacing=2 cellPadding=0 width='100%' align=center>"
	do while not Rslink.eof
		i=i+1
		if Len(Rslink("D_CataID"))=5 Then
			S_Img="&nbsp;<IMG  src=img/class3.gif align=absMiddle>"
		End If
		If Len(Rslink("D_CataID"))=9 Then
			S_Img="&nbsp;<IMG src=img/class4.gif align=absMiddle>"
		End If
		sinfolink="InfoView.asp"
		If Left(Rslink("D_CataID"),5)="A0006" Then
			sinfolink="Product.asp"
		End if
		Response.write "<TR><TD height=22 width=30 align=center valign=middle>"&S_Img&"&nbsp;</td><td><a href="&sinfolink&"?CataID="&Rslink("D_CataID")&"&ID="&Rslink("D_ID")&"><font style='FONT-SIZE: 14px;  FONT-FAMILY: 宋体'>"&Rslink("D_Title")&"</font></a></tr><tr><td height=1 colspan=2 background=/adminc/img/jg.gif style='padding-left:20px'></td></tr>"
		If i<>Rslink.RecordCount  Then
		End if
	Rslink.Movenext
	Loop
		Response.write "</table>"
	Rslink.Close
	Set Rslink=Nothing
	
end sub
%>
<% sub SetImgScr(s_CataID)%>
<%
	dim sqllink,Rslink

	sqllink = "SELECT top 5 D_id,D_CataID,D_Title,D_Picture FROM NewsData WHERE D_CataID = '" & s_CataID &"'"
	set Rslink=Server.CreateObject( "ADODB.Recordset" )
	Rslink.Open sqllink, oConn, 1, 1
	do while not Rslink.eof
		Response.write "<li><a target=_blank href=NewsView.asp?id="&Rslink("D_id")&"&cataid="&Rslink("D_CataID")&"><img src="&Rslink("D_Picture")&"></a></li>"
	Rslink.Movenext
	Loop
	Rslink.Close
	Set Rslink=Nothing
	
end sub
%>