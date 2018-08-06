<%
sub toppic(T_CataID,Pmcount,T_Special)
%>
<table width="140" border="0" cellpadding="2" cellspacing="1"   style="word-break:break-all;">
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
    <td width="25%" valign="bottom">
      <% if not (oRs.eof) then 
	  %>
      <table width="220" height="106" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="100" align="center"><table width="90" border="0" cellpadding="1" cellspacing="1" bgcolor="c0c0c0">
              <tr>
                <td bgcolor="#FFFFFF"><a href="/floor/Article_view.asp?id=<%=oRs("D_id")%>&cataid=<%=oRs("D_CataID")%>"><img  src="<%=oRs("D_Picture")%>" width="100" height="80" border="0"></a></td>
              </tr>
          </table></td>
          <td width="120" align="center"><table width="120" border="0" cellpadding="0" cellspacing="2">
              <tr>
                <td height="18" bgcolor="#f5f5f5"><b>楼盘名称：</b><%=oRs("D_Title")%></td>
              </tr>
              <tr>
                <td align="center" bgcolor="#FFF3EC"><a href=newhouse/newhouse_show.asp?id=></a></td>
              </tr>
              <tr>
                <td height="18" bgcolor="#f5f5f5"><b>地理位置：</b><%=oRs("D_From")%></td>
              </tr>
              <tr>
                <td bgcolor="#FFF3EC"></td>
              </tr>
          </table></td>
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
<table width="230" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5" background="images/06_0756skin/line03.gif"></td>
  </tr>
  <tr>
    <td height="8"></td>
  </tr>
</table>
<% end sub %>
<%
sub vbnews(T_CataID,T_Words,T_Num,T_More,T_Special)
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
TempContent="<table cellspacing=0 cellpadding=0 width=94% align=center border=0>"
TempContent=TempContent&"  <tr>"
TempContent=TempContent&"    <td height=4></td>"
TempContent=TempContent&"  </tr>"
	If Flag = 1 Then
		TempContent=TempContent&" <tr><td>此信息类别并不存在！</td></tr>"
	Else
		Dim fRs, fSql, AtempTitle, o_Char
		Set fRs = Server.CreateObject( "ADODB.Recordset" )
		If T_Special = "ok" Then		
			fSql = "SELECT TOP "&T_Num&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' And D_Special =1 ORDER BY D_SortID DESC"
		Else
		If T_Special = "hot" Then
			fSql = "SELECT TOP "&T_Num&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_SortID DESC"
		Else
			fSql = "SELECT TOP "&T_Num&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_ID DESC"
		End If
		End If
		fRs.Open fSql,oConn,0,1
		If fRs.EOF or fRs.BOF Then
			TempContent=TempContent&" <tr><td>暂时没有任何信息！</td></tr>"
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
oTitle="<img src=admin/news/images/dot2.gif border=0 align=absmiddle>"
TempContent=TempContent&"  <tr>" 
TempContent=TempContent&"    <td height=22>"
TempContent=TempContent&oTitle&"  <a href='Article_Show.asp?id="&fRs("D_ID")&"&cataid="&fRs("D_CataID")&"' target=_blank>"&left(AtempTitle,18)&"</a>"
TempContent=TempContent&"    </td>"
TempContent=TempContent&"  </tr>"
		fRs.MoveNext
		Loop
		fRs.Close
		Set fRs = Nothing
		If T_More <> "ok" Then
TempContent=TempContent&"  <tr>"
TempContent=TempContent&"    <td height=25>"
TempContent=TempContent&"      <div align=right><img src=images/arrbd.gif>&nbsp;<a href=Article_index.asp?cataid="&T_CataID&">更多内容</a>"
TempContent=TempContent&"      </div>"
TempContent=TempContent&"    </td>"
TempContent=TempContent&"  </tr>"
		End If
	End If
TempContent=TempContent&"</table>"
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
		%>
		<TABLE height="23"  border=0 cellPadding=0 cellSpacing=0>
		<%
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
			%>
  <TR>
    <TD width="20" align="center" valign="middle" class=text_9b>
    <img src=admin/news/images/dot2.gif border=0 align=absmiddle></TD>
    <TD width="250" height="23" background="../../img/newbg.gif" class=text_9b><A  title=<%=fRs("D_TItle")%>  href="article_show.asp?id=<%=fRs("D_ID")%>&cataid=<%=fRs("D_CataID")%>" target=_blank><%=AtempTitle%></A></TD>
    <TD width="100" align="right" background="../../img/newbg.gif" class=text_9b><%=FormatDateTime(frs("D_AddTime"), 1)%></TD>
  </TR>
