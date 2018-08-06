<!--#include file="inc_common.asp"-->
<!--#include file="UBB.asp"-->
<%
'**************************************
'**		viewreply.asp
'**
'** 文件说明：查看回复页面
'** 修改日期：2006-04-30
'** 作者：Howlion
'** Email：howlion@163.com
'**************************************

dim id,replycode
	id=sql_filter(Trim(Request.Form("id")))
	replycode=Request.Form("replycode")

if id="" or (not isnumeric(id)) then
	errinfo="<li>非法的页面参数！</li>"
	call showError()
end if

pagename="查看回复"

call bodySkin()
sub pageContent()
	showReply()
end sub

function showReply()

sql="Select * from [topic] where id="&id
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3

if rs.eof and rs.bof then
	rs.close
	set rs=nothing
	errinfo="<li>该留言不存在。</li>"
else
	if replycode <> rs("replycode") then
		rs.close
		set rs=nothing
		errinfo="<li>回复查看码有误，请核对后重新输入。</li>"
	else
		if rs("replycode")="" or (not rs("reply")=1) then
			rs.close
			set rs=nothing
			errinfo="<li>该留言没有被回复。</li>"
		end if
	end if
end if
call showError()

dim username,userURL,usermail,userqq,usertitle,usertime,usercontent,recontent,retime
	username = HTMLencode(rs("username"))
	userURL = HTMLencode(rs("userURL"))
	usermail = HTMLencode(rs("usermail"))
	userqq = HTMLencode(rs("userqq"))
	usertitle = HTMLencode(rs("usertitle"))
	usertime = rs("usertime")
	usercontent = UBBCode(rs("usercontent"),rs("top"))
	recontent = UBBCode(rs("recontent"),1)
	retime = rs("retime")
%>
        <a id="msg<%=rs("id")%>">
        <div class="msgArea">
          <div class="msgArea-left"> <!-- 	头像、称呼  -->
            <ul >
              <li class="userFace"><img class="face-normal" src="<%=userfacesFolder%>/<%=rs("userface")%>.gif" alt="<%=username%>" /></li>
              <li class="userName"><%=username%></li>
            </ul>
          </div>
          <div class="msgArea-right"> <!-- 	标题、时间、留言内容、回复  -->
            <div class="msgTitle">标题：<h3><%=usertitle%></h3></div>
            <div class="msgTime" ><%=usertime%></div>
            <div class="userContact">
             <%if not rs("userURL")="" then%><a target="_blank" href="<%=userURL%>"><img class="imgLink" src="<%=imagesFolder%>/homepage.gif" alt="访问“<%=username%>”的网站" /></a>
             <%else%>
             <img class="imgLink" src="<%=imagesFolder%>/homepage_grey.gif" alt="" />
             <%end if%>
             <%if not rs("usermail")="" then%><a href="mailto:<%=usermail%>"><img class="imgLink" src="<%=imagesFolder%>/email.gif" alt="给“<%=username%>”发送电子邮件" /></a>
             <%else%>
             <img class="imgLink" src="<%=imagesFolder%>/email_grey.gif" alt="" />
             <%end if%>
             <%if not rs("userqq")="" then%><a target="blank" href="http://wpa.qq.com/msgrd?V=1&Uin=<%=userqq%>&Site=<%=site%>&Menu=yes"><img class="imgLink" src="<%=imagesFolder%>/qq.gif" alt="向“<%=username%>”的QQ发起临时会话（QQ软件须开启）" /></a>
             <%else%>
             <img class="imgLink" src="<%=imagesFolder%>/qq_grey.gif" alt="" />
             <%end if%>
            </div>
            <div class="msgContent"><table><tr><td><%=usercontent%></td></tr></table></div>
            <%if rs("reply")=1 then%>
            <div class="msgReply">
              <div class="msgReply-top"><b>管理员回复 : </b>( <%=retime%> )</div>
              <div class="msgReply-content"><table><tr><td><%=recontent%></td></tr></table></div>
            </div>
            <%end if%>
          </div>
         <div class="msgArea-clear"></div>
        </div>
<%
rs.close
set rs=nothing
end function
%>