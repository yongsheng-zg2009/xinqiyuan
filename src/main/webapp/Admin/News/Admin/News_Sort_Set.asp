<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->
<%
Call Header("��������")
Call Content()
Call Footer()

' ��ʼд������
Sub Content()
	Dim Newsid, dMod, mSortID, mNewsID, aRs, aSql
	Newsid = GetSafeInt(Trim(Request("newsid")),1)
	dMod = GetSafeStr(Trim(request.form("dmod")))
	mSortID = GetSafeInt(Trim(request.form("msortid")),1) 
	mNewsID = GetSafeInt(Trim(request.form("mnewsid")),1)

	If dMod="ok" then
		sSql = "UPDATE NewsData SET D_SortID = " & mSortID & " WHERE D_ID =" & mNewsID
		oConn.Execute sSql
		Response.Write "<script language=javascript>"
		Response.Write "window.close();"
		Response.Write "</script>"
	End If
%>

<table width="300" border="0" cellspacing="10" cellpadding="0" align="center" bgcolor="#799AE1" height="160">
<form name="form1" method="post" action="news_sort_set.asp">
  <tr>
    <td bgcolor="#FFFFFF"> 
	<%
		If Newsid = 1 Then
			Response.Write "<div align=center>�����쳣���󣬻�����û��ѡ��Ҫ����������!</div>"
		Else
			Dim dTitle, dSortID 
			sSql="SELECT * FROM NewsData WHERE D_ID = " & newsid
			oRs.open sSql,oConn,1,3
			If Not oRs.Eof Then
				dTitle = oRs("D_Title")
				dSortID = oRs("D_SortID")
			Else
				GoError "��Ч������ID�����ҳ���ϵ����ӽ��в�����"
			End If
			oRs.Close
			Set oRs = Nothing
	%>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr> 
              
            <td height="25"> 
              <div align="center">�����š�<%=dTitle%>��</div>
              </td>
            </tr>
            <tr>
              
            <td height="25"> 
              <div align="center">�����ڵ�<input type="text" name="msortid" size="10" class="button1" value="<%=dSortID%>">λ</div>
              </td>
            </tr>
            <tr>
              
            <td height="25"> 
              <div align="center">
                <input type="submit" name="Submit" value=" �� �� " class="button2">
                <input type="button" name="Submit2" value=" �� �� " onclick="javascript:window.close()" class="button2">
                <input type="hidden" name="dmod" value="ok">
				<input type="hidden" name="mnewsid" value="<%=newsid%>">
              </div>
            </td>
            </tr>
          </table>  
		  <% End If %>      
      </td>
  </tr>
</form>
</table>
<%
End Sub
%>

