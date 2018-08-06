<!--#include file = "Include/DBClass.inc.asp"-->
<!--#include file="Include/MD5.asp" -->
<%
Dim Position, aAction, Errmsg, aUserID, aPassWD, regcode, aregcode, aLevel
Position = GetSafeInt(Trim(Request("Position")),0)
If Position < 1 Then
	Errmsg = ""
	Position = 1
Else
	Errmsg="<font color=#FF0000><b>您没有登陆或者停留的时间过长，请重新登陆！</b></font>"
End If
aAction = GetSafeStr(Request.Form("action"))
If aAction = "true" Then
	Dim Server_v1, Server_v2
   	Server_v1 = Cstr(Request.ServerVariables("HTTP_REFERER"))
   	Server_v2 = Cstr(Request.ServerVariables("SERVER_NAME"))
   	If Mid(Server_v1,8,Len(Server_v2)) <> Server_v2 Then '外部提交的数据
		Call OKToWhere("数据提交错误！","-1")
	Else
		aUserID = Trim(Request("a_userid"))
		aPassWD = Trim(Request("a_pwd"))
		aRegcode =Cstr(Session("pSN"))
		regcode = Trim(Request("regcode"))
	
		If aUserID <> "" And aPassWD <> "" and regcode <> "" Then
			If aRegcode = regcode Then
				sSql = "SELECT * FROM Admin WHERE A_UserID ='"&aUserID&"'"
				oRs.Open sSql, oConn, 0, 1
				If Not oRs.Eof Then
					If oRs("A_PWD") = md5(aPassWD) Then
						' 登录成功
						aLevel = oRs("A_Level")
						Session("Sys_Admin") = aUserID
						Session("Sys_Level") = aLevel
						Session("A_Columns") = oRs("A_Columns")
						session("adminLogin") = true
						session("adminName") = "admin"
					
						If Position = 2 Then
							Response.Write "<script language='JavaScript'>top.document.location.reload();</script>"
						Else
							Response.Redirect "Admin.asp"
							Response.End
						End If
					Else
						Errmsg = "提示：密码输入错误！"
					End If
				Else
					Errmsg = "提示：该用户名输入错误或者不存在！"
				End If
				oRs.Close
				Set oRs = Nothing
			Else 
				Errmsg = "提示：附加码输入错误！"
			End If
		Else
			Errmsg = "提示：用户名或、密码、附加码不能为空！"
		End If
	End If
End If
%>
<HTML>
<HEAD>
<script language="JavaScript">
<!--
function window_onload() {
	document.mail.a_userid.focus();
}
function cancel()
{
	mail.reset();
}

