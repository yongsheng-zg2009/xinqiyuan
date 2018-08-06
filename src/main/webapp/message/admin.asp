<!--#include file="inc_common.asp"-->
<!--#include file="inc_md5.asp"-->
<%


dim adminAct
	adminAct=request.querystring("act")
select case adminAct
case "update"
	call updateSettings()
case "del"
	call delMsg()
case "check"
	call checkMsg()
case else
	sub pageContent()
	if adminAct="batch" then
		BatchMsg()
	else
		SetBook()
	end if
	end sub
	if adminAct="batch" then
		pagename="批量管理留言"
	else
		pagename="设置留言本"
	end if
	call bodySkin()
end select

function SetBook()		'//////// 留言本设置页面

	if not login then
		errinfo="<li>您未登陆或已经退出登陆，不能进入该页。"
		call showError()
	else
%>
        <form method="post" action="?act=update">
        <div class="row">
          <div class="row-left">网站名称：</div>
          <div class="row-right">
          
      <input type="text" name="site" size="29" value="<%=site%>" />
      <br />
          <span class="noteText">留言本所属的站点的名称（如：搜狐网）。</span></div>
        </div>
        <div class="row">
          <div class="row-left">网站地址：</div>
          <div class="row-right">
          
      <input type="text" name="URL" size="29" value="<%=URL%>" />
      <br />
          <span class="noteText">请注意：必须是完整的地址（如：http://www.tqtec.cn/）。</span></div>
        </div>
        <div class="row">
          <div class="row-left">管理员名称：</div>
          <div class="row-right">
          
      <input type="text" name="name" size="29" value="<%=name%>" />
      <br />
          <span class="noteText">换上你自己的称呼。</span></div>
        </div>
        <div class="row">
          <div class="row-left">修改管理员密码：</div>
          <div class="row-right">
          
      <input type="password" name="password" size="29" />
      <br />
          <span class="noteText">若不希望修改，留空即可。</span></div>
        </div>
        <div class="row">
          <div class="row-left">重复密码：</div>
          <div class="row-right">
          
      <input type="password" name="password2" size="29" />
      <br />
          <span class="noteText">同上。</span></div>
        </div>
        <div class="row">
          <div class="row-left">管理员Email：</div>
          <div class="row-right">
          
      <input type="text" name="adminmail" size="29" value="<%=adminmail%>" />
      <br />
          <span class="noteText">换上你自己的email。</span></div>
        </div>
        <div class="row">
          <div class="row-left">每页显示留言数：</div>
          <div class="row-right">
          
      <input type="text" name="perpage" size="10" value="<%=perpage%>" />
    </div>
        </div>
        <div class="row">
          <div class="row-left">最大留言字数：</div>
          <div class="row-right">
          
      <input type="text" name="maxnum" size="10" value="<%=maxnum%>" />
    </div>
        </div>
        <div class="row">
          <div class="row-left">留言提示：</div>
          <div class="row-right">
          <textarea rows="5" name="notice" cols="55"><%=notice%></textarea>
      <br />
          <span class="noteText">可以是欢迎词、警告、站点说明等，将出现在提交留言页面的顶部，支持UBB代码。</span></div>
        </div>
        <div class="row">
          <div class="row-left">不受欢迎的IP：</div>
          <div class="row-right">
          <textarea rows="5" name="badip" cols="34"><%=badip%></textarea>
      <br />
          <span class="noteText">不受欢迎的IP地址将无法进入留言本。<b>每个IP地址必须占一行</b>。</span></div>
        </div>
        <div class="row">
          <div class="row-left">广告过滤：</div>
          <div class="row-right">
          <textarea rows="5" name="adword" cols="34"><%=adword%></textarea>
      <br />
          <span class="noteText">包含上述某一词语的留言将无法提交，如果以上某个词语和您的站点的主题有关，请将其从文本框中删去。<b>每个词语必须占一行</b>。</span></div>
        </div>
        <div class="row">
          <div class="row-left">访问次数：</div>
          <div class="row-right">
          
      <input type="text" name="stat" size="10" value="<%=stat%>" />
      &nbsp;<span class="noteText">修改留言本自带的计数器的数值。</span></div>
        </div>
        <div class="row">
          <div class="row-left">皮肤文件夹：</div>
          <div class="row-right">
          
      <input type="text" name="skinFolder" size="29" value="<%=skinFolder%>" />
      <br />
          <span class="noteText">外观皮肤所在的文件夹，如 skins/blue</span></div>
        </div>
        <div class="row">
          <div class="row-left">图片文件夹：</div>
          <div class="row-right">
          
      <input type="text" name="imagesFolder" size="29" value="<%=imagesFolder%>" />
      <br />
          <span class="noteText">系统图片所在的文件夹，如 skins/default/images</span></div>
        </div>
        <div class="row">
          <div class="row-left">表情文件夹：</div>
          <div class="row-right">
          
      <input type="text" name="emotFolder" size="29" value="<%=emotFolder%>" />
      <br />
          <span class="noteText">留言表情所在的文件夹，如 skins/default/emot</span></div>
        </div>
        <div class="row">
          <div class="row-left">头像文件夹：</div>
          <div class="row-right">
          
      <input type="text" name="userfacesFolder" size="29" value="<%=userfacesFolder%>" />
      <br />
          <span class="noteText">留言者头像所在的文件夹，如 skins/default/userfaces</span></div>
        </div>
        <div class="row">
          <div class="row-left">自定义UBB支持：</div>
          <div class="row-right">
          
      <input type="checkbox" name="UBBcfg" id="UBBcfg_font" value="font"<%if UBBcfg_font=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_font">字体</label>&nbsp;&nbsp;
      <input type="checkbox" name="UBBcfg" id="UBBcfg_size" value="size"<%if UBBcfg_size=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_size">字号</label>&nbsp;&nbsp;
      <input type="checkbox" name="UBBcfg" id="UBBcfg_color" value="color"<%if UBBcfg_color=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_color">文字颜色</label>&nbsp;&nbsp;
      <input type="checkbox" name="UBBcfg" id="UBBcfg_bold" value="bold"<%if UBBcfg_b=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_bold">粗体</label>&nbsp;&nbsp;
      <input type="checkbox" name="UBBcfg" id="UBBcfg_italic" value="italic"<%if UBBcfg_i=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_italic">斜体</label>&nbsp;&nbsp;
      <input type="checkbox" name="UBBcfg" id="UBBcfg_underline" value="underline"<%if UBBcfg_u=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_underline">下划线</label><br />
      <input type="checkbox" name="UBBcfg" id="UBBcfg_center" value="center"<%if UBBcfg_center=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_center">居中</label>&nbsp;&nbsp;
      <input type="checkbox" name="UBBcfg" id="UBBcfg_URL" value="URL"<%if UBBcfg_URL=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_URL">超链接</label>&nbsp;&nbsp;
      <input type="checkbox" name="UBBcfg" id="UBBcfg_email" value="email"<%if UBBcfg_email=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_email">email链接</label>&nbsp;&nbsp;
      <input type="checkbox" name="UBBcfg" id="UBBcfg_shadow" value="shadow"<%if UBBcfg_shadow=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_shadow">阴影字</label>&nbsp;&nbsp;
      <input type="checkbox" name="UBBcfg" id="UBBcfg_glow" value="glow"<%if UBBcfg_glow=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_glow">发光字</label><br />
      <input type="checkbox" name="UBBcfg" id="UBBcfg_pic" value="pic"<%if UBBcfg_pic=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_pic">图片</label>&nbsp;&nbsp;
      <input type="checkbox" name="UBBcfg" id="UBBcfg_swf" value="swf"<%if UBBcfg_swf=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_swf">Flash</label>&nbsp;&nbsp;
      <input type="checkbox" name="UBBcfg" id="UBBcfg_emot" value="emot"<%if UBBcfg_emot=1 then%> checked="checked"<%end if%> />
      <label for="UBBcfg_emot">表情图</label><br />
      <span class="noteText"><b>注意：</b>某些Flash动画可能包含有害的脚本，请慎重选择是否支持Flash！</span></div>
        </div>
        <div class="row">
          <div class="row-left">留言本状态：</div>
          <div class="row-right">
          <input type="radio" value="0" id="lock_off" <%if lock=0 then%>checked="checked" <%end if%>name="lock" /> <label for="lock_off">开放</label>&nbsp;&nbsp;
          <input type="radio" value="1" id="lock_on" <%if lock=1 then%>checked="checked" <%end if%>name="lock" /> <label for="lock_on">锁定</label>&nbsp;&nbsp;<span class="noteText">（若锁定，任何人都不能发表留言）</span>
          </div>
        </div>
        <div class="row">
          <div class="row-left">留言审核：</div>
          <div class="row-right">
          <input type="radio" value="1" <%if needcheck=1 then%>checked="checked" <%end if%>name="needcheck" id="needcheck_on" /> <label for="needcheck_on">需要</label>&nbsp;&nbsp;
          <input type="radio" value="0" <%if needcheck=0 then%>checked="checked" <%end if%>name="needcheck" id="needcheck_off" /> <label for="needcheck_off">不需要</label>&nbsp;&nbsp;<span class="noteText">（未经审核的留言将不会被显示，但管理员可以看到）</span></div>
        </div>
        <div class="row">
          <div class="row-right"><br />
          <input type="submit" class="button" value="提 交" name="submit" />
      &nbsp;&nbsp;
          <input type="reset" class="button" value="清 除" name="submit2" />
          </div>
        </div>
        </form>
