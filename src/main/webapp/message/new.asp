<!--#include file="inc_common.asp"-->
<!--#include file="UBB.asp"-->
<%
'**************************************
'**		new.asp
'**
'** �ļ�˵����д����ҳ��
'** �޸����ڣ�2006-04-30
'** ���ߣ�Howlion
'** Email��howlion@163.com
'**************************************

if lock="1" then
	errinfo="<li>���Ա��Ѿ�������Ա���������޷����ԡ�"
	call showError()
end if

select case Request.QueryString("act")
case "addnew"
	call addnew()
case ""
	pagename="д����"
	call bodySkin()
	sub pageContent()
		submitForm()
	end sub
end select

if needSecurityCode=true then
	session("SranmSecurityCode") = RndCode()
end if

function submitForm()
%>
        <script src="UBB.js"></script>
        <form action="?act=addnew" method="post" name="lw_form" id="lw_form" onsubmit="return Submitcheck()">
        <%if notice<>"" then%>
        <div id="notice"><%=UBBcode(notice,1)%></div>
        <%end if%>
        <div class="row">
          <div>
          �У�<img src="<%=userfacesFolder%>/x1.gif"><input type="radio" value="1" name="userface" class="radio" checked="checked">&nbsp;&nbsp;
          Ů��<img src="<%=userfacesFolder%>/x2.gif"><input type="radio" value="6" name="userface" class="radio">&nbsp;&nbsp;
          </div>
        <div class="row">
          <div class="row-left"><span class="red">***</span> ���ĳƺ���</div>
          <div class="row-right"><input name="username" size="19" maxlength="80" value="<%=Request.Cookies("SranM_userinfo")("SranM_username")%>"></div>
        </div>
        <div class="row">
          <div class="row-left"><span class="red">***</span> ���ģ�</div>
          <div class="row-right">
          <textarea cols="60" rows="12" name="usercontent" id="usercontent" title="Ctrl+Enter�ύ" onkeydown="ctlent()" onselect="storeCaret(this);" onclick="storeCaret(this);" onkeyup="storeCaret(this);textNum.innerText=this.value.length"></textarea><br />
          <span class="noteText">��ǰ������<span class="Highlight"><span id="textNum">0</span></span>�����������<span class="Highlight"><%=maxnum%></span></span>
          </div>
        </div>
        <%if UBBcfg_emot=1 then%>
        <div class="row">
          <div class="row-right">
            <div class="row-right-graybg">
            <%call getEmot()%>
            </div>
          </div>
        </div>
        <%end if%>
        <%if needSecurityCode=true then%>
				<div class="row">
          <div class="row-left"><span class="red">***</span> ��֤�룺</div>
          <div class="row-right"><input name="SecurityCode" size="10" maxlength="4" value=""> <img src="security_code.asp" alt="��֤��" /></div>
        </div>
        <%end if%>
        <div class="row">
          <div class="row-right"><br />
          <input type="hidden" name="UBB_super" value="0">
          <input type="submit" class="button" name="Submit" value="�� ��">&nbsp;&nbsp;
          <input type="reset" class="button" class="button" name="Submit2" value="�� ��">&nbsp;&nbsp;
          <input type="button" class="button" name="Preview" value="Ԥ��" onclick="openpreview()">
          </div>
        </div>
        </form>
        <form action="preview.asp" method="post" name="preview" target="preview_page" id="preview">
          <input type="hidden" name="UBB_super" value>
          <input type="hidden" name="usertitle" value>
          <input type="hidden" name="usercontent" value>
        </form>
<%
end function

