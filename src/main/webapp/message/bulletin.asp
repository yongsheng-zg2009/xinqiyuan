<!--#include file="inc_common.asp"-->
<%
'**************************************
'**		bulletin.asp
'**
'** �ļ�˵�������淢��ҳ��
'** �޸����ڣ�2006-04-30
'** ���ߣ�Howlion
'** Email��howlion@163.com
'**************************************

if not login then
	errinfo="<li>��δ��½���Ѿ��˳���½�����ܽ����ҳ��</li>"
	call showError()
end if


select case Request.QueryString("act")
case "addnew"
	call addnew()
case else
	pagename="��������"
	call bodySkin()
	sub pageContent()
		bulletinForm()
	end sub
end select

function bulletinForm()
%>
        <script src="UBB.js"></script>
        <form action="?act=addnew" method="post" name="lw_form" id="lw_form">
        <div class="row">
          <div class="row-left">QQ���룺</div>
          <div class="row-right">
          
      <input name="userqq" size="19" maxlength="80" value="<%=Request.Cookies("SranM_userinfo")("SranM_userqq")%>" />
          </div>
        </div>
        <div class="row">
          <div class="row-left"><span class="red">***</span> ������⣺</div>
          <div class="row-right">
          
      <input name="usertitle" size="40" maxlength="100" />
          </div>
        </div>
        <div class="row">
          <div class="row-right">
            <div class="row-right-graybg"><!--#include file="inc_UBB.asp"--></div>
          </div>
        </div>
        <div class="row">
          <div class="row-left"><span class="red">***</span> �������ģ�</div>
          <div class="row-right">
          <textarea cols="60" rows="12" name="usercontent" id="usercontent" title="Ctrl+Enter�ύ" onkeydown="ctlent()" onselect="storeCaret(this);" onclick="storeCaret(this);" onkeyup="storeCaret(this);"></textarea>
          </div>
        </div>
        <div class="row">
          <div class="row-right">
            <div class="row-right-graybg">
            <%call getEmot()%>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="row-right"><br />
          
      <input type="hidden" name="UBB_super" value="1" />
          
      <input type="submit" class="button" name="Submit" value="�� ��" />
      &nbsp;&nbsp;
          
      <input type="reset" class="button" name="Submit2" value="�� ��" />
      &nbsp;&nbsp;
          
      <input type="button" class="button" name="Preview" value="Ԥ��" onclick="openpreview()" />
          </div>
        </div>
        </form>
        <form action="preview.asp" method="post" name="preview" target="preview_page" id="preview">
          
  <input type="hidden" name="UBB_super" value"value" />
          
  <input type="hidden" name="usertitle" value"value" />
          
  <input type="hidden" name="usercontent" value"value" />
        </form>
<%
end function

sub addnew()	'//////// ������������ݿ�

	dim username,userURL,usermail,userqq,usertitle,usercontent

		userqq=sql_filter(trim(request.form("userqq")))
		usertitle=trim(request.form("usertitle"))
		usercontent=rtrim(request.form("usercontent"))

	if usertitle="" then
		errinfo=errinfo & "<li>δ��д����</li>"
		elseif len(usertitle)>50 then
		errinfo=errinfo & "<li>�����ı���</li>"
	end if

	if usercontent="" then
		errinfo=errinfo & "<li>δ��д��������</li>"
	end if

	if trim(userqq)<>"" then
		if not(isnumeric(userqq)) then
			errinfo=errinfo & "<li>QQ������д����</li>"
		end if
	end if

call showError()

	set rs= server.createobject("adodb.recordset")
	sql="select * from [topic]"
	rs.open sql,conn,3,2
	rs.addnew
	rs("username")=name
	rs("xingbie")=0
	rs("userURL")=URL
	rs("usermail")=adminmail
	rs("userqq")=userqq
	rs("usertime")=now()
	rs("usertitle")=usertitle
	rs("usercontent")=usercontent
	rs("top")="1"
	rs("reply")="0"
	rs("ip")=user_ip
	rs("checked")=1
	rs("whisper")=0
	rs.update
	rs.close
	response.redirect "index.asp"
	response.flush

end sub
%>