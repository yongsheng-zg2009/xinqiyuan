<!--#include file = "../Include/DBClass.inc.asp"-->
<!--#include file = "WebEditor/Include/DeCode.asp"-->

<%
' =============================================================
' Made By Xiasp & ��Ͽ���� http://www.sxzx.net/ QQȺ��8617001
' =============================================================
%>

<%
	Dim sNewsID, Title
	sNewsID = GetSafeInt(Trim(Request("id")),0)

	' ����ID��Ч����֤����ֹ��Щ�˶�����ƻ�����ʾ����
	If sNewsID < 1 Then
		GoError "��ͨ��ҳ���ϵ����ӽ��в�������Ҫ��ͼ�����κηǷ�������"
	End If
	
	sSql = "SELECT * FROM NewsData WHERE D_ID=" & sNewsID
	oRs.Open sSql,oConn,1,1
	If oRs.Eof or oRs.Bof Then
		GoError "�����²����ڻ����Ѿ�ɾ����"
	Else
		Title = oRs("D_Title")
	End if
	oRs.Close
	Set oRs = Nothing
%>

<html>
<head>
<title>�������Ƽ�������</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="Css/Style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFFF">
<form name="form1" method="post" action="sendmail.asp">
  <table width="94%" border="0" align="center">
    <tr bgcolor="#ebf3f5"> 
      <td nowrap height="30"> 
        <div align="right">����Email��</div>
      </td>
      <td nowrap bgcolor="#ebf3f5"> 
        <input type="text" name="From" value="<%=Request.cookies("qbtrade_news")("email")%>" class="button1">
      </td>
      <td nowrap> 
        <div align="right">���ѵ�E-mail��</div>
      </td>
      <td nowrap> 
        <input type="text" name="To" class="button1">
      </td>
    </tr>
    <tr bgcolor="#ebf3f5"> 
      <td nowrap height="30"> 
        <div align="right">�ż����⣺</div>
      </td>
      <td colspan="3" nowrap>�Ƽ���������<%=Title%>�� 
        <input type="hidden" name="subject" value="�Ƽ���������<%=Title%>��">
      </td>
    </tr>
    <tr bgcolor="#ebf3f5"> 
      <td nowrap> 
        <div align="right">���ԣ���ѡ����</div>
      </td>
      <td colspan="3" nowrap> 
        <textarea name="attn" cols="50" wrap="VIRTUAL" rows="5" class="button1">���ޣ�</textarea>
      </td>
    </tr>
    <tr bgcolor="#ebf3f5"> 
      <td height="35" nowrap bgcolor="#ebf3f5">&nbsp;        </td>
      <td height="35" colspan="3" nowrap bgcolor="#ebf3f5"><input type="submit" name="Submit" value=" ȷ �� " class="button2">
        <input type="reset" name="reset" value=" �� �� " class="button2">
        <input type="button" name="Submit3" value=" �� �� " onClick="history.back()" class="button2"></td>
    </tr>
  </table>
  <input type="hidden" name="body">
  <input type="hidden" name="backto" value="<%=request.servervariables("http_referer")%>">
</form>
<script language=Vbscript>
function form1_onSubmit()
	if instr(document.form1.from.value,"@")=false  or instr(document.form1.from.value,".")=false then
		msgbox "������Ϸ���email��ַ��",vbcritical,"error"
		document.form1.from.focus()
		form1_onSubmit=false	
		exit function	
	end if
	if instr(document.form1.to.value,"@")=false or instr(document.form1.to.value,".")=false then
		msgbox "������Ϸ���email��ַ��",vbcritical,"error"
		document.form1.to.focus()
		form1_onSubmit=false	
		exit function	
	end if
document.form1.body.value=document.form1.to.value&"�����ã�"&vbcrlf&vbcrlf
document.form1.body.value=document.form1.body.value+"��������["&document.form1.from.value&"]�����Ƽ������µ���ƪ���£�"&vbcrlf&vbcrlf
document.form1.body.value=document.form1.body.value+"��<%=title%>��"&vbcrlf&vbcrlf
document.form1.body.value=document.form1.body.value+"���㵽�����ַ�����"+document.form1.backto.value&vbcrlf&vbcrlf
document.form1.body.value=document.form1.body.value+"�����������˶��ţ�"&vbcrlf+document.form1.attn.value&vbcrlf&vbcrlf
document.form1.body.value=document.form1.body.value+"���������ڣ�"+"<%=news_location%>"&vbcrlf&vbcrlf
document.form1.body.value=document.form1.body.value+"��ӭ���� "+"<%=homepage_title%> "+"<%=homepage_link%>"

end function
</script>
</body>
</html>
