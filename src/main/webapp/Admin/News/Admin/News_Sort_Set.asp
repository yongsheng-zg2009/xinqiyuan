<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->
<%
Call Header("增加新闻")
Call Content()
Call Footer()

' 开始写入内容
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
			Response.Write "<div align=center>出现异常错误，或者你没有选择要操作的新闻!</div>"
		Else
			Dim dTitle, dSortID 
			sSql="SELECT * FROM NewsData WHERE D_ID = " & newsid
			oRs.open sSql,oConn,1,3
			If Not oRs.Eof Then
				dTitle = oRs("D_Title")
				dSortID = oRs("D_SortID")
			Else
				GoError "无效的新闻ID，请点页面上的链接进行操作！"
			End If
			oRs.Close
			Set oRs = Nothing
	%>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr> 
              
            <td height="25"> 
              <div align="center">把新闻“<%=dTitle%>”</div>
              </td>
            </tr>
            <tr>
              
            <td height="25"> 
              <div align="center">设置于第<input type="text" name="msortid" size="10" class="button1" value="<%=dSortID%>">位</div>
              </td>
            </tr>
            <tr>
              
            <td height="25"> 
              <div align="center">
                <input type="submit" name="Submit" value=" 设 置 " class="button2">
                <input type="button" name="Submit2" value=" 关 闭 " onclick="javascript:window.close()" class="button2">
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

