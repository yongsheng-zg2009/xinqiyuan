<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<%
Call Content()
Call Footer()

' ��ҳ������
Sub Content()
dim aRegcode,Regcode
	aRegcode =Cstr(Session("pSN"))
	Regcode = Trim(request.Form("GetCode"))
	if aRegcode<>Regcode then call OKGo("��֤�����!",request.form("url"))
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
	Call OKGo("���۷����ɹ�!",request.form("url"))
	'Call Confirm("���۷����ɹ����Ƿ����������","NewsAdd.asp" , "NewsList.asp")
End Sub

%>

