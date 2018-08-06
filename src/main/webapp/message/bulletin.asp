<!--#include file="inc_common.asp"-->
<%
'**************************************
'**		bulletin.asp
'**
'** 文件说明：公告发布页面
'** 修改日期：2006-04-30
'** 作者：Howlion
'** Email：howlion@163.com
'**************************************

if not login then
	errinfo="<li>您未登陆或已经退出登陆，不能进入该页。</li>"
	call showError()
end if


select case Request.QueryString("act")
case "addnew"
	call addnew()
case else
	pagename="发布公告"
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
          <div class="row-left">QQ号码：</div>
          <div class="row-right">
          
      <input name="userqq" size="19" maxlength="80" value="<%=Request.Cookies("SranM_userinfo")("SranM_userqq")%>" />
          </div>
        </div>
        <div class="row">
          <div class="row-left"><span class="red">***</span> 公告标题：</div>
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
          <div class="row-left"><span class="red">***</span> 公告正文：</div>
          <div class="row-right">
          <textarea cols="60" rows="12" name="usercontent" id="usercontent" title="Ctrl+Enter提交" onkeydown="ctlent()" onselect="storeCaret(this);" onclick="storeCaret(this);" onkeyup="storeCaret(this);"></textarea>
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
          
      <input type="submit" class="button" name="Submit" value="提 交" />
      &nbsp;&nbsp;
          
      <input type="reset" class="button" name="Submit2" value="清 除" />
      &nbsp;&nbsp;
          
      <input type="button" class="button" name="Preview" value="预览" onclick="openpreview()" />
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

sub addnew()	'//////// 将公告加入数据库

	dim username,userURL,usermail,userqq,usertitle,usercontent

		userqq=sql_filter(trim(request.form("userqq")))
		usertitle=trim(request.form("usertitle"))
		usercontent=rtrim(request.form("usercontent"))

	if usertitle="" then
		errinfo=errinfo & "<li>未填写标题</li>"
		elseif len(usertitle)>50 then
		errinfo=errinfo & "<li>过长的标题</li>"
	end if

	if usercontent="" then
		errinfo=errinfo & "<li>未填写留言内容</li>"
	end if

	if trim(userqq)<>"" then
		if not(isnumeric(userqq)) then
			errinfo=errinfo & "<li>QQ号码填写有误</li>"
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