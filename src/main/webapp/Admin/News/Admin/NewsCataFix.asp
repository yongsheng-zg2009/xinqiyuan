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
		Call AlertMsg("请选择一个不是根目录的类别进行操作！")
	Else
		If Cata_1 = Cata_2 Then
			Call AlertMsg("要操作的栏目不能相同，请重新操作！")
		Else
			'检测当前类别是否有子类别
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
				Call AlertMsg("对不起，你要操作的类别包含有子类别，请先对子类别进行处理！")
			Else
						
				'更新被操作类别的信息类别，更新为目标类别
				sSql="UPDATE NewsData SET D_CataID = '"&Trim(Cata_2)&"' WHERE D_CataID = '"&Cata_1&"'"
				oConn.Execute sSql		
				
				'删除被操作的信息类别
				sSql = "DELETE FROM NewsCata WHERE C_RootID = '"&Cata_1&"'"
				oConn.Execute sSql
					
				Call AlertMsg("栏目已经合并成功！")
			End If
		End If
	End If
End If	
%>

<%
Call Header("信息类别合并")
Call Content()
Call Footer()

Sub Content()
%>
<!--#include virtual ="/admin/Include/Top.asp" -->
<br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <form name="form1" method="post" action="NewsCataFix.asp">
    <tr> 
      <td width="55%" height="25"><b><%=Homepage_Title%> - <font color="#FF0000">新闻栏目合并</font></b></td>
    </tr>
    <tr> 
      <td width="45%" valign="top"> 
        <table width="100%" border="0" cellspacing="2" cellpadding="0">
          <tr bgcolor="#F3F3F3"> 
            <td bgcolor="#799AE1" height="20"> 
              <div align="center"><font color="#FFFFFF">合并新闻栏目</font></div>
            </td>
          </tr>
          <tr bgcolor="#F3F3F3"> 
            <td bgcolor="#F3F3F3" height="30"> 
              <div align="center">把栏目： 
                <select name="cata_1">
                  <option value ="" selected>--请选择操作类别--</option>
                  <%Call GetNewsCata()%>
                </select>
                合并到： 
                <select name="cata_2">
				<option value ="" selected>--请选择目标栏目--</option>
                <%Call GetNewsCata()%>
                </select>
              </div>
            </td>
          </tr>
          <tr bgcolor="#F3F3F3"> 
            <td height="30"> 
              <div align="center"> 
                <input type="submit" name="Submit3" value=" 合 并 " class="button2">
                <input type="hidden" name="action" value="ok">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td valign="top"><p><font color="#FF0000">注意：</font><br>
        1、被操作的栏目不能为根类别，即红颜色的类别。<br>
        2、两个相同的类别不能进行合并，意思很明显，自己怎么跟自己合并呀！<br>
        3、被操作类别含有子类别时，不能和其他的类别进行合并，必须先对子类别进行适当的处理。<br>
        4、如果你想把一个含有子类别的类别合并到某个类别下面，你必须先在那个类别下面先对应的建立几个空类别，然后再一一对应合并过去。</p>      </td>
    </tr>
  </form>
</table>
<%
End Sub
%>

