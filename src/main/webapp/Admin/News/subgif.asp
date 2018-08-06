<%
sub subgif(T_CataID,T_Num,T_Special)
%>
<CENTER>
<DIV id=oTransContainer  style="FILTER: progid:DXImageTransform.Microsoft.Wipe(GradientSize=1.0,  wipeStyle=0, motion='forward'); WIDTH: 165px; HEIGHT: 103px">
<%
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
TempContent="<table cellspacing=1 cellpadding=1 width=94% align=center border=0>"
TempContent=TempContent&"  <tr>"
TempContent=TempContent&"    <td height=4></td>"
TempContent=TempContent&"  </tr>"
TempContent=TempContent&"  <tr>" 
		If Flag = 1 Then
			TempContent=TempContent&" <tr><td>此信息类别并不存在！</td></tr>"
		Else
			Dim fRs, fSql, fPic ,fNum, j, fPicName, PicName, Loopno,i,psg
			Set fRs = Server.CreateObject( "ADODB.Recordset" )
			If T_Special = "school" Then		
				fSql = "SELECT top "&T_Num&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Special =1  and D_Picture <> '' ORDER BY D_SortID DESC"
			else
				fSql = "SELECT top "&T_Num&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Picture <> ''   ORDER BY D_SortID DESC"
			End If
			fRs.Open fSql,oConn,1,1
			psg=fRs.recordcount
			If fRs.EOF Then
				TempContent=TempContent&" <tr><td>暂时没有任何图片信息！</td></tr>"
			End If
			Loopno = T_Num
			i=0
			Do While Not fRs.EOF and Loopno > 0
				fPic = trim(fRs("D_Picture"))
				If fPic <> "" Then
				i=i+1
			if i=1 then
			%>
			<a href="CarDisp.asp?id=<%=trim(frs("D_Id"))%>&cataid=<%=frs("D_cataID")%>" target="_blank">
			<img  id=oDIV<%=i%> style="BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-BOTTOM: black 1px solid"  height=158  src="<%=fPic%>"  width=175 border=0></a>
			<%else %>
			<A href="CarDisp.asp?id=<%=trim(frs("D_Id"))%>&cataid=<%=frs("D_cataID")%>" target="_blank">
			<IMG  id=oDIV<%=i%>  style="BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; DISPLAY: none; BORDER-LEFT: black 1px solid; BORDER-BOTTOM: black 1px solid"  height=158 src="<%=fPic%>"  width=175 border=0></A>
			<%
			end if
				Loopno = Loopno-1
				End If
			fRs.MoveNext
			Loop
			fRs.Close
			Set fRs = Nothing
	End If
	%>
	</DIV>
	</CENTER>
	<SCRIPT>
var NowFrame = 1;
var MaxFrame = <%=psg%>;
var bStart = 0;

function fnToggle() {
	var next = NowFrame + 1;

	if(next == MaxFrame+1) 
	{
		NowFrame = MaxFrame;
		next = 1;
	}

	if(bStart == 0)
	{
		bStart = 1;
		
		setTimeout('fnToggle()',3000);

		return;
	}
	else
	{
	    oTransContainer.filters[0].Apply();

		document.images['oDIV'+next].style.display = "";
		document.images['oDIV'+NowFrame].style.display = "none"; 

		oTransContainer.filters[0].Play(duration=2);

		if(NowFrame == MaxFrame) 
			NowFrame = 1;
		else
			NowFrame++;
	}	setTimeout('fnToggle()',3000);
}

fnToggle();
</SCRIPT> 
	<%
end sub
%>
