<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->
<!--#include virtual="/admin/Include/MD5.asp" -->

<%
' =============================================================
' Made By Xiasp & 三峡在线 http://www.sxzx.net/ QQ群：8617001
' =============================================================
%>

<%
'修改用户密码
Dim aAction, aUserID, aPassWD, aNewPassWD, aReNewPassWD
aAction = GetSafeStr(Request.Form("action"))	
If aAction = "ok" Then
	aUserID = Trim(Session("Sys_Admin"))
	aPassWD = Trim(Request("mPassWD"))
	aNewPassWD = Trim(Request("mNewPassWD"))
	aReNewPassWD = Trim(Request("mReNewPassWD"))
	
	If aNewPassWD = aReNewPassWD Then
		sSql = "SELECT * FROM Admin WHERE A_UserID ='"&aUserID&"'"
		oRs.Open sSql, oConn, 0, 1
		If Not oRs.Eof Then
			If oRs("A_PWD") = md5(aPassWD) Then
				oConn.Execute("UPDATE Admin SET A_PWD='"&md5(aNewPassWD)&"' WHERE A_UserID='"&aUserID&"'")
				Call AlertMsg("密码修改成功！")
			Else
				Call AlertMsg("原始密码输入错误！")
			End If
		Else
			Call AlertMsg("你的用户名不存在或者已经被删除！")
		End if
		oRs.Close
		Set oRs = Nothing
	Else
		Call AlertMsg("你两次输入的密码不一致！")
	End If
End If

Call Header("系统用户管理")
Call Content()
Call Footer()

' 开始写入内容
Sub Content()
%>

<!--#include virtual="/admin/Include/Top.asp" -->
<br>
<script language="javascript">
<!--
function IsValid()
{
	if (document.modifypasswd.mPassWD.value=="")
	{
		alert("请输入原始密码！");
		document.modifypasswd.mPassWD.focus();
		return false;
	}
	if (document.modifypasswd.mNewPassWD.value=="")
	{
		alert("请输入新密码");
		document.modifypasswd.mNewPassWD.focus();
		return false;
	}
	
	if (document.modifypasswd.mReNewPassWD.value=="")
	{
		alert("请再次输入新密码");
		document.modifypasswd.mReNewPassWD.focus();
		return false;
	}
	
	if (document.modifypasswd.mReNewPassWD.value != document.modifypasswd.mNewPassWD.value)
	{
		alert("两次输入的密码不一致！");
		document.modifypasswd.mReNewPassWD.focus();
		return false;
	}
	return true;
}
-->
</script>
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25"><b><% = Homepage_title%> - <font color="#FF0000">修改密码</font></b></td>
  </tr>
  <tr>
    <td>
      <form name="modifypasswd" method="post" action="ModifyPasswd.asp" onSubmit="return IsValid();">
        <table width="82%" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td height="30">原&nbsp;&nbsp;密&nbsp;&nbsp;码：
            <input name="mPassWD" type="password" class="button1" size=25 maxlength="30"></td>
          </tr>
          <tr>
            <td height="30">新&nbsp;&nbsp;密&nbsp;&nbsp;码：
            <input name="mNewPassWD" type="password" class="button1" size=25 maxlength="30"></td>
          </tr>
          <tr>
            <td height="30">确认新密码：
            <input name="mReNewPassWD" type="password" class="button1" size=25 maxlength="30"></td>
          </tr>
          <tr>
            <td height="30">
              <input type="hidden" name="action" value="ok">
              <input type="submit" name="Submit" value=" 提 交 " class="button2">
              <input type="reset" name="Submit22" value=" 重 写 " class="button2">
             </td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
<%
End Sub
%>
