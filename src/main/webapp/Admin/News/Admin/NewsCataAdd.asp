<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->

<%
Response.Expires = 0 
Response.Expiresabsolute = Now() - 1 
Response.AddHeader "pragma","no-cache" 
Response.AddHeader "cache-control","private" 
Response.CacheControl = "no-cache" 
%>

<%
Call Header("新闻栏目管理")
Call Content()
Call Footer()

' 开始写入内容
Sub Content()
%>

<!--#include virtual ="/admin/Include/Top.asp" -->
<br>
<script language="JavaScript">
<!--
function dodel(){
if (confirm("注意：删除一个栏目，其下面的所有子栏目和产品将全部被清空，\n您确定要进行此操作吗？"))
	{
	document.del.submit();
	}
}
//-->
</script>

<%
	Dim mGetRootID, mTitle, mAddTime
	mGetRootID = GetSafeStr(Trim(Request.Querystring("Rootid")))

	sSql = "SELECT * FROM NewsCata WHERE C_RootID='"&mGetRootID&"'"
	oRs.Open sSql, oConn, 1, 1
	If Not oRs.EOF Then
		mTitle = oRs("C_Title")
		mAddTime = oRs("C_AddTime")			
	End If
	oRs.Close
	Set oRs = Nothing
%>

<%
	Dim mDoRootId, mAction, mModTitle, mAddTitle
	mDoRootId = GetSafeStr(Trim(Request.querystring("dorootid")))
	mAction = GetSafeStr(Trim(Request.querystring("action")))
	mModTitle = GetSafeStr(Trim(Request.form("cat_mod_name")))
	mAddTitle = GetSafeStr(Trim(Request.form("cat_add_name")))
	
Select Case mAction
	Case "modify"
		If mModTitle = "" Then
			Call AlertMsg("请正确填写栏目名称！")
		Else
			sSql="UPDATE NewsCata SET C_Title='"&mModTitle&"' WHERE C_RootID = '"&mDoRootId&"'"
			oConn.Execute sSql
			Call AlertMsg("栏目修改成功!")
		End If
	Case "add"
		Dim mRootID, mNumber, mIDLen
		If mAddTitle="" Then
			Call AlertMsg("请填写栏目名称！")
		Else
			If mDoRootId = "" Then
				Call AlertMsg("你将创建一个新的信息根目录，我们暂时不提供此操作！\n如果您真的需要此功能，我们建议你对库文件直接操作！\n如果你的程序能力有限，建议你直接跟我们取得联系！")
				Response.End()
			Else
			
				Dim bRs, bSql
				Set bRs = Server.CreateObject( "ADODB.Recordset" )
				bSql = "SELECT * FROM NewsCata WHERE C_RootID = '"&mDoRootId&"'"
				bRs.Open bSql, oConn, 1, 1
				If Not bRs.EOF Then
					mRootID = bRs("C_Rootid")
					mNumber = bRs("C_Number") + 1
				Else
					Call AlertMsg("你已经破坏了数据库的原始结构，请与管理员取得联系！")
					Response.End()
				End If
				bRs.Close
				Set bRs = Nothing
			End If
			
			'计算类别的RoorID编码，并且判断当前类别下是否允许继续添加子类别。
			mIDLen = Len(Trim(mNumber))
			
			If mIDLen > 4 Then
				Call OKToWhere("对不起，此栏目下面已经不能再增加子栏目。","-1")
			Else
				mRootID = mRootID & Right(Space(4 - mIDLen) & mNumber,4)
				mRootID = Replace(mRootID," ",0)
			End If
			
			' 保存新闻类别
			Dim aRs, aSql
			Set aRs = Server.CreateObject( "ADODB.Recordset" )
			aSql = "SELECT * FROM NewsCata WHERE C_ID is Null"
			aRs.Open aSql, oConn, 1, 3
			aRs.AddNew
				aRs("C_Title") = mAddTitle
				aRs("C_RootID") = mRootID
				aRs("C_AddTime") = Now()
			aRs.Update
			aRs.Close
			Set aRs = Nothing
			
			'同时更新当前类别的上级栏目子栏目数目。
			sSql="UPDATE NewsCata SET C_Number="& mNumber &" WHERE C_RootID = '"&mDoRootId&"'"
			oConn.Execute sSql
			
			Call AlertMsg("栏目添加成功！")
		End If
