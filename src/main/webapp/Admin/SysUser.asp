<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->
<!--#include virtual="/admin/Include/MD5.asp" -->
<%
Response.buffer=true
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1
Response.CacheControl = "no-cache" 
Response.AddHeader "Pragma", "No-Cache"
%> 
<%
Dim Action, Operate, H_Level, dUserID
Action = GetSafeStr(Trim(Request("action")))
Operate = GetSafeStr(Trim(Request("operate")))
H_Level = Session("Sys_Level")

If Action = "del" Then	'ɾ�������û�
	If H_Level <> 3 Then
		Call AlertMsg("����Ȩ�޲������д˲�����")
	Else
		dUserID = Trim(Request.QueryString("d_userid"))
		oConn.Execute("DELETE FROM Admin WHERE A_UserID='"&dUserID&"'")
	End If
End If

If Action = "modify" Then	'��ȡ�����û������ϣ�������Ҫ����Ϊ�޸�����֮�á�
	Dim aRs, aSql, mUserID, mLevel ,modUserID,A_Columns
	modUserID = Trim(Request.QueryString("m_userid"))
	Set aRs = Server.CreateObject( "ADODB.Recordset" )
	aSql = "SELECT * FROM  Admin WHERE A_UserID ='"&modUserID&"'"
	aRs.Open aSql,oConn,1,1
		If aRs.RecordCount = 1 Then
			mUserID = aRs("A_UserID")
			A_Columns = aRs("A_Columns")
			session("Columns")=A_Columns
			mLevel = aRs("A_Level")
			Operate = "modify"
		Else
			Operate = "addnew"
		End If
	aRs.Close
	Set aRs = Nothing
End If

If Action = "ok" Then
	If H_Level <> 3 Then
		Call AlertMsg("����Ȩ�޲������д˲�����")
	Else
		Call OperateUser()
	End If
End If

Sub GetNewsCata()
	Dim cRs, cSql, i, TempCataStr,A_Columns
	Set cRs = Server.CreateObject( "ADODB.Recordset" )
	cSql = "SELECT * FROM NewsCata ORDER BY C_RootID"
	cRs.Open cSql, oConn, 1, 3
	Do While Not cRs.EOF	
		TempCataStr = "<option value='"&Trim(cRs("C_RootID"))&"'"
		If Len(cRs("C_RootID")) = 1 Then TempCataStr = TempCataStr& " style='color:#FF0000'" 
		if instr(session("Columns"),trim(cRs("C_RootID"))) then  TempCataStr = TempCataStr&"selected "
		TempCataStr = TempCataStr&">&nbsp;|"
		For i=1 To Int(Len(Trim(cRs("C_RootID")))/4)
			TempCataStr = TempCataStr&"&nbsp;|"
		Next
		TempCataStr = TempCataStr&"_"&Trim(cRs("C_Title"))&"</option>"
		Response.Write TempCataStr
	cRs.MoveNext
	Loop 
  	cRs.Close
  	Set cRs = Nothing
End Sub

Sub OperateUser()
	Dim aUserID, aPassWD, aRePassWD, aLevel,A_Columns
	aUserID = GetSafeStr(Trim(Request.Form("mUserID")))
	aPassWD = GetSafeStr(Trim(Request.Form("mPassWD")))
	aRePassWD = GetSafeStr(Trim(Request.Form("mRePassWD")))
	A_Columns = GetSafeStr(Trim(Request.Form("d_cataid")))
	aLevel = GetSafeInt(Trim(Request.Form("mLevel")),0)
	 
	If aUserID <> "" And aPassWD <> "" And aRePassWD <>"" And aLevel > 0 Then 
		If aPassWD = aRePassWD Then
			sSql="SELECT * FROM  Admin WHERE A_UserID ='"&aUserID&"'"
			oRs.Open sSql,oConn,1,3
			If Not oRs.Eof Then
				If Operate ="modify" Then 	'�޸Ĺ����û�
					oRs("A_PWD") = md5(aPassWD)
					oRs("A_Level") = aLevel
					oRs("A_Columns") = A_Columns
					oRs.Update
					Call AlertMsg("�û��޸ĳɹ���")
				Else
					Call AlertMsg("���û��Ѿ����ڣ������½����û�����")
				End If
			Else	'��ӹ����û�
				oRs.AddNew
				oRs("A_UserID") = aUserID
				oRs("A_PWD") = md5(aPassWD)
				oRs("A_Level") = aLevel
				oRs("A_Columns") = A_Columns
				oRs("A_AddTime") = Now()
				oRs.update
				Call AlertMsg("����û��ɹ���")
			End If
			oRs.Close
			Set oRs = Nothing
		Else
			Call AlertMsg("��������������벻һ�£�")
		End If
	Else
		Call AlertMsg("����ȷ�������û��������룡")
	End If
End Sub
  
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
function checkdel(username){
	if (confirm("��ȷ��Ҫɾ�� "+username+" ��������û���")){
		window.open("SysUser.asp?action=del&d_userid="+username,"_self");
	}
	else{
		//Do Nothing;
	}
}

function checkmod(username){
	window.open("SysUser.asp?action=modify&m_userid="+username,"_self");
}

