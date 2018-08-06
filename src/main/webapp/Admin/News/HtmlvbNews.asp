<%
function Htmlvbnews(T_CataID,T_Words,T_Num,T_Pic,T_More,C_Title,T_Special)
dim TempContent,T_Count,T_Date,Title,oTitle,Cata,rsCata,T_CataName
If T_CataID <> "" then
	Dim dRs, dSql, Flag
	Set dRs = Server.CreateObject( "ADODB.Recordset" )
	dSql = "SELECT * FROM NewsCata WHERE C_RootID = '"&T_CataID&"'"
	dRs.Open dSql,oConn, 0, 1
	If dRs.EOF Then
		Flag = 1
	Else
	Title=dRs("C_Title")
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
			fSql = "SELECT TOP "&T_Num&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' ORDER BY D_Hits DESC"
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
			T_CataName=rsCata("C_Title")
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
if C_Title="ok" then oTitle=T_CataName&" "
TempContent=TempContent&"  <tr>" 
TempContent=TempContent&"    <td height=20>"
TempContent=TempContent&oTitle&"      <a href='"&fRs("D_Filepath")&"' target=_blank>"&AtempTitle&"</a>"&o_char
TempContent=TempContent&"    </td>"
TempContent=TempContent&"  </tr>"
		fRs.MoveNext
		Loop
		fRs.Close
		Set fRs = Nothing
		If T_More <> "ok" Then
TempContent=TempContent&"  <tr>"
TempContent=TempContent&"    <td height=20>"
TempContent=TempContent&"      <div align=right><img src=images/pot_8.gif>&nbsp;<a href=/News/default.asp?cataid="& T_CataID &">更多内容</a>"
TempContent=TempContent&"      </div>"
TempContent=TempContent&"    </td>"
TempContent=TempContent&"  </tr>"
		End If
	End If
TempContent=TempContent&"  "
TempContent=TempContent&"</table>"
'Call DBConnEnd()
Htmlvbnews = TempContent
end function
%>