<%
	end if
	conn.close
	set rs=nothing
end function

sub updateSettings()		'//////// 更新设置
if not login then
	errinfo="<li>您未登陆或已经退出登陆，不能进入该页。</li>"
	call showError()
else
	dim new_site,new_URL,new_name,new_password1
	dim new_password2,new_adminmail,new_perpage
	dim new_maxnum,new_notice,new_badip,new_adword
	dim new_stat,new_UBBcfg,new_lock,new_needcheck
	dim new_skinFolder,new_imagesFolder,new_emotFolder,new_userfacesFolder

	new_site=trim(request.form("site"))
	new_URL=trim(request.form("URL"))
	new_name=trim(request.form("name"))
	new_password1=trim(request.form("password"))
	new_password2=trim(request.form("password2"))
	new_adminmail=trim(request.form("adminmail"))
	new_perpage=trim(request.form("perpage"))
	new_maxnum=trim(request.form("maxnum"))
	new_notice=request.form("notice")
	new_badip=trim(request.form("badip"))
	new_adword=trim(request.form("adword"))
	new_stat=trim(request.form("stat"))
	new_UBBcfg=request.form("UBBcfg")
	new_lock=request.form("lock")
	new_needcheck=request.form("needcheck")
	new_skinFolder=trim(request.form("skinFolder"))
	new_imagesFolder=trim(request.form("imagesFolder"))
	new_emotFolder=trim(request.form("emotFolder"))
	new_userfacesFolder=trim(request.form("userfacesFolder"))

	if new_site="" or new_URL="" or new_name="" or new_adminmail="" or new_perpage="" or new_maxnum="" or new_stat="" or new_lock="" or new_skinFolder="" or new_imagesFolder="" or new_emotFolder="" or new_userfacesFolder="" then
		errinfo=errinfo & "<li>内容填写不完整。除了留言提示、IP列表、管理密码和广告过滤以外，其它各项都是必填的</li>"
	end if

	if new_password1<>new_password2 then
		errinfo=errinfo & "<li>两次输入的密码不一致</li>"
	else
		dim finalPW
		if new_password1="" then
			finalPW=password
		else
			finalPW=MD5(new_password1)
		end if
	end if

	if (not new_perpage="") and not(isnumeric(new_perpage)) then
		errinfo=errinfo & "<li>每页显示留言数必须为数字</li>"
	end if

	if (not new_maxnum="") and not(isnumeric(new_maxnum)) then
		errinfo=errinfo & "<li>最大留言字数必须为数字</li>"
	end if

	if (not new_stat="") and not(isnumeric(new_stat)) then
		errinfo=errinfo & "<li>访问次数必须为数字</li>"
	end if

	call showError()

	set rs= server.createobject("adodb.recordset")
		sql="select top 1 * from [admin]"
		rs.open sql,conn,3,2
		rs.update
		rs("site")=new_site
		rs("URL")=new_URL
		rs("name")=new_name
		rs("password")=finalPW
		rs("adminmail")=new_adminmail
		rs("perpage")=new_perpage
		rs("maxnum")=new_maxnum
		rs("notice")=new_notice
		rs("badip")=new_badip
		rs("adword")=new_adword
		rs("stat")=new_stat
		rs("UBBconfig")=new_UBBcfg
		rs("lock")=new_lock
		rs("needcheck")=new_needcheck
		rs("skinFolder")=new_skinFolder
		rs("imagesFolder")=new_imagesFolder
		rs("emotFolder")=new_emotFolder
		rs("userfacesFolder")=new_userfacesFolder
		rs.update
		rs.close

	response.redirect "index.asp"
	response.flush