<%
		fRs.MoveNext
		Loop
		fRs.Close
		Set fRs = Nothing
		If T_More <> "ok" Then
%>
<tr>
<td></td>
<td></td>
<td height=20 align="right" valign="bottom">
<a href=Article_index.asp><img src=img/more.gif border="0"></a>
</td>
</tr>
</TABLE>
<%
		End If
	End If
response.write TempContent
end sub

sub leftnews(T_CataID,T_Words,T_Num,T_Pic,T_More,C_Title,T_Special)
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
TempContent="<table cellspacing=0 cellpadding=0 width=94% align=center border=0>"
TempContent=TempContent&"  <tbody>"
TempContent=TempContent&"  <tr>"
TempContent=TempContent&"    <td height=4></td>"
TempContent=TempContent&"  </tr>"
	If Flag = 1 Then
		TempContent=TempContent&" <tr><td>此信息类别并不存在！</td></tr>"
	Else
		Dim fRs, fSql, AtempTitle, o_Char
		Set fRs = Server.CreateObject( "ADODB.Recordset" )
		If T_Special = "ok" Then		
			fSql = "SELECT TOP "&T_Num&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' And D_Special =1 ORDER BY D_SortID DESC"
		Else
		If T_Special = "hot" Then
			fSql = "SELECT TOP "&T_Num&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_Hits DESC"
		Else
			fSql = "SELECT TOP "&T_Num&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_AddTime DESC"
		End If
		End If
		fRs.Open fSql,oConn,0,1
		If fRs.EOF or fRs.BOF Then
			TempContent=TempContent&" <tr><td>暂时没有任何信息！</td></tr>"
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
oTitle="<img src=img/b_26_28.gif border=0>"
TempContent=TempContent&"  <tr>" 
TempContent=TempContent&"    <td height=20>"
TempContent=TempContent&oTitle&"  <a href='New_Show.asp?id="&fRs("D_ID")&"&cataid="&fRs("D_CataID")&"' target=_blank>"&left(AtempTitle,18)&"</a>"&o_char
TempContent=TempContent&"    </td>"
TempContent=TempContent&"  </tr>"
		fRs.MoveNext
		Loop
		fRs.Close
		Set fRs = Nothing
		If T_More <> "ok" Then
TempContent=TempContent&"  <tr>"
TempContent=TempContent&"    <td height=10>"
TempContent=TempContent&"      <div align=right><img src=images/pot_8.gif>&nbsp;<a href=Info_List.asp?cataid="& T_CataID &">更多内容</a>"
TempContent=TempContent&"      </div>"
TempContent=TempContent&"    </td>"
TempContent=TempContent&"  </tr>"
		End If
	End If
TempContent=TempContent&"  "
TempContent=TempContent&"</table>"
'Call DBConnEnd()
response.write TempContent
end sub


sub Scroll_news(T_CataID,T_Words,T_Num,T_Pic,T_More,C_Title,T_Special)
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
			fSql = "SELECT TOP "&T_Num&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_AddTime DESC"
		End If
		End If
		fRs.Open fSql,oConn,0,1
		If fRs.EOF or fRs.BOF Then
			TempContent=TempContent&" 暂时没有任何信息！"
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
oTitle="<img src=img/point5.gif align=absmiddle border=0>"
TempContent=TempContent&oTitle&" <a href='Article_Show.asp?id="&fRs("D_ID")&"&cataid="&fRs("D_CataID")&"' style=""color:"&fRs("D_Title_Color")&" "" target=_blank>"&left(AtempTitle,18)&"</a>    "&o_char
		fRs.MoveNext
		Loop
		fRs.Close
		Set fRs = Nothing
		If T_More <> "ok" Then
TempContent=TempContent&"      <img src=images/pot_8.gif>&nbsp;<a href=Article_index.asp?cataid="& T_CataID &">更多内容</a>"
		End If
	End If
'Call DBConnEnd()
response.write TempContent
end sub
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
		<table border=0 align="center" cellpadding="4" cellspacing="0">
            <tr valign=top>
              <td width="5" align=middle background="images/tl.gif"></td>
              <td width="80" align=left valign="middle" background="images/nav.gif"><a href="Article_Index.asp?cataid=<%=fRs("C_RootID")%>" target=_self> <%=left(AtempTitle,18)%></a></td>
              <td width="5" align=middle background="images/tr.gif"></td>
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
%>
