<!--#include file = "../Include/DBClass.inc.asp"-->
<%
dim sql1,score
sql1="select D_vote where NewsData where d_ID="request.form("id")
set rs=oconn.execute(sql1)
score=rs("D_vote")
rs.close
set rs=nothing
%>
document.write("<%=score%>")