sub addnew()	'//////// �����Լ������ݿ�
	dim servername1,servername2
		servername1=Cstr(Request.ServerVariables("HTTP_REFERER"))
		servername2=Cstr(Request.ServerVariables("SERVER_NAME"))

		if mid(servername1,8,len(servername2))<>servername2 then
			errinfo="<li>�Ƿ����ύ������</li>"
			call showError()
		end if

		if session("postTime")<>"" and minute(NOW() - session("postTime")) < 1 and not(login) then
			session("postTime")=NOW()
			errinfo="<li>�����ύʱ�������̣���һ���Ӻ��ٴ��ύ��</li>"
			call showError()	'//////// �˴���Ϊ�˷�ֹ������ظ��ύ
		end if

	dim username,SecurityCode,xingbie,userface,userURL,usermail,userqq
	dim usertitle,usercontent,whisper,checked,replycode

	username=Trim(sql_filter(request.Form("username")))
	SecurityCode=Trim(sql_filter(request.Form("SecurityCode")))

	if request.Form("userface") < 6 then
		xingbie=1
		elseif request.Form("userface") < 11 then
		xingbie=2
		else
		xingbie=3
	end if

	userface=sql_filter(request.Form("userface"))

	if Trim(sql_filter(request.form("userURL")))="http://" then
		userURL = ""
	else
		userURL=Trim(sql_filter(request.form("userURL")))
	end if

		usermail=Trim(sql_filter(request.form("usermail")))
		userqq=Trim(sql_filter(request.form("userqq")))
		usertitle=Trim(sql_filter(request.form("usertitle")))
		usercontent=Rtrim(sql_filter(request.form("usercontent")))

	if not request.form("whisper")="1" then
		whisper=0
	else
		whisper=1
	end if

		replycode=sql_filter(Trim(request.form("replycode")))

		Response.Cookies("SranM_userinfo")("SranM_username") = username
		Response.Cookies("SranM_userinfo")("SranM_userURL") = userURL
		Response.Cookies("SranM_userinfo")("SranM_usermail") = usermail
		Response.Cookies("SranM_userinfo")("SranM_userqq") = userqq
		Response.Cookies("SranM_userinfo").expires=date+365

	if username="" then
		errinfo=errinfo & "<li>δ��д���ĳƺ�</li>"
	else
		if len(username)>20 then errinfo=errinfo & "<li>�����ĳƺ�</li>"
		if (UCase(username)=UCase(name) or username="����Ա") and not(login) then errinfo=errinfo & "<li>����ʹ�ù���Ա�ĳƺ�</li>"
	end if

	if SecurityCode <> session("SranmSecurityCode") and needSecurityCode=true then
		errinfo=errinfo & "<li>��֤����д����</li>"
	end if


	dim re
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	re.Pattern="(\[(.[^\]]*)\])"
	if	Trim(re.Replace(Replace(request.form("usercontent"), CHR(13)&CHR(10), ""),""))="" then
		errinfo=errinfo & "<li>δ��д��������</li>"
		elseif len(usercontent)>maxnum then
		errinfo=errinfo & "<li>��������������</li>"
	end if

	if not adword="" then
		dim alladword,i
			alladword=split(adword,chr(13)&chr(10))
		for i = lbound(alladword) to ubound(alladword)
			if instr(UCase(usercontent & usertitle),UCase(trim(alladword(i))))>0 and trim(alladword(i))<>"" then
				errinfo="<li>δ֪����</li>"
				call showError()
				response.end
			end if
		next
	end if

	set re=Nothing

	if len(replycode)>45 then
		errinfo=errinfo & "<li>�����Ļظ��鿴��</li>"
	end if

	call showError()

	if needcheck=0 or whisper=1 then
		checked=1
	else
		checked=0
	end if

	Set rs= Server.CreateObject("ADODB.Recordset")
	sql="select * from [topic]"
	rs.open sql,conn,3,2
	rs.addnew
	rs("username")=username
	rs("xingbie")=xingbie
	rs("userface")=userface
	rs("userURL")=userURL
	rs("usermail")=usermail
	rs("userqq")=userqq
	rs("usertime")=now()
	rs("usertitle")=usertitle
	rs("usercontent")=usercontent
	rs("whisper")=whisper
	rs("replycode")=replycode
	rs("top")="0"
	rs("reply")="0"
	rs("ip")=user_ip
	rs("checked")=checked
	rs.update
	rs.close

	session("postTime")=NOW()

	if checked=0 then
		response.write"<script>alert('�����ѳɹ��ύ������Ҫͨ����˺�Ż���ʾ��');location='index.asp'</script>"
	else
		if whisper=1 then
			if replycode="" then
				response.write"<script>alert('���Ļ������ѳɹ��ύ������û����д�ظ��鿴�룬����Ա���޷��ظ����ķ��ԣ���Ҳ�޷��鿴�ظ���');location='index.asp'</script>"
			else
				response.write"<script>alert('���Ļ������ѳɹ��ύ���������ڹ���Ա�ظ���ͨ������ظ��鿴�룬�鿴�ظ����ݡ�');location='index.asp'</script>"
			end if
		else
			Response.Redirect "index.asp"
			Response.Flush
		end if	
	end if
end sub
%>