end if
end sub

function BatchMsg()		'//////// 批量管理留言

	dim currentpage,page_count,pcount
	dim totalrec,endpage
	if request.querystring("page")="" then
		currentpage=1
	else
		currentpage=cint(request.querystring("page"))
	end if

	if not login then
		errinfo="<li>您未登陆或已经退出登陆，不能进入该页。</li>"
		call showError()
	end if

	if (not isnumeric(request.querystring("page"))) or (not isnumeric(request.querystring("page_num"))) then
		errinfo="<li>非法的页面参数！</li>"
		call showError()
	end if

	dim view,page_num
		view=request.querystring("view")
		if request.querystring("page_num")="" then
			page_num=20
		else
			page_num=request.querystring("page_num")
		end if

	select case request.querystring("view")
		case "1"
			sql="select * from [topic] where (not checked=1) order by usertime desc"
			set rs=server.createobject("adodb.recordset")
			rs.open sql,conn,1,1
		case "2"
			sql="select * from [topic] where (not reply=1) order by usertime desc"
			set rs=server.createobject("adodb.recordset")
			rs.open sql,conn,1,1
		case else
			sql="select * from [topic] order by usertime desc"
			set rs=server.createobject("adodb.recordset")
			rs.open sql,conn,1,1
	end select

	if rs.eof and rs.bof then
		errinfo="<li>没有此类留言。</li>"
		call showError()
	else
		rs.pagesize = page_num
		rs.absolutepage=currentpage
		page_count=0
		totalrec=rs.recordcount

