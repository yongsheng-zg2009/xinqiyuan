<%
sub downpic(T_CataID,T_Num,T_Special)
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
TempContent="<table cellspacing=4 cellpadding=0 width=100% align=center border=0>"
		If Flag = 1 Then
			TempContent=TempContent&" 暂无信息！！"
		Else
			Dim fRs, fSql, fPic ,fNum, j, fPicName, PicName, Loopno
			Set fRs = Server.CreateObject( "ADODB.Recordset" )
			If T_Special = "ok" Then		
				fSql = "SELECT * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Special =1 and D_Picture <> '' ORDER BY D_ID DESC"
			Else
				fSql = "SELECT * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Special =0 and D_Picture <> '' ORDER BY D_ID DESC"
			End If
			fRs.Open fSql,oConn,0,1
			If fRs.EOF Then
				TempContent=TempContent&"暂无信息2！"
			End If
			Loopno = T_Num
			Do While Not fRs.EOF and Loopno > 0
				fPic = fRs("D_Picture")
				If fPic <> "" Then
				TempContent=TempContent&"<tr>"
				TempContent=TempContent&"<td><a href='New_Show.asp?id="&fRs("D_ID")&"&cataid="&fRs("D_cataid")&"' target='_blank'><img src='"&fPic&"' width='80' height='70' border='0'></a>"
				TempContent=TempContent&"<td><a href='New_Show.asp?id="&fRs("D_ID")&"&cataid="&fRs("D_cataid")&"' target='_blank'>"&left(fRs("e_Title"),32)&"……</a></TD></TR>"
				TempContent=TempContent&"<tr  valign=bottom><td colspan=2 align=center height=20><font color=#000066><b><a href=New_Show.asp?id="&fRs("D_ID")&"&cataid="&fRs("D_cataid")&" target='_blank'>"&left(fRs("D_Title"),13)&"</a></b></font></td></tr>"
				Loopno = Loopno-1
				End If
			fRs.MoveNext
			Loop
			fRs.Close
			Set fRs = Nothing
TempContent=TempContent&"</table>"
'TempContent=TempContent&"  <tr>"
'TempContent=TempContent&"    <td height=20 colspan='"&T_Num&"'>"
'TempContent=TempContent&"      <div align=right><img src=/Images/pot_1.gif><a href=/News/Default.asp?cataid="& T_CataID &">更多内容</a>"
'TempContent=TempContent&"      </div>"
'TempContent=TempContent&"    </td>"
'TempContent=TempContent&"  </tr>"
	End If
	response.Write TempContent
end sub
%>