function IsValid()
{
	if (document.mail.a_userid.value=="")
	{
		alert("用户名不能为空");
		document.mail.a_userid.focus();
		return false;
	}
	if (document.mail.a_pwd.value=="")
	{
		alert("密码不能为空");
		document.mail.a_pwd.focus();
		return false;
	}
	
	if (document.mail.regcode.value=="")
	{
		alert("附加码不能为空");
		document.mail.regcode.focus();
		return false;
	}
	return true;
}
//-->
</script>
<TITLE><%=Homepage_Title%>--管理中心-用户登陆</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
<link href="loginimg/style.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY background="loginimg/managelogin_bg.gif" leftMargin=0 topMargin=108 MARGINWIDTH="0" MARGINHEIGHT="0" onLoad="return window_onload()"> 
<TABLE cellSpacing=0 cellPadding=0 width=778 border=0> 
    <form name=mail action="Login.asp" onSubmit="return IsValid();" method=post>
	<TR> 
      <TD><IMG height=110 src="loginimg/managelogin_1.gif" 
    width=95></TD> 
      <TD><IMG height=110 src="loginimg/managelogin_2.gif" 
    width=115></TD> 
      <TD><IMG height=110 src="loginimg/managelogin_3.gif" 
    width=119></TD> 
      <TD><IMG height=110 src="loginimg/managelogin_4.gif" 
    width=190></TD> 
      <TD><IMG height=110 src="loginimg/managelogin_5.gif" 
    width=130></TD> 
      <TD><IMG height=110 src="loginimg/managelogin_6.gif" 
    width=129></TD> 
    </TR> 
    <TR> 
      <TD><IMG height=113 src="loginimg/managelogin_7.gif" 
    width=95></TD> 
      <TD><IMG height=113 src="loginimg/managelogin_8.gif" 
    width=115></TD> 
      <TD><IMG height=113 src="loginimg/managelogin_9.gif" 
    width=119></TD> 
      <TD style="PADDING-TOP: 12px" vAlign=top   background=loginimg/managelogin_10.gif> 
          <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0> 
            <TBODY> 
              <TR> 
                <TD>用户名: 
                  <input name="a_userid" type="text" class="button1" id="a_userid" size="20"></TD> 
              </TR> 
              <TR> 
                <TD>密&nbsp;&nbsp;码: 
                  <input name="a_pwd" type="password" class="button1" id="a_pwd" size="20"></TD> 
              </TR> 
              <TR>
                <TD>验证玛: 
                <INPUT name=regcode type=text class=TEXT id="regcode" size="5" 
            maxLength=4>
                <IMG  src="loginimg/getcode.asp" alt=验证码,看不清楚?请点击刷新验证码 style="CURSOR: pointer" onClick="this.src='loginimg/getcode.asp'">
                <input type="hidden" name="action" value="true">
                <input type="hidden" name="position" value="<%=Position%>">                </TD>
              </TR>
              <TR> 
                <TD style="PADDING-TOP: 10px" align=middle height=30><INPUT onfocus=this.blur(); type=submit value=确定登陆 name=send class="BUTTON">&nbsp;&nbsp;  
                  <INPUT type=reset value=重新填写 name=exit class="BUTTON"></TD> 
              </TR> 
             
          </TABLE> 
      </TD> 
      <TD><IMG height=113 src="loginimg/managelogin_11.gif" 
      width=130></TD> 
      <TD><IMG height=113 src="loginimg/managelogin_12.gif" 
      width=129></TD> 
    </TR> 
    <TR> 
      <TD><IMG height=74 src="loginimg/managelogin_13.gif" 
    width=95></TD> 
      <TD><IMG height=74 src="loginimg/managelogin_14.gif" 
    width=115></TD> 
      <TD><IMG height=74 src="loginimg/managelogin_15.gif" 
    width=119></TD> 
      <TD width="190" height="74" align="center" background="loginimg/managelogin_16.gif"><font color="#FF0000"><b><%=Errmsg%></b></font></TD> 
      <TD><IMG height=74 src="loginimg/managelogin_17.gif" 
    width=130></TD> 
      <TD><IMG height=74 src="loginimg/managelogin_18.gif" 
    width=129></TD> 
    </TR></FORM>
</TABLE> 
<SCRIPT language=JavaScript>
<!--
String.prototype.Trim = function() //trim函数(去除空格)
{
	return this.replace(/^\s+|\s+$/g,"");
}

String.prototype.LenB = function() //将汉字计算成两个字节的函数
{
	return this.replace(/[^\x00-\xff]/g,"**").length;
}

function CheckForm(theForm)
{
	if (theForm.UserName.value.Trim()==''|| theForm.UserName.value.LenB()>20)
	{
		alert("错误：\n您没有输入管理员用户名.\n(用户名长度不能超过20字节)\n");
		theForm.UserName.focus();
		return false;
	}
	if (theForm.PassWord.value.Trim()=='' || theForm.PassWord.value.LenB()>20)
	{
		alert("错误：\n您没有输入 管理员密码.\n(密码长度不能超过20字节)\n");
		theForm.PassWord.focus();
		return false;
	}
	if (theForm.CheckCode.value.Trim()=='')
	{
		alert("错误：\n必须输入验证码");
		theForm.CheckCode.focus();
		return false;
	}
}
//-->
</SCRIPT> 
</BODY>
</HTML>

