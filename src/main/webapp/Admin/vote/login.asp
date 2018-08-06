<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>login</title>
<link href="css.css" rel="stylesheet" type="text/css">
</head><!-- #include file="conn.asp"-->
<body>
<%
action=request.QueryString("action")
select case action
case "slogin"
us=replace(request.form("us"),"'","")
pas=replace(request.form("pas"),"'","")
if us="" or pas="" then
response.write "<script>alert('操作提示：对不起，用户名密码不能为空！');history.back();</script>"
response.end
end if
if instr(us,"'") or instr(us,"<") or instr(us,"(") or instr(us,"*") or instr(us,"?") or instr(us,"&") or instr(us,"%") or instr(us,"=") or instr(us,"-") then
response.write "<script>alert('用户名密码中含有非法字符，请重新输入');history.back();</script>"
response.end
end if
set rs=server.createobject("adodb.recordset")
rs.open "select * from hfweb_user where user_user='"&us&"'",conn,1,1
if not rs.eof then
	if pas=rs("user_pass") then
	session("us")=us
	response.redirect "a_vote.asp?action=vote"
	else
	response.write "<script>alert('用户密码不正确，请返回重新输入');history.back();</script>"
	end if
else
response.write "<script>alert('用户名不正确，请返回重新输入');history.back();</script>"
end if
end select
%>
<form method="post" action="?action=slogin">
<table width="98%" border="1" align="center" cellpadding="2" cellspacing="0" bordercolorlight="#cccccc" bordercolordark="#f7f7f7" class="css">
<tr>
<td bgcolor="#f7f7f7" height="30" colspan="2">管理员登录</td>
</tr>
<tr>
<td>用户名</td>
<td><input type="text" name="us" size="30" maxlength="50" class="inputt"></td>
</tr>
<tr>
<td>密码</td>
<td><input type="password" name="pas" size="34" maxlength="50" class="inputt"></td>
</tr>
<tr>
<td bgcolor="#f7f7f7" height="30" colspan="2" align="center"><input type="submit" name="submit" value="登录" class="inputt"></td>
</tr>
</table>
</form>

</body>
</html>

