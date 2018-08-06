<%
sub subimg(T_CataID,T_Num,T_Special)
Dim TempContent
'Dim T_CataID, T_Num, T_Special, TempContent
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
TempContent="<table cellspacing=1 cellpadding=1 width=100% align=center border=0>"
TempContent=TempContent&"  <tr>"
TempContent=TempContent&"    <td height=4></td>"
TempContent=TempContent&"  </tr>"
TempContent=TempContent&"  <tr>" 
		If Flag = 1 Then
			TempContent=TempContent&" <tr><td>此信息类别并不存在！</td></tr>"
		Else
			Dim fRs, fSql, fPic ,fNum, j, fPicName, PicName, Loopno
			Set fRs = Server.CreateObject( "ADODB.Recordset" )
			
			If T_Special = "ok" Then		
				fSql = "SELECT top "&T_Num&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Special =1 and D_Picture <> '' ORDER BY D_SortID DESC"
			Else
				fSql = "SELECT top "&T_Num&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Picture <> '' ORDER BY D_SortID DESC"
			ENd If
			fRs.Open fSql,oConn,0,1
			If fRs.EOF Then
				TempContent=TempContent&" <tr><td>暂时没有任何图片信息！</td></tr>"
			End If
			Loopno = T_Num
			Do While Not fRs.EOF and Loopno > 0
				fPic = trim(fRs("D_Picture"))
				If fPic <> "" Then
TempContent=TempContent&"   <td height=20 valign=top align=center>"
TempContent=TempContent&"      <a href='New_Show.asp?id="&fRs("D_ID")&"&cataid="&fRs("D_CataID")&"' target='_blank'><img src='"&fPic&"' width='190' height='130' border='0'><tr><td height='22' align='center'>"&left(fRs("D_Title"),8)&"</a>"
TempContent=TempContent&"    </td><td width=15></td>"
				Loopno = Loopno-1
				End If
			fRs.MoveNext
			Loop
			fRs.Close
			Set fRs = Nothing
TempContent=TempContent&"  </tr>"
'TempContent=TempContent&"  <tr>"
'TempContent=TempContent&"    <td height=20 colspan='"&T_Num&"'>"
'TempContent=TempContent&"      <div align=right><img src=/Images/pot_1.gif><a href=/News/Default.asp?cataid="& T_CataID &">更多内容</a>"
'TempContent=TempContent&"      </div>"
'TempContent=TempContent&"    </td>"
'TempContent=TempContent&"  </tr>"
TempContent=TempContent&"</table>"
	End If
	response.Write TempContent
end sub
'call subimg("A",5,"no")
%>

<%
sub brand(T_CataID,T_Num,T_Special)
Dim TempContent
'Dim T_CataID, T_Num, T_Special, TempContent
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
TempContent="<table cellspacing=1 cellpadding=1 width=100% align=center border=0>"
TempContent=TempContent&"  <tr>"
TempContent=TempContent&"    <td height=4></td>"
TempContent=TempContent&"  </tr>"
		If Flag = 1 Then
			TempContent=TempContent&" <tr><td>此信息类别并不存在！</td></tr>"
		Else
			Dim fRs, fSql, fPic ,fNum, j, fPicName, PicName, Loopno
			Set fRs = Server.CreateObject( "ADODB.Recordset" )
			
			If T_Special = "ok" Then		
				fSql = "SELECT top "&T_Num&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Special =1 and D_Picture <> '' ORDER BY D_SortID DESC"
			Else
				fSql = "SELECT top "&T_Num&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Picture <> '' ORDER BY D_SortID DESC"
			ENd If
			fRs.Open fSql,oConn,0,1
			If fRs.EOF Then
				TempContent=TempContent&" <tr><td>暂时没有任何图片信息！</td></tr>"
			End If
			Loopno = T_Num
			Do While Not fRs.EOF and Loopno > 0
				fPic = trim(fRs("D_Picture"))
				If fPic <> "" Then
TempContent=TempContent&"   <tr><td height=20 valign=top align=center>"
TempContent=TempContent&"      <a href='CarDisp.asp?id="&fRs("D_ID")&"&cataid="&fRs("D_CataID")&"' target='_blank'><img src='"&fPic&"' width='120' height='60' border='0'></tr><tr><td height='15' align='center'>"&left(fRs("D_Title"),8)&"</a>"
TempContent=TempContent&"    </td><td width=15></td></tr>"
				Loopno = Loopno-1
				End If
			fRs.MoveNext
			Loop
			fRs.Close
			Set fRs = Nothing
TempContent=TempContent&"  </tr>"
'TempContent=TempContent&"  <tr>"
'TempContent=TempContent&"    <td height=20 colspan='"&T_Num&"'>"
'TempContent=TempContent&"      <div align=right><img src=/Images/pot_1.gif><a href=/News/Default.asp?cataid="& T_CataID &">更多内容</a>"
'TempContent=TempContent&"      </div>"
'TempContent=TempContent&"    </td>"
'TempContent=TempContent&"  </tr>"
TempContent=TempContent&"</table>"
	End If
	response.Write TempContent
end sub
'call subimg("A",5,"no")
%>
