<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->
<%
if request.querystring("action")="save" then
	dim Sql
	Sql = "SELECT * FROM L_Link WHERE LID is Null"
	oRs.Open Sql, oConn, 1, 3
	oRs.AddNew
	oRs("L_Name") = request.form("L_Name")
	oRs("L_Url") = request.form("L_Url")
	oRs("L_img") = request.form("L_img")
	oRs("L_Hide") = request.form("L_Hide")
	oRs("L_Sort") = request.form("L_Sort")
	oRs("L_Class") = request.form("d_cataid")
	oRs.Update
	oRs.Close
	session("sCataId")=request.form("d_cataid")
	Call Confirm("链接添加成功，是否继续添加？","LinkAdd.asp" , "LinkList.asp")
end if
Call Header("增加链接")
Call Content()
Call Footer()

Sub GetNewsCata()
	Dim cRs, cSql, i, TempCataStr
	Set cRs = Server.CreateObject( "ADODB.Recordset" )
	cSql = "SELECT * FROM L_Class where L_Hide=0 ORDER BY L_Sort"
	cRs.Open cSql, oConn, 1, 3
	Do While Not cRs.EOF	
		TempCataStr = "<option value='"&Trim(cRs("L_ID"))&"'"
		if cstr(cRs("L_ID"))=cstr(session("sCataId")) or cRs("L_ID")=request("cataid") then TempCataStr = TempCataStr&"selected "
		TempCataStr = TempCataStr&">"
		TempCataStr = TempCataStr&"→"&Trim(cRs("L_CName"))&"</option>"&vbCr
		Response.Write TempCataStr
	cRs.MoveNext
	Loop 
  	cRs.Close
  	Set cRs = Nothing
End Sub

' 开始写入内容
Sub Content()
%>
<!--#include virtual ="admin/Include/Top.asp" -->
<br>
<form action="?action=save" method="post"> 
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25"><b>
      <% = Homepage_title%> - <font color="#FF0000">发布链接</font></b></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" align="center" cellspacing="2" cellpadding="2">
      <tr>
        <td width="65">链接类别：</td>
        <td>
          <select name="d_cataid" size="1" style="background-color:#ECF3FF;">
            <option value="">--&gt; 请选择类别 &lt;--</option>
            <%Call GetNewsCata()%>
          </select>
        </td>
      </tr>
      <tr>
        <td>网站名称：</td>
        <td>
		<input name="L_Name" type="text" class="button1" id="L_Name" size="50" maxlength="50">
		</td>
      </tr>
      <tr>
        <td>网站地址：</td>
        <td><input name="L_Url" type="text" class="button1" id="L_Url" value="http://www." size="67"></td>
      </tr>
      <tr>
        <td>图标地址：</td>
        <td><input name="L_img" type="text" class="button1" id="L_img" size="67" value="-"></td>
      </tr>
      <tr>
        <td>排序参数：</td>
        <td><input name="L_Sort" type="text" id="L_Sort" value="0" size="5"></td>
      </tr>
      <tr>
        <td>显示属性：</td>
        <td>          <input name="L_Hide" type="radio" value="1" checked="checked">
          显示
            <input type="radio" name="L_Hide" value="0">
            隐藏</td>
      </tr>
      <tr>
        <td>
          <font color="#FF0000">注意事项：</font></td>
        <td><font color="#FF0000">以上网站名称和网站地址必须填写，其他可以不填。</font></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>
          <input type="submit" name="btnSubmit" value=" 提 交 " class="button2">
		  &nbsp;&nbsp;<input type="reset" name="btnReset" value=" 重 填 " class="button2">
        </td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
<%
End Sub
%>