%>
        <form action="admin.asp?act=" method="post" name="batch_form" id="batch_form" onsubmit="return Submit_all(batch_form);">
        <div class="row">
          <div class="batchArea-right" style="text-align: right;">
          显示：<select name="menu_view" onChange="MM_jumpMenu('parent',this,0)">
          <option value="?act=batch&page_num=<%=page_num%>"<%if view="" then%> selected="selected"<%end if%>>所有留言</option>
          <option value="?act=batch&view=1&page_num=<%=page_num%>"<%if view="1" then%> selected="selected"<%end if%>>所有未通过审核的留言</option>
          <option value="?act=batch&view=2&page_num=<%=page_num%>"<%if view="2" then%> selected="selected"<%end if%>>所有未被回复的留言</option>
          </select>&nbsp;每页显示：<select name="menu_page_num" onChange="MM_jumpMenu('parent',this,0)">
          <option value="?act=batch&view=<%=view%>&page_num=10"<%if page_num="10" then%> selected="selected"<%end if%>>10条</option>
          <option value="?act=batch&view=<%=view%>&page_num=20"<%if page_num="20" then%> selected="selected"<%end if%>>20条</option>
          <option value="?act=batch&view=<%=view%>&page_num=50"<%if page_num="50" then%> selected="selected"<%end if%>>50条</option>
          <option value="?act=batch&view=<%=view%>&page_num=100"<%if page_num="100" then%> selected="selected"<%end if%>>100条</option>
          </select>
          </div>
        </div>
        <div class="row">
          <div class="batchArea-left">
			     <input type="hidden" value="<%=Request.ServerVariables("HTTP_URL")%>" name="Referer" />
			     <input type="checkbox" value="on" name="chkall" onclick="CheckAll(this.form)" /><br />
           全选</div>
          <div class="batchArea-topRight">
           <input type="submit" class="button" name="Submit_Del" value="批量删除" onclick="SetSubmitType('del');" />
           <input type="submit" class="button" name="Submit_Check" value="批量审核" onclick="SetSubmitType('check');" />&nbsp;&nbsp;
           <%call pages(currentpage,page_count,pcount,totalrec,endpage,page_num,view)%>
          </div>
        </div>
        <div class="row"><hr /></div>
		    <%while (not rs.eof) and (not page_count = rs.pagesize)%>
        <a id="msg<%=rs("id")%>">
        <div class="row">
          <div class="batchArea-left">
			     <input type="checkbox" name="id" id="id_<%=rs("id")%>" value="<%=rs("id")%>" />
          </div>
          <div class="batchArea-right">
			     <label for="id_<%=rs("id")%>"><b>标题</b>：<%=batchEncode(rs("usertitle"))%></label><br />
           <label for="id_<%=rs("id")%>"><b>时间</b>：<%=rs("usertime")%></label><br /><hr />
           <label for="id_<%=rs("id")%>"><b>内容代码</b>：</label><table><tr><td><label for="id_<%=rs("id")%>"><%=batchEncode(rs("usercontent"))%></label></td></tr></table>
          </div>
          <div class="adminLinks">
          <%if rs("checked")=0 then%>
          <a href="javascript:go('admin.asp?act=check&id=<%=rs("id")%>&Referer=<%=Request.ServerVariables("HTTP_URL")%>','您确定要通过审核？')"><span class="Highlight">通过审核</span></a>&nbsp;&nbsp;
          <%end if%>
          <a href="javascript:go('admin.asp?act=del&id=<%=rs("id")%>&Referer=<%=Request.ServerVariables("HTTP_URL")%>','您确定要删除？')">删除</a>&nbsp;&nbsp;
          <%if rs("whisper")=1 and rs("replycode")="" then%>
          <span class="Highlight">无法回复的悄悄话</span>
          <%else%>
          <a href="reply.asp?id=<%=rs("id")%>"><%if rs("whisper")=1 then%><span class="Highlight">悄悄话回复/编辑回复</span><%else%>回复/编辑回复<%end if%></a><%end if%>&nbsp;&nbsp;<a href="edit.asp?id=<%=rs("id")%>">编辑</a>&nbsp;&nbsp;留言IP：<%=rs("ip")%>
          </div>
        </div>
		    <%
        page_count = page_count + 1
		    rs.movenext
		    wend
        %>
        <div class="row">
          <div class="batchArea-left">
			     <input type="checkbox" value="on" name="chkall2" id="chkall2" onclick="javascript:chkall.click()" /><br />全选</div>
          <div class="batchArea-topRight">
           <input type="submit" class="button" name="Submit_Del" value="批量删除" onclick="SetSubmitType('del');" />
           <input type="submit" class="button" name="Submit_Check" value="批量审核" onclick="SetSubmitType('check');" />&nbsp;&nbsp;
           <%call pages(currentpage,page_count,pcount,totalrec,endpage,page_num,view)%>
          </div>
        </div>
