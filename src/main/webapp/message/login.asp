<!--#include file="inc_common.asp"-->
<!--#include file="inc_md5.asp"-->
<%
'**************************************
'**		login.asp
'**
'** �ļ�˵������½ҳ��
'** �޸����ڣ�2006-04-30
'** ���ߣ�Howlion
'** Email��howlion@163.com
'**************************************

select case Request.QueryString("act")
case "checkpassword"
	call checkpassword()
case "logout"
	call logout()
case else
	pagename="�����½"
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
'//////// ������ʾҳ������
%>
        <div id="loginForm">
        <form method="post" action="?act=checkpassword">
        <div class="row">
          <div class="row-left">����Ա���ƣ�</div>
          <div class="row-right"><input type="text" name="adminname" size="18" value="<%=name%>" disabled="disabled" /></div>
        </div>	
        <div class="row">
          <div class="row-left">�������룺</div>
          <div class="row-right"><input type="password" name="adminpass" size="18" /></div>
        </div>
        <%if needSecurityCode=true then%>
				<div class="row">
          <div class="row-left"><span class="red">***</span> ��֤�룺</div>
          <div class="row-right"><input name="SecurityCode" size="10" maxlength="4" value=""> <img src="security_code.asp" alt="��֤��" /></div>
        </div>
        <%end if%>
        <div class="row">
          <div class="row-left">�Զ���½��</div>
          <div class="row-right"><input type="checkbox" name="auto_login" id="auto_login" value="auto_login" /> <label for="auto_login">��</label>&nbsp;&nbsp;<span class="noteText">( �����ڹ��õĵ����ϣ���<b>��Ҫ</b>ѡ����� )</span></div>
        </div>
        <div class="row">
          <div class="row-right"><input type="submit" class="button" width="90" value="�� ½" name="submit" /></div>
        </div>
        </form>
        </div>
<%
end function

sub checkpassword() '//////// ����������֤
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
		errinfo=errinfo & "<li>�������֤����д����</li>"
		call showError()
	end if

end sub

sub logout() '//////// �˳���½
	session("SranM_login") = false
	Response.Cookies("SranM_mypassword") = ""
	Response.Redirect "index.asp"
end sub
%>