<!--#include virtual = "/admin/Include/DBClass.inc.asp"-->
<!--#include virtual = "/admin/Include/SysLoginCheck.inc.asp" -->
<%
if request.querystring("action")="save" then
	dim Sql
	Sql = "SELECT * FROM L_Link WHERE LID="&request.querystring("id")
	oRs.Open Sql, oConn, 1, 3
	oRs("L_Name") = request.form("L_Name")
	oRs("L_Url") = request.form("L_Url")
	oRs("L_img") = request.form("L_img")
	oRs("L_Hide") = request.form("L_Hide")
	oRs("L_Sort") = request.form("L_Sort")
	oRs("L_Class") = request.form("d_cataid")
	oRs.Update
	oRs.Close
	Call OKGo("�����޸ĳɹ���","LinkList.asp")
end if
if request.querystring("action")="modify" then
	dim L_Name,L_Url,L_img,L_Hide,L_Sort,L_Class
	Sql = "SELECT * FROM L_Link WHERE LID="&request.querystring("id")
	oRs.Open Sql, oConn, 1, 3
	L_Name=oRs("L_Name")
	L_Url=oRs("L_Url")
	L_img=oRs("L_img")
	L_Hide=oRs("L_Hide")
	L_Sort=oRs("L_Sort")
	L_Class=oRs("L_Class")
	oRs.Close
end if
Call Header("�޸�����")
Call Content()
Call Footer()

Sub GetNewsCata()
	Dim cRs, cSql, i, TempCataStr
	Set cRs = Server.CreateObject( "ADODB.Recordset" )
	cSql = "SELECT * FROM L_Class where L_Hide=0 ORDER BY L_Sort"
	cRs.Open cSql, oConn, 1, 3
	Do While Not cRs.EOF	
		TempCataStr = "<option value='"&Trim(cRs("L_ID"))&"'"
		if cstr(cRs("L_ID"))=cstr(L_Class)  then TempCataStr = TempCataStr&"selected "
		TempCataStr = TempCataStr&">"
		TempCataStr = TempCataStr&"��"&Trim(cRs("L_CName"))&"</option>"&vbCr
		Response.Write TempCataStr
	cRs.MoveNext
	Loop 
  	cRs.Close
  	Set cRs = Nothing
End Sub

' ��ʼд������
Sub Content()
%>
<!--#include virtual ="admin/Include/Top.asp" -->
<br>
<form action="?action=save&id=<%=request.querystring("id")%>" method="post"> 
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25"><b>
      <% = Homepage_title%> - <font color="#FF0000">��������</font></b></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" align="center" cellspacing="2" cellpadding="2">
      <tr>
        <td width="65">�������</td>
        <td>
          <select name="d_cataid" size="1" style="background-color:#ECF3FF;">
            <option value="">--&gt; ��ѡ����� &lt;--</option>
            <%Call GetNewsCata()%>
          </select>
        </td>
      </tr>
      <tr>
        <td>��վ���ƣ�</td>
        <td>
		<input name="L_Name" type="text" class="button1" id="L_Name" value="<%=L_Name%>" size="50" maxlength="50">
		</td>
      </tr>
      <tr>
        <td>��վ��ַ��</td>
        <td><input name="L_Url" type="text" class="button1" id="L_Url" value="<%=L_Url%>" size="67"></td>
      </tr>
      <tr>
        <td>��վͼ�꣺</td>
        <td><input name="L_img" type="text" class="button1" id="L_img" value="<%=L_img%>" size="67"></td>
      </tr>
      <tr>
        <td>���������</td>
        <td><input name="L_Sort" type="text" id="L_Sort" value="<%=L_Sort%>" size="5"></td>
      </tr>
      <tr>
        <td>��ʾ���ԣ�</td>
        <td><input name="L_Hide" type="radio" value="1" <% if L_Hide=1 then response.write "checked"%>> ��ʾ
            <input name="L_Hide" type="radio" value="0" <% if L_Hide=0 then response.write "checked"%>> ����
		  </td>
      </tr>
      <tr>
        <td>
          <font color="#FF0000">ע�����</font></td>
        <td><font color="#FF0000">������վ���ƺ���վ��ַ������д���������Բ��</font></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>
          <input type="submit" name="btnSubmit" value=" �� �� " class="button2">
		  &nbsp;&nbsp;<input type="reset" name="btnReset" value=" �� �� " class="button2">
        </td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
<%
End Sub
%>

