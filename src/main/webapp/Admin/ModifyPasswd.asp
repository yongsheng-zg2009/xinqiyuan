<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->
<!--#include virtual="/admin/Include/MD5.asp" -->

<%
' =============================================================
' Made By Xiasp & ��Ͽ���� http://www.sxzx.net/ QQȺ��8617001
' =============================================================
%>

<%
'�޸��û�����
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
				Call AlertMsg("�����޸ĳɹ���")
			Else
				Call AlertMsg("ԭʼ�����������")
			End If
		Else
			Call AlertMsg("����û��������ڻ����Ѿ���ɾ����")
		End if
		oRs.Close
		Set oRs = Nothing
	Else
		Call AlertMsg("��������������벻һ�£�")
	End If
End If

Call Header("ϵͳ�û�����")
Call Content()
Call Footer()

' ��ʼд������
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
		alert("������ԭʼ���룡");
		document.modifypasswd.mPassWD.focus();
		return false;
	}
	if (document.modifypasswd.mNewPassWD.value=="")
	{
		alert("������������");
		document.modifypasswd.mNewPassWD.focus();
		return false;
	}
	
	if (document.modifypasswd.mReNewPassWD.value=="")
	{
		alert("���ٴ�����������");
		document.modifypasswd.mReNewPassWD.focus();
		return false;
	}
	
	if (document.modifypasswd.mReNewPassWD.value != document.modifypasswd.mNewPassWD.value)
	{
		alert("������������벻һ�£�");
		document.modifypasswd.mReNewPassWD.focus();
		return false;
	}
	return true;
}
-->
</script>
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25"><b><% = Homepage_title%> - <font color="#FF0000">�޸�����</font></b></td>
  </tr>
  <tr>
    <td>
      <form name="modifypasswd" method="post" action="ModifyPasswd.asp" onSubmit="return IsValid();">
        <table width="82%" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td height="30">ԭ&nbsp;&nbsp;��&nbsp;&nbsp;�룺
            <input name="mPassWD" type="password" class="button1" size=25 maxlength="30"></td>
          </tr>
          <tr>
            <td height="30">��&nbsp;&nbsp;��&nbsp;&nbsp;�룺
            <input name="mNewPassWD" type="password" class="button1" size=25 maxlength="30"></td>
          </tr>
          <tr>
            <td height="30">ȷ�������룺
            <input name="mReNewPassWD" type="password" class="button1" size=25 maxlength="30"></td>
          </tr>
          <tr>
            <td height="30">
              <input type="hidden" name="action" value="ok">
              <input type="submit" name="Submit" value=" �� �� " class="button2">
              <input type="reset" name="Submit22" value=" �� д " class="button2">
             </td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
<%
End Sub
%>