</form>
<%
	end if
	rs.close
	set rs=nothing
end function

sub pages(currentpage,page_count,pcount,totalrec,endpage,page_num,view)	'// 分页代码
	dim ii,p,n
	if totalrec mod page_num=0 then
		n= totalrec \ page_num
	else
		n= totalrec \ page_num+1
	end if
	p=(currentpage-1) \ 5
	%>
	页次：<b><%=currentpage%>/<%=n%></b>页，共<b><%=totalrec%></b>条&nbsp;&nbsp;&nbsp;
	<%if currentpage=1 then%>首页&nbsp;
	<%else%><a href="?act=batch&view=<%=view%>&page_num=<%=page_num%>&page=1" title="首页">首页</a>&nbsp;
	<%end if%>
	<%if p*5>0 then%>
	<a href="?act=batch&view=<%=view%>&page_num=<%=page_num%>&page=<%=cstr(p*5)%>" title="上五页">上翻</a>&nbsp;
	<%end if
	for ii=p*5+1 to p*5+5
	if ii=currentpage then%>
	<span class="currtNum"><%=cstr(ii)%></span>
	<%else%>
	<a href="?act=batch&view=<%=view%>&page_num=<%=page_num%>&page=<%=cstr(ii)%>"><%=cstr(ii)%></a>
	<%end if
	if ii=n then exit for
	next
	%>
	<%if ii<n then%>
	&nbsp;<a href="?act=batch&view=<%=view%>&page_num=<%=page_num%>&page=<%=cstr(ii)%>" title="下五页">下翻</a>
	<%end if%>
	<%if currentpage=n then%>
	&nbsp;尾页
	<%else%>
	&nbsp;<a href="?act=batch&view=<%=view%>&page_num=<%=page_num%>&page=<%=cstr(n)%>" title="尾页">尾页</a>
	<%
  end if
