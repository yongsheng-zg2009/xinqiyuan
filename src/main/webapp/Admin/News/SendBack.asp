<!--#include file = "../Include/DBClass.inc.asp"-->
<!--#include file = "WebEditor/Include/DeCode.asp"-->

<%
' =============================================================
' Made By Xiasp & 三峡在线 http://www.sxzx.net/ QQ群：8617001
' =============================================================
%>

<%
	Dim sNewsID, Title, Content
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
		Content = oRs("D_Content")
	End if
	oRs.Close
	Set oRs = Nothing
%>
<html>
<head>
<title>文章打包</title>
<link href="Css/Style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
<form name="form1" method="post" action="sendmail.asp">
  <table width="88%" border="0" align="center">
    <tr bgcolor="#ebf3f5"> 
      <td nowrap height="30"> 
        <div align="right">您的Email：</div>
      </td>
      <td nowrap> 
        <input type="text" name="From" value="<%=request.cookies("qbtrade_news")("email")%>" class="button1">
        <input type="hidden" name="To">
      </td>
    </tr>
    <tr bgcolor="#ebf3f5"> 
      <td height="30" nowrap> 
        <div align="right">文章标题：</div>
      </td>
      <td nowrap>《<%=Title%>》 
        <input type="hidden" name="subject" value="《<%=Title%>》">
      </td>
    </tr>
    <tr bgcolor="#ebf3f5"> 
      <td nowrap> 
        <div align="right">备注（可选）：</div>
      </td>
      <td nowrap> 
        <textarea name="attn" cols="50" wrap="VIRTUAL" rows="5" class="button1">（无）</textarea>
      </td>
    </tr>
    <tr bgcolor="#ebf3f5"> 
      <td nowrap colspan="2" height="35"> 
        <div align="center"> 
          <input type="submit" name="Submit" value=" 确 定 " class="button2">
          <input type="reset" name="reset" value=" 重 来 " class="button2">
          <input type="button" name="Submit3" value=" 返 回 " onclick="history.back()" class="button2">
        </div>
      </td>
    </tr>
  </table>
  <input type="hidden" name="body" value="<%=server.htmlencode(replace(Content,"<br>",""))%>">
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
document.form1.to.value=document.form1.from.value
document.form1.body.value="《<%=Title%>》"+vbcrlf+vbcrlf+document.form1.body.value+vbcrlf+vbcrlf
document.form1.body.value=document.form1.body.value+"原文地址："+document.form1.backto.value+vbcrlf+vbcrlf
document.form1.body.value=document.form1.body.value+"备注："+vbcrlf+document.form1.attn.value+vbcrlf+vbcrlf
document.form1.body.value=document.form1.body.value+"更多文章在："+"<%=Homepage_Title%>"+vbcrlf+vbcrlf
document.form1.body.value=document.form1.body.value+"欢迎光临 "+"<%=Homepage_Title%> "+"<%=Homepage_Link%>"

end function
</script>
</body>
</html>
