<!--#include file="inc_common.asp"-->
<%
'**************************************
'**		edit.asp
'**
'** 文件说明：留言修改页面
'** 修改日期：2006-04-30
'** 作者：Howlion
'** Email：howlion@163.com
'**************************************

if not login then
	errinfo="<li>您未登陆或已经退出登陆，不能进入该页。</li>"
	call showError()
end if

select case Request.QueryString("act")
case "update"
	call update()
case else
	pagename="编辑留言"
	call bodySkin()
	sub pageContent()
		showEdit()
	end sub
end select

function showEdit()

dim id
	id=request.querystring("id")

	sql="select usertitle,usercontent,checked from [topic] where id="&id
	set rs=server.createobject("adodb.recordset")
	rs.open sql,conn,1,3

	if rs.eof and rs.bof then
		rs.close
		set rs=nothing
		errinfo="<li>该留言不存在。</li>"
		call showError()
	end if

dim re,Referer
	Referer=Request.ServerVariables("HTTP_REFERER")
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	re.Pattern="(\?|&)#(.*)"
	Referer=re.Replace(Referer,"")
	set re=nothing
%>
        <script src="UBB.js"></script>
        <form action="?act=update" method="post" name="lw_form" id="lw_form">
        <div class="row">
          <div class="row-left">标题：</div>
          <div class="row-right">
          <input name="usertitle" size="40" maxlength="100" value="<%=back_filter(rs("usertitle"))%>" />
          </div>
        </div>
        <div class="row">
          <div class="row-right">
            <div class="row-right-graybg"><!--#include file="inc_UBB.asp"--></div>
          </div>
        </div>
        <div class="row">
          <div class="row-left"><span class="red">***</span> 正文：</div>
          <div class="row-right">
          <textarea cols="60" rows="12" name="usercontent" id="usercontent" title="Ctrl+Enter提交" onkeydown="ctlent()" onselect="storeCaret(this);" onclick="storeCaret(this);" onkeyup="storeCaret(this);"><%=back_filter(rs("usercontent"))%></textarea>
          </div>
        </div>
        <div class="row">
          <div class="row-right">
            <div class="row-right-graybg">
            <%call getEmot()%>
            </div>
          </div>
        </div>
        <%if not rs(2)=1 then%>
        <div class="row">
          <div class="row-right"><span class="noteText"><b>提示：</b>如果留言被编辑，将会自动通过审核。</div>
        </div>
        <%end if%>
        <div class="row">
          <div class="row-right"><br />
          
      <input type="hidden" name="id" value="<%=id%>" />
          
      <input type="hidden" name="Referer" value="<%=Referer%>" />
          
      <input type="submit" class="button" name="Submit" value="提 交" />
      &nbsp;&nbsp;
          
      <input type="reset" class="button" name="Submit2" value="清 除" />
      &nbsp;&nbsp;
          </div>
        </div>
        </form>
<%
	rs.close
	set rs=nothing
end function

sub update() '//////// 更新内容

	dim id,Referer,username,userURL,usermail,userqq,usertitle,usercontent
	id=request.form("id")
	Referer=request.form("Referer")
	usertitle=trim(request.form("usertitle"))
	usercontent=request.form("usercontent")

	if len(usertitle)>50 then
		errinfo=errinfo & "<li>过长的标题</li>"
	end if

	if usercontent="" then
		errinfo=errinfo & "<li>未填写留言内容</li>"
	end if

call showError()

	set rs= server.createobject("adodb.recordset")
	sql="select * from [topic] where id="&id
	rs.open sql,conn,3,2
	rs.update

	rs("usertitle")=usertitle
	rs("usercontent")=usercontent
	rs("checked")=1
	rs.update
	rs.close
	set rs=nothing

	if instr(Referer,"=")>0 then
		Referer = Referer & "&#msg" & id
	else
		Referer = Referer & "?#msg" & id
	end if

	response.redirect Referer
	response.flush
end sub
%>