end sub

function batchEncode(fString)
	if not isnull(fString) then
		fString = back_filter(fString)
		fString = replace(fString, ">", "&gt;")
		fString = replace(fString, "<", "&lt;")
		fString = Replace(fString, "''", "'")
		fString = Replace(fString, CHR(32), "&nbsp;")
		fString = Replace(fString, CHR(9), "&nbsp;")
		fString = Replace(fString, CHR(34), "&quot;")
		fString = Replace(fString, CHR(39), "&#39;")
		fString = Replace(fString, CHR(36), "&#36;")
		batchEncode = fString
	end if
end function

sub delMsg()		'////////////// 删除留言
	dim id
	id = request("id")

dim re,Referer
	Referer=request("Referer")
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	re.Pattern="(\?|&)#(.*)"
	Referer=re.Replace(Referer,"")
	re.Pattern="[^A-Za-z0-9]$"
	Referer=re.Replace(Referer,"")
	set re=nothing

	if not login then
		errinfo="<li>您未登陆或已经退出登陆，不能进入该页。</li>"
		call showError()
	else
		if id="" then
			errinfo="<li>您未选定任何留言。</li>"
			call showError()
		end if

		sql="select id from [topic] where id in ("&id&")"
		set rs=server.createobject("adodb.recordset")
		rs.open sql,conn,1,3

		if rs.eof and rs.bof then
		rs.close
		set rs=nothing
		errinfo="<li>该留言不存在。</li>"
		call showError()
		end if

		rs.close
		set rs=nothing

		sql="delete from [topic] where id in ("&id&")"
		conn.execute(sql)
		conn.close

		if request.querystring("page")="" then
			response.redirect Referer
		else
			response.redirect Referer & "&page=" & request.querystring("page")
		end if
		response.flush

	end if
end sub

sub checkMsg()		'///////////// 审核留言
	dim id
	id = request("id")

dim re,Referer
	Referer=request("Referer")
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	re.Pattern="(\?|&)#(.*)"
	Referer=re.Replace(Referer,"")
	re.Pattern="[^A-Za-z0-9]$"
	Referer=re.Replace(Referer,"")
	set re=nothing

	if not login then
		errinfo="<li>您未登陆或已经退出登陆，不能进入该页。</li>"
		call showError()
	else
		if id="" then
			errinfo="<li>您未选定任何留言。</li>"
			call showError()
		end if

		sql="select id from [topic] where id in ("&id&")"
		set rs=server.createobject("adodb.recordset")
		rs.open sql,conn,1,3
		if rs.eof and rs.bof then
			rs.close
			set rs=nothing
			errinfo="<li>该留言不存在。</li>"
			call showError()
		end if

		rs.close
		set rs=nothing

		sql="update topic set checked='1' where id in ("&id&")"
		conn.execute(sql)
		conn.close

		if request.querystring("page")="" then
			response.redirect Referer
		else
			response.redirect Referer & "&page=" & request.querystring("page")
		end if
		response.flush

	end if
end sub
%>