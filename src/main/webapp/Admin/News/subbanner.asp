<%
sub subbanner(T_CataID,T_Num,T_Special,width,height)
Dim TempContent,title,pic,url,domain
TempContent=""
domain="/"	'文件根文件夹
			Dim fRs, fSql, fPic ,fNum, j, fPicName, PicName, Loopno,i,psg
			Set fRs = Server.CreateObject( "ADODB.Recordset" )
			If T_Special = "no" Then
				fSql = "SELECT top "&T_Num&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Picture <>'' ORDER BY D_SortID DESC"
			else
				fSql = "SELECT top "&T_Num&" * FROM NewsData WHERE D_CataID LIKE '"&T_CataID&"%' and D_Picture <>'' And D_Special =1   ORDER BY D_SortID DESC"
			End If
			fRs.Open fSql,oConn,1,1
			psg=fRs.recordcount
			'Response.write psg
			If fRs.EOF Then
				TempContent=TempContent&"暂时没有任何图片信息！"
				Response.Write TempContent
			else
			Loopno = psg
			For I=1 To Loopno
			title=title&left(fRs("D_Title"),19)  'NewsView.asp?id=719&cataid=A00330001
			pic=pic&fRs("D_Picture")
			url=url&domain&"NewsView.asp?ID="&fRs("D_ID")
			'url=url&domain&"NewsView.asp?cataid="&fRs("D_CataID")&"&&ID="&fRs("D_ID")

			fRs.MoveNext
			title=title&"|"
			pic=pic&"|"
			url=url&"|"
			'Response.write url
			Next
			
			fRs.Close
			Set fRs = Nothing
	%>
	<div id="flashcontent">
		<strong>LoadingFlash...</strong>
	</div>
<script language="javascript">
	var focus_width=<%=width%>
	var focus_height=<%=height%>
	var text_height=20
	var swf_height = focus_height+text_height
	var curhref=document.location.href;
	var pics='<%=left(pic,len(pic)-1)%>'
	var linkss='<%=left(url,len(url)-1)%>'
	var texts='<%=left(title,len(title)-1)%>'
		// <![CDATA[
		//var so = new SWFObject("pixviewer.swf", "opaque", focus_width, focus_height, "8", "#999999");
		var so = new TqtecFlash("pixviewer.swf", "focusflash", focus_width, swf_height, "7", "#f2f8fe", false, "High");
		so.addParam("allowScriptAccess", "sameDomain");
		so.addParam("menu", "false");
		so.addParam("wmode", "opaque");
		so.addVariable("allowScriptAccess", "sameDomain"); 
		so.addVariable("menu", "false");
		so.addVariable("wmode", "opaque");
		so.addVariable("borderwidth", focus_width);
		so.addVariable("borderheight", focus_height);
		so.addVariable("textheight", text_height);
		so.addVariable("pics", pics); 
		so.addVariable("links", linkss); 
		so.addVariable("texts", texts); 
		//so.addVariable("FlashVars", 'pics='+pics); 
		so.write("flashcontent");
		
		// ]]>
</script>
<%
End If
end sub
%>
