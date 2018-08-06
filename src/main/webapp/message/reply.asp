<!--#include file="inc_common.asp"-->
<!--#include file="UBB.asp"-->
<%
'**************************************
'**		reply.asp
'**
'** 文件说明：回复留言页面
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
	pagename="回复留言"
	call bodySkin()
	sub pageContent()
		showReply()
	end sub
end select

function showReply()

dim id
	id=request.querystring("id")

	sql="Select * from [topic] where id="&id
	set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3

	if rs.eof and rs.bof then
		rs.close
		set rs=nothing
		errinfo="<li>该留言不存在。</li>"
		call showError()
	end if

dim username,userURL,usermail,userqq,usertitle,usertime,usercontent,recontent
	username = HTMLencode(rs("username"))
	userURL = HTMLencode(rs("userURL"))
	usermail = HTMLencode(rs("usermail"))
	userqq = HTMLencode(rs("userqq"))
	usertitle = HTMLencode(rs("usertitle"))
	usertime = rs("usertime")
	usercontent = UBBCode(rs("usercontent"),rs("top"))
	recontent = rs("recontent")

dim re,Referer
	Referer=Request.ServerVariables("HTTP_REFERER")
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	re.Pattern="(\?|&)#(.*)"
	Referer=re.Replace(Referer,"")
	set re=Nothing
%>
        <script src="UBB.js"></script>
        <form action="?act=update" method="post" name="lw_form" id="lw_form">
        <div class="msgArea">
          <div class="msgArea-left"> <!--   头像、称呼  -->
            <ul >
              <li class="userFace"><%if rs("top")=1 then%><img class="face-bulletin" src="<%=userfacesFolder%>/bulletin.gif" /><%else%><img class="face-normal" src="<%=userfacesFolder%>/<%=rs("userface")%>.gif" /><%end if%></li>
              <li class="userName"><%if rs("top")=1 then%><span class="userName-istop">管理员</span><%else%><%=username%><%end if%></li>
            </ul>
          </div>
          <div class="msgArea-right"> <!--   标题、时间、留言内容、回复  -->
            <div class="msgTitle"><%if rs("top")=1 then%><span class="msgTitle-istop">公告：</span><%else%>标题：<%end if%><h3><%=usertitle%></h3></div>
            <div class="msgTime" ><%=usertime%></div>
            <div class="userContact">
             <%if not rs("userURL")="" then%><a target="_blank" href="<%=userURL%>" title="访问“<%=username%>”的网站"><img class="imgLink" src="<%=imagesFolder%>/homepage.gif" /></a>
             <%else%>
             <img class="imgLink" src="<%=imagesFolder%>/homepage_grey.gif" alt="" />
             <%end if%>
             <%if not rs("usermail")="" then%><a href="mailto:<%=usermail%>" title="给“<%=username%>”发送电子邮件"><img class="imgLink" src="<%=imagesFolder%>/email.gif" /></a>
             <%else%>
             <img class="imgLink" src="<%=imagesFolder%>/email_grey.gif" alt="" />
             <%end if%>
             <%if not rs("userqq")="" then%><a target="blank" href="http://wpa.qq.com/msgrd?V=1&Uin=<%=userqq%>&Site=<%=site%>&Menu=yes" title="向“<%=username%>”的QQ发起临时会话（QQ软件须开启）"><img class="imgLink" src="<%=imagesFolder%>/qq.gif" /></a>
             <%else%>
             <img class="imgLink" src="<%=imagesFolder%>/qq_grey.gif" alt="" />
             <%end if%>
            </div>
            <div class="msgContent"><table><tr><td><%=usercontent%></td></tr></table></div>
          </div>
          <div class="msgArea-clear"></div>
        </div>
        <div class="row">
          <div class="row-right">
            <div class="row-right-graybg"><!--#include file="inc_UBB.asp"--></div>
          </div>
        </div>
        <div class="row">
          <div class="row-left">管理员回复：</div>
          <div class="row-right">
          <textarea cols="60" rows="12" name="usercontent" id="usercontent" title="Ctrl+Enter提交" onkeydown="ctlent()" onselect="storeCaret(this);" onclick="storeCaret(this);" onkeyup="storeCaret(this);"><%=recontent%></textarea>
          </div>
        </div>
        <div class="row">
          <div class="row-right">
            <div class="row-right-graybg">
            <%call getEmot()%>
            </div>
          </div>
        </div>
        <%if not rs("checked")=1 then%>
        <div class="row">
          <div class="row-right">
          <span class="noteText"><b>提示：</b>如果留言被回复，将会自动通过审核。</span>
          </div>
        </div>
        <%end if%>
        <div class="row">
          <div class="row-right"><br />
          <input type="hidden" name="id" value="<%=id%>">
          <input type="hidden" name="Referer" value="<%=Referer%>">
          <input type="submit" class="button" name="Submit" value="提 交">&nbsp;&nbsp;
          <input type="reset" class="button" name="Submit2" value="清 除">&nbsp;&nbsp;
          </div>
        </div>
        </form>
	<%
	rs.close
	set rs=nothing
end function

sub update()

	dim id,Referer,recontent
	id=request.Form("id")
	Referer=request.form("Referer")
	recontent=request.Form("usercontent")

	if recontent="" then
		errinfo="<li>未填写回复内容。</li>"
		call showError()
	end if

	Set rs= Server.CreateObject("ADODB.Recordset")
	sql="select * from [topic] where id="&id
	rs.open sql,conn,3,2
	rs.update
	rs("reply")="1"
	rs("retime")=NOW()
	rs("recontent")=recontent
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