End Select
%>

<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25"><b><%=Homepage_title%> - <font color="#FF0000">新闻栏目管理</font></b></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
      <tr>
        <td width="54%">
          <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
              <td bgcolor="#EFEFEF">
                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="10"></td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td style="BORDER-LEFT: #8A8A8A 1px solid; LINE-HEIGHT: 20px; font-family:Verdana, Arial, Helvetica, sans-serif" bgcolor="#FFFFFF" valign="top" height="360"> &nbsp;<font color="#FF0000">0</font>-<font color="#FF0000">1</font>-<font color="#FF0000">2</font>-<font color="#FF0000">3</font>-<font color="#FF0000">4</font>-<font color="#FF0000">5</font>-<font color="#FF0000">6</font>-<font color="#FF0000">7</font>-<font color="#FF0000">8</font>-<font color="#FF0000">9</font>---------------------------------------------------&gt;<br>
		<%
			Dim cRs, cSql, i, TempCataStr
			Set cRs = Server.CreateObject( "ADODB.Recordset" )
			cSql = "SELECT * FROM NewsCata ORDER BY C_RootID"
			cRs.Open cSql, oConn, 1, 3
  
			Do While Not cRs.EOF
			
				TempCataStr="&nbsp;|"
				For i=1 To Int(Len(Trim(cRs("C_RootID")))/4)
					TempCataStr = TempCataStr&"&nbsp;&nbsp;|"
				Next
			
				TempCataStr = TempCataStr&"_<a href=NewsCataAdd.asp?Rootid="&Trim(cRs("C_RootID"))&">"&Trim(cRs("C_Title"))&"&nbsp;("&Trim(cRs("C_RootID"))&")"&"</a><br>"  
				Response.Write TempCataStr
			
			cRs.MoveNext
			Loop 
  			cRs.Close()
  			Set cRs = Nothing
		%>                    </td>
                  </tr>
                  <tr>
                    <td height="10"></td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
        <td width="46%" align="center" valign="top" bgcolor="#799AE1"><br>
            <table width="90%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td><fieldset>
                  <legend>信息统计</legend>
				  &nbsp;&nbsp;&nbsp;&nbsp;栏目名称：<%=mTitle%><br>
				  &nbsp;&nbsp;&nbsp;&nbsp;发布时间：<%=mAddTime%><br>
                </fieldset></td>
              </tr>
              <form name="modify" method="post" action="NewsCataAdd.asp?action=modify&dorootid=<%=mGetRootID%>">
                <tr>
                  <td align="center"><br>
                      <fieldset>
                      <legend>修改当前类别</legend>
                      <br>
                      <input name="cat_mod_name" type="text" class="button1" value="<%=mTitle%>" size="16">
                      <input type="submit" value=" 修 改 " name="mod_submit" class="button2">
                      <br>
                      <br>
                    </fieldset></td>
                </tr>
              </form>
              <form name="addcata" method="post" action="NewsCataAdd.asp?action=add&dorootid=<%=mGetRootID%>">
                <tr>
                  <td align="center" height="90"> <br>
                      <fieldset>
                      <legend>添加子类别</legend>
                      <br>
                      <input type="text" name="cat_add_name" class="button1" value="" size="16">
                      <input type="submit" value=" 添 加 " name="add_submit" class="button2">
                      <br>
                      <br>
                    </fieldset></td>
                </tr>
              </form>
              <form name="del" method="post"  action="NewsCataDelete.asp?delrootid=<%=mGetRootID%>">
                <tr>
                  <td height="60" align="center"> <br>
                      <input type="button" name="del_submit" value="删除当前类" class="button2" onClick="dodel()">
                      <br>
                      <font color="#FFFFFF">（注意：删除一个栏目，其下面的所有子栏目和新闻将全部清空，请慎重操作！）</font></td>
                </tr>
              </form>
            </table>
            <script language=javascript>
			<!--
			if (<%=Len(mGetRootID)%> < 2)
			{
				document.modify.mod_submit.disabled = false;
				document.del.del_submit.disabled = true;
			}
			else
			{
				document.modify.mod_submit.disabled = false;
				document.del.del_submit.disabled = false;
			}
			-->
			</script>
        </td>
      </tr>
    </table></td>
  </tr>
</table>
<p>&nbsp;</p>
<%
End Sub
%>

