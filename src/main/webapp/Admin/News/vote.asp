<!--#include file = "../Include/DBClass.inc.asp"-->
<%
dim score
score=request.Form("score")
sql1="update NewsData set D_Vote=D_Vote+"&score&" where d_ID="request.form("id")
oconn.execute(sql1)
response.Redirect request.form("url")
%>

