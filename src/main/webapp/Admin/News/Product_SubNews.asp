<%
sub vbnews(T_CataID,T_Words,T_Num,T_Pic,T_More,C_Title,T_Special)
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
oTitle="<img src=img/b_26_28.gif border=0>"
TempContent=TempContent&"  <tr>" 
TempContent=TempContent&"    <td height=20>"
TempContent=TempContent&oTitle&"  <a href='Product_Show.asp?id="&fRs("D_ID")&"&cataid="&fRs("D_CataID")&"' target=_blank>"&left(AtempTitle,18)&"</a>"&o_char
TempContent=TempContent&"    </td>"
TempContent=TempContent&"  </tr>"
		fRs.MoveNext
		Loop
		fRs.Close
		Set fRs = Nothing
		If T_More <> "ok" Then
TempContent=TempContent&"  <tr>"
TempContent=TempContent&"    <td height=25>"
TempContent=TempContent&"      <div align=right><img src=img/more.gif>&nbsp;<a href=Info_List.asp?cataid="& T_CataID &">更多内容</a>"
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

sub topnews(T_CataID,T_Words,T_Num,T_Pic,T_More,C_Title,T_Special)
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
			fSql = "SELECT TOP "&T_Num&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_SortID DESC"
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
TempContent=TempContent&oTitle&"  <a href='Product_Show.asp?id="&fRs("D_ID")&"&cataid="&fRs("D_CataID")&"' target=_blank><FONT style='FONT-SIZE: 14px'  color=#ff0000><B>"&left(AtempTitle,T_Words)&"<b></font></a>"&o_char
		fRs.MoveNext
		Loop
		fRs.Close
		Set fRs = Nothing
	End If
response.write TempContent
end sub

sub leftnews(T_CataID,T_Words,T_Num,T_Pic,T_More,C_Title,T_Special)
dim TempContent,T_Count,T_Date,Title,oTitle,Cata,rsCata,T_CataName
If T_CataID <> "" then
	Dim dRs, dSql, Flag
	Set dRs = Server.CreateObject( "ADODB.Recordset" )
	dSql = "SELECT * FROM ProductCata WHERE C_RootID = '"&T_CataID&"'"
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
			fSql = "SELECT TOP "&T_Num&" * FROM productData WHERE D_CataID LIKE '"&T_CataID&"%' And D_Special =1 ORDER BY D_SortID DESC"
		Else
		If T_Special = "hot" Then
			fSql = "SELECT TOP "&T_Num&" * FROM productData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_Hits DESC"
		Else
			fSql = "SELECT TOP "&T_Num&" * FROM productData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_AddTime DESC"
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
			'response.Write fRs("D_CataID")
			'response.End()
			cata="select * from productCata where C_RootID='"&fRs("D_CataID")&"'"
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
TempContent=TempContent&oTitle&"  <a href='Product_Show.asp?id="&fRs("D_ID")&"&cataid="&fRs("D_CataID")&"' target=_blank>"&left(AtempTitle,18)&"</a>"&o_char
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
%>
