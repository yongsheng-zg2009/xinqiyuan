<!--#include file = "WebEditor/Include/DeCode.asp"-->
<%
sub content(sNewsID,about)
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
		GoError "无效的新闻ID，请点页面上的链接进行操作！"
	End If
	oRs.Close
	Set oRs = Nothing
	response.Write sContent
	'sContent = eWebEditor_DeCode(sContent, "SCRIPT")
	'sContent = outHTML(sContent)
%>
<% end sub %>
