<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->

<%
Sub GetNewsCata()
	Dim cRs, cSql, i, TempCataStr
	Set cRs = Server.CreateObject( "ADODB.Recordset" )
	cSql = "SELECT * FROM NewsCata ORDER BY C_RootID"
	cRs.Open cSql, oConn, 1, 3
  
	Do While Not cRs.EOF	
	
		TempCataStr = "<option value='"&Trim(cRs("C_RootID"))&"'"
		
		If Len(cRs("C_RootID")) = 1 Then TempCataStr = TempCataStr& " style='color:#FF0000'" 
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
%>

<%
Dim Action , Cata_1, Cata_2, j
Action = GetSafeStr(Trim(request.form("action")))
Cata_1 = GetSafeStr(Trim(request.form("cata_1")))
Cata_2 = GetSafeStr(Trim(request.form("cata_2")))
	
If Action="ok" Then
	If Cata_1 = "" or Len(Cata_1) < 5 or Len(Cata_2) < 5 Then
		Call AlertMsg("��ѡ��һ�����Ǹ�Ŀ¼�������в�����")
	Else
		If Cata_1 = Cata_2 Then
			Call AlertMsg("Ҫ��������Ŀ������ͬ�������²�����")
		Else
			'��⵱ǰ����Ƿ��������
			j = 0
			sSql = "SELECT * FROM NewsCata WHERE C_RootID LIKE '"&Cata_1&"%'  ORDER BY C_ID DESC"
			oRs.Open sSql,oConn,1,1
			Do While Not oRs.Eof
				'
				oRs.Movenext
				j = j+1
			Loop
			oRs.Close
			Set oRs=Nothing
				
			If j > 1 Then
				Call AlertMsg("�Բ�����Ҫ����������������������ȶ��������д���")
			Else
						
				'���±�����������Ϣ��𣬸���ΪĿ�����
				sSql="UPDATE NewsData SET D_CataID = '"&Trim(Cata_2)&"' WHERE D_CataID = '"&Cata_1&"'"
				oConn.Execute sSql		
				
				'ɾ������������Ϣ���
				sSql = "DELETE FROM NewsCata WHERE C_RootID = '"&Cata_1&"'"
				oConn.Execute sSql
					
				Call AlertMsg("��Ŀ�Ѿ��ϲ��ɹ���")
			End If
		End If
	End If
End If	
%>

<%
Call Header("��Ϣ���ϲ�")
Call Content()
Call Footer()

Sub Content()
%>
<!--#include virtual ="/admin/Include/Top.asp" -->
<br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <form name="form1" method="post" action="NewsCataFix.asp">
    <tr> 
      <td width="55%" height="25"><b><%=Homepage_Title%> - <font color="#FF0000">������Ŀ�ϲ�</font></b></td>
    </tr>
    <tr> 
      <td width="45%" valign="top"> 
        <table width="100%" border="0" cellspacing="2" cellpadding="0">
          <tr bgcolor="#F3F3F3"> 
            <td bgcolor="#799AE1" height="20"> 
              <div align="center"><font color="#FFFFFF">�ϲ�������Ŀ</font></div>
            </td>
          </tr>
          <tr bgcolor="#F3F3F3"> 
            <td bgcolor="#F3F3F3" height="30"> 
              <div align="center">����Ŀ�� 
                <select name="cata_1">
                  <option value ="" selected>--��ѡ��������--</option>
                  <%Call GetNewsCata()%>
                </select>
                �ϲ����� 
                <select name="cata_2">
				<option value ="" selected>--��ѡ��Ŀ����Ŀ--</option>
                <%Call GetNewsCata()%>
                </select>
              </div>
            </td>
          </tr>
          <tr bgcolor="#F3F3F3"> 
            <td height="30"> 
              <div align="center"> 
                <input type="submit" name="Submit3" value=" �� �� " class="button2">
                <input type="hidden" name="action" value="ok">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td valign="top"><p><font color="#FF0000">ע�⣺</font><br>
        1������������Ŀ����Ϊ����𣬼�����ɫ�����<br>
        2��������ͬ������ܽ��кϲ�����˼�����ԣ��Լ���ô���Լ��ϲ�ѽ��<br>
        3������������������ʱ�����ܺ������������кϲ��������ȶ����������ʵ��Ĵ���<br>
        4����������һ���������������ϲ���ĳ��������棬����������Ǹ���������ȶ�Ӧ�Ľ������������Ȼ����һһ��Ӧ�ϲ���ȥ��</p>      </td>
    </tr>
  </form>
</table>
<%
End Sub
%>