function IsValid()
{
	if (document.addsysuser.mUserID.value=="")
	{
		alert("���������û�����");
		document.addsysuser.mUserID.focus();
		return false;
	}
	if (document.addsysuser.mPassWD.value=="")
	{
		alert("���������û�������");
		document.addsysuser.mPassWD.focus();
		return false;
	}
	
	if (document.addsysuser.mRePassWD.value=="")
	{
		alert("���ٴ��������û�������");
		document.addsysuser.mRePassWD.focus();
		return false;
	}
	
	if (document.addsysuser.mRePassWD.value != document.addsysuser.mPassWD.value)
	{
		alert("������������벻һ�£�");
		document.addsysuser.mRePassWD.focus();
		return false;
	}
	return true;
}
-->
</script>
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25"><b>
    <% = Homepage_title%> - <font color="#FF0000">ϵͳ�û�����</font></b></td>
  </tr>
  <tr>
    <td><table width="82%" border="0" cellspacing="0" cellpadding="0">
      <tr valign="top">
        <td>
          <table width="100%" cellspacing="0" cellpadding="0" height="100%" border="0">
            <tr>
              <td height="351" valign="top"><form name="addsysuser" method="post" action="SysUser.asp?action=ok" onSubmit="return IsValid();">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                      <tr>
                        <td width="100" height="30"><b>��ӳ����û�</b></td>
                        <td>��&nbsp;��&nbsp;����
                            <input name="mUserID" type="text" class="button1" value="<%=mUserID%>" size=25 maxlength="30">
                        </td>
                      </tr>
                      <tr>
                        <td height="30">&nbsp;</td>
                        <td>�û�����
                          <select name="mLevel" id="mLevel">
                            <option value="1" <%If mLevel =1 Then Response.Write "selected"%>>��Ϣ�༭Ա</option>
                            <option value="2" <%If mLevel =2 Then Response.Write "selected"%>>��Ϣ���Ա</option>
                            <option value="3" <%If mLevel =3 Then Response.Write "selected"%>>ϵͳ����Ա</option>
                          </select></td>
                      </tr>
                      <tr>
                        <td height="30">&nbsp; </td>
                        <td>��&nbsp;&nbsp;&nbsp;&nbsp;�룺
                          <input name="mPassWD" type="password" class="button1" size=25 maxlength="30">
						</td>
                      </tr>
                      <tr>
                        <td height="30">&nbsp; </td>
                        <td>ȷ�����룺
                            <input name="mRePassWD" type="password" class="button1" size=25 maxlength="30">
                        </td>
                      </tr>
                      <tr valign=top>
                        <td height="30">&nbsp;</td>
                        <td valign=top>Ȩ�����ã�
                          <select name="d_cataid" size="13" multiple style="background-color:#ECF3FF;">
                          <option value="">--&gt; ��ѡ�� &lt;--</option>
                          <%Call GetNewsCata()%>
                        </select>&nbsp;��Ctrl��Shift������ѡ��</td>
                      </tr>
                      <tr>
                        <td height="30">&nbsp; </td>
                        <td>
                          <input type="hidden" name="operate" value="<%=Operate%>">
                          <input type="submit" name="Submit2" value=" �� �� " class="button2">
                          <input type="reset" name="Submit22" value=" �� д " class="button2">
                        </td>
                      </tr>
                    </table>
                  </form>
				  <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr>
                      <td width="100" valign="top"><b>�����û�����</b></td>
                      <td valign="top">
						<%
						Dim Num, aLevel, aLevelName, aRs, aSql
						Set aRs = Server.CreateObject( "ADODB.Recordset" )
						aSql="SELECT * FROM Admin ORDER BY A_ID DESC" 
						aRs.open aSql,oConn,1,1
						Num = aRs.Recordcount
						%>
                        <table border="0" width="100%" cellpadding="0" align="center" cellspacing="0">
                          <tr>
                            <td colspan="5">
                              <div align="left">����<font color="#FF0033"><%=Num%></font>λ�����û�</div></td>
                          </tr>
						<%
							Do While Not aRs.Eof
								aLevel = aRs("A_level")
								If aLevel = 3 Then aLevelName = "ϵͳ����Ա<font color=#FF0000>(����ɾ��)</font>"
								If aLevel = 2 Then aLevelName = "��Ϣ���Ա"
								If aLevel = 1 Then aLevelName = "��Ϣ�༭Ա"
							
						%>
                          <tr>
                            <td width="45"><input onClick = checkdel("<%=Trim(aRs("A_UserID"))%>") type=button class="button2" value="ɾ��" name="button"></td>
                            <td align="left" colspan="4" height=24>
                              <input type="text" size=15 name="viewsysuser" value="<%=Trim(aRs("A_UserID"))%>" readonly class="button1">
                              <input name="button2" type=button class="button2" id="button2" onClick = checkmod("<%=Trim(aRs("A_UserID"))%>") value="�޸�">                              &nbsp;<%=aLevelName%></td>
                          </tr>
						<%
							aRs.Movenext
							Loop
							aRs.Close
							Set aRs = Nothing
						%>
                      </table></td>
                    </tr>
                </table>
                <br>
                </td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
<%
End Sub
%>
