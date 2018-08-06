<!--#include file = "../Include/DBClass.inc.asp"-->
<!--#include file = "WebEditor/Include/DeCode.asp"-->

<%
' =============================================================
' Made By Xiasp & 三峡在线 http://www.sxzx.net/ QQ群：8617001
' =============================================================
%>

<%
	Dim sNewsID, Title
	sNewsID = GetSafeInt(Trim(Request("id")),0)

	' 新闻ID有效性验证，防止有些人恶意的破坏此演示程序
	If sNewsID < 1 Then
		GoError "请通过页面上的链接进行操作，不要试图进行任何非法操作。"
	End If
	
	sSql = "SELECT * FROM NewsData WHERE D_ID=" & sNewsID
	oRs.Open sSql,oConn,1,1
	If oRs.Eof or oRs.Bof Then
		GoError "此文章不存在或者已经删除！"
	Else
		Title = oRs("D_Title")
	End if
	oRs.Close
	Set oRs = Nothing
%>

<html>
<head>
<title>将文章推荐给朋友</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="Css/Style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFFF">
<form name="form1" method="post" action="sendmail.asp">
  <table width="94%" border="0" align="center">
    <tr bgcolor="#ebf3f5"> 
      <td nowrap height="30"> 
        <div align="right">您的Email：</div>
      </td>
      <td nowrap bgcolor="#ebf3f5"> 
        <input type="text" name="From" value="<%=Request.cookies("qbtrade_news")("email")%>" class="button1">
      </td>
      <td nowrap> 
        <div align="right">朋友的E-mail：</div>
      </td>
      <td nowrap> 
        <input type="text" name="To" class="button1">
      </td>
    </tr>
    <tr bgcolor="#ebf3f5"> 
      <td nowrap height="30"> 
        <div align="right">信件主题：</div>
      </td>
      <td colspan="3" nowrap>推荐给您：《<%=Title%>》 
        <input type="hidden" name="subject" value="推荐给您：《<%=Title%>》">
      </td>
    </tr>
    <tr bgcolor="#ebf3f5"> 
      <td nowrap> 
        <div align="right">附言（可选）：</div>
      </td>
      <td colspan="3" nowrap> 
        <textarea name="attn" cols="50" wrap="VIRTUAL" rows="5" class="button1">（无）</textarea>
      </td>
    </tr>
    <tr bgcolor="#ebf3f5"> 
      <td height="35" nowrap bgcolor="#ebf3f5">&nbsp;        </td>
      <td height="35" colspan="3" nowrap bgcolor="#ebf3f5"><input type="submit" name="Submit" value=" 确 定 " class="button2">
        <input type="reset" name="reset" value=" 重 来 " class="button2">
        <input type="button" name="Submit3" value=" 返 回 " onClick="history.back()" class="button2"></td>
    </tr>
  </table>
  <input type="hidden" name="body">
  <input type="hidden" name="backto" value="<%=request.servervariables("http_referer")%>">
</form>
<script language=Vbscript>
function form1_onSubmit()
	if instr(document.form1.from.value,"@")=false  or instr(document.form1.from.value,".")=false then
		msgbox "请输入合法的email地址！",vbcritical,"error"
		document.form1.from.focus()
		form1_onSubmit=false	
		exit function	
	end if
	if instr(document.form1.to.value,"@")=false or instr(document.form1.to.value,".")=false then
		msgbox "请输入合法的email地址！",vbcritical,"error"
		document.form1.to.focus()
		form1_onSubmit=false	
		exit function	
	end if
document.form1.body.value=document.form1.to.value&"，您好！"&vbcrlf&vbcrlf
document.form1.body.value=document.form1.body.value+"您的朋友["&document.form1.from.value&"]向您推荐了以下的这篇文章："&vbcrlf&vbcrlf
document.form1.body.value=document.form1.body.value+"《<%=title%>》"&vbcrlf&vbcrlf
document.form1.body.value=document.form1.body.value+"请你到这个地址浏览："+document.form1.backto.value&vbcrlf&vbcrlf
document.form1.body.value=document.form1.body.value+"他还给你留了短信："&vbcrlf+document.form1.attn.value&vbcrlf&vbcrlf
document.form1.body.value=document.form1.body.value+"更多文章在："+"<%=news_location%>"&vbcrlf&vbcrlf
document.form1.body.value=document.form1.body.value+"欢迎光临 "+"<%=homepage_title%> "+"<%=homepage_link%>"

end function
</script>
</body>
</html>
