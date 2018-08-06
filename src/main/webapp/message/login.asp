<!--#include file="inc_common.asp"-->
<!--#include file="inc_md5.asp"-->
<%
'**************************************
'**		login.asp
'**
'** 文件说明：登陆页面
'** 修改日期：2006-04-30
'** 作者：Howlion
'** Email：howlion@163.com
'**************************************

select case Request.QueryString("act")
case "checkpassword"
	call checkpassword()
case "logout"
	call logout()
case else
	pagename="管理登陆"
	call pageHead()
	call bodySkin()
	sub pageContent()
		loginForm()
	end sub
end select

if needSecurityCode=true then
	session("SranmSecurityCode") = RndCode()
end if

function loginForm()
'//////// 以下显示页面主体
%>
        <div id="loginForm">
        <form method="post" action="?act=checkpassword">
        <div class="row">
          <div class="row-left">管理员名称：</div>
          <div class="row-right"><input type="text" name="adminname" size="18" value="<%=name%>" disabled="disabled" /></div>
        </div>	
        <div class="row">
          <div class="row-left">管理密码：</div>
          <div class="row-right"><input type="password" name="adminpass" size="18" /></div>
        </div>
        <%if needSecurityCode=true then%>
				<div class="row">
          <div class="row-left"><span class="red">***</span> 验证码：</div>
          <div class="row-right"><input name="SecurityCode" size="10" maxlength="4" value=""> <img src="security_code.asp" alt="验证码" /></div>
        </div>
        <%end if%>
        <div class="row">
          <div class="row-left">自动登陆：</div>
          <div class="row-right"><input type="checkbox" name="auto_login" id="auto_login" value="auto_login" /> <label for="auto_login">是</label>&nbsp;&nbsp;<span class="noteText">( 若是在公用的电脑上，请<b>不要</b>选择此项 )</span></div>
        </div>
        <div class="row">
          <div class="row-right"><input type="submit" class="button" width="90" value="登 陆" name="submit" /></div>
        </div>
        </form>
        </div>
<%
end function

sub checkpassword() '//////// 进行密码验证
	dim adminpass,SecurityCode
		adminpass = MD5(trim(sql_filter(request.form("adminpass"))))
		SecurityCode = trim(sql_filter(request.form("SecurityCode")))

	if adminpass = password and not(SecurityCode <> session("SranmSecurityCode") and needSecurityCode=true) then
		session("SranM_login") = true
		if request.form("auto_login")="auto_login" then
			Response.Cookies("SranM_mypassword") = adminpass
			Response.Cookies("SranM_mypassword").expires=date+365
		end if
		response.redirect "index.asp"
	else
		errinfo=errinfo & "<li>密码或验证码填写有误！</li>"
		call showError()
	end if

end sub

sub logout() '//////// 退出登陆
	session("SranM_login") = false
	Response.Cookies("SranM_mypassword") = ""
	Response.Redirect "index.asp"
end sub
%>