<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<%
Call Content()
Call Footer()

' 本页内容区
Sub Content()
dim aRegcode,Regcode
	aRegcode =Cstr(Session("pSN"))
	Regcode = Trim(request.Form("GetCode"))
	if aRegcode<>Regcode then call OKGo("验证码错误!",request.form("url"))
	sSql = "SELECT * FROM Comment WHERE D_ID is Null"
	oRs.Open sSql, oConn, 1, 3
	oRs.AddNew
	oRs("CID") = request.Form("id")
	oRs("cataid") =request.Form("cataid")
	oRs("Content") = request.Form("Content")
	oRs("remarker") = request.Form("remarker")
	oRs("IP") = Request.ServerVariables("REMOTE_ADDR")
	oRs.Update
	oRs.Close
	Call OKGo("评论发布成功!",request.form("url"))
	'Call Confirm("评论发布成功，是否继续发布？","NewsAdd.asp" , "NewsList.asp")
End Sub

%>

