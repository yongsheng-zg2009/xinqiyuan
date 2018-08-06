
<%Session.CodePage=936%>
<%Response.Buffer = True%>
<%session.timeout=20%>
<!--#include file="inc_connect.asp"-->
<%
'**************************************
'**		inc_common.asp
'**
'** 修改日期：2006-04-30
'** 作者：Howlion
'** Email：howlion@163.com
'**************************************


'//////// 访问统计
if not session("in_site") = true then
	set rs= server.createobject("adodb.recordset")
	sql="select top 1 stat from [admin]"
	rs.open sql,conn,3,2
	rs.update
	rs("stat")=rs("stat")+1
	rs.update
	rs.close
	set rs=nothing
	session("in_site") = true
end if

'//////// 常用数据提取
dim name,password,perpage,site,URL,adminmail
dim maxnum,notice,stat,lock,needcheck,badip,adword,UBBcfg
dim skinFolder,imagesFolder,emotFolder,userfacesFolder,needSecurityCode
set rs=server.createobject("adodb.recordset")
sql="select top 1 * from [admin]"
rs.open sql,conn,1,1
	name=trim(rs("name"))
	password=rs("password")
	perpage=trim(rs("perpage"))
	site=trim(rs("site"))
	URL=trim(rs("URL"))
	adminmail=trim(rs("adminmail"))
	maxnum=cint(trim(rs("maxnum")))
	notice=trim(rs("notice"))
	stat=rs("stat")
	lock=rs("lock")
	needcheck=rs("needcheck")
	badip=trim(rs("badip"))
	adword=trim(rs("adword"))
	UBBcfg=rs("UBBconfig")
	skinFolder=trim(rs("skinFolder"))
	imagesFolder=trim(rs("imagesFolder"))
	emotFolder=trim(rs("emotFolder"))
	userfacesFolder=trim(rs("userfacesFolder"))
	needSecurityCode=true

	'//////// 自定义UBB支持
	dim UBBcfg_font,UBBcfg_size,UBBcfg_color,UBBcfg_b,UBBcfg_i,UBBcfg_u
	dim UBBcfg_center,UBBcfg_URL,UBBcfg_email,UBBcfg_shadow,UBBcfg_glow
	dim UBBcfg_pic,UBBcfg_swf,UBBcfg_emot
		if instr(UBBcfg,"font")>0 then UBBcfg_font=1
		if instr(UBBcfg,"size")>0 then UBBcfg_size=1
		if instr(UBBcfg,"color")>0 then UBBcfg_color=1
		if instr(UBBcfg,"bold")>0 then UBBcfg_b=1
		if instr(UBBcfg,"italic")>0 then UBBcfg_i=1
		if instr(UBBcfg,"underline")>0 then UBBcfg_u=1
		if instr(UBBcfg,"center")>0 then UBBcfg_center=1
		if instr(UBBcfg,"URL")>0 then UBBcfg_URL=1
		if instr(UBBcfg,"email")>0 then UBBcfg_email=1
		if instr(UBBcfg,"shadow")>0 then UBBcfg_shadow=1
		if instr(UBBcfg,"glow")>0 then UBBcfg_glow=1
		if instr(UBBcfg,"pic")>0 then UBBcfg_pic=1
		if instr(UBBcfg,"swf")>0 then UBBcfg_swf=1
		if instr(UBBcfg,"emot")>0 then UBBcfg_emot=1

rs.close
set rs=nothing

dim user_ip	'//////// 取得真实IP地址
if request.servervariables("http_x_forwarded_for")="" then
	user_ip=request.servervariables("remote_addr")
else
	user_ip=request.servervariables("http_x_forwarded_for")
end if

if not badip="" then	'//////// 限制IP访问
	dim allbadip,i
		allbadip=split(badip,chr(13)&chr(10))
	for i = lbound(allbadip) to ubound(allbadip)
		if user_ip = trim(allbadip(i)) then
			errinfo="<li>您的IP已被阻挡。"
			call showError()
			response.end
		end if
	next
end if

dim login	'//////// 判断是否登陆
if session("SranM_login") = true then
	login=true
else
	if Request.Cookies("SranM_mypassword") = password then
		login=true
	else
		login=false
	end if
end if

dim pagename
dim code_version
	code_version="2.30" '//////// 版本号


sub pageHead() '//////// 页面头部信息
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn" lang="zh-cn">
<head>
<meta name="Description" content="曾宝仪电影院求片、报错、建议区<%=code_version%>" />
<meta name="Keywords" content="<%=site%>,求片、报错、建议留言本" />
<meta http-equiv="content-language" content="zh-cn" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<style> html { overflow-x:hidden; } </style> 
<%if pagename="查看留言" then%><title>留言本 - <%=site%></title>
<%else%><title><%=pagename%> - <%=site%></title><%end if%>
<link rel="stylesheet" type="text/css" href="<%=skinFolder%>/style.css" />
<script type="text/javascript" src="inc_common.js"></script>
</head>
<%
end sub

sub bodySkin() '//////// 通用界面
call pageHead()
sql="select id from [topic] order by usertime desc"
set rs=server.createobject("ADODB.recordset")
rs.open sql,conn,1,1

dim totalMsg
totalMsg=rs.recordcount
rs.close
set rs=nothing
%>
<body>
<div id="wrapper"> 
  <div id="wrapperInner"> <!-- 	begin wrapperInner  -->
    <div id="topArea">
      <div id="gbInfo">
        <div id="gbInfo-info">
        <%if not login then%>
        <%else%>
        欢迎&nbsp;<b><%=name%></b>&nbsp;&nbsp;
        <a href="bulletin.asp">发布公告</a>&nbsp;&nbsp;
        <a href="index.asp">管理留言</a>&nbsp;&nbsp;
        <a href="admin.asp?act=batch">批量</a>&nbsp;&nbsp;
        <a href="admin.asp?act=main">设置留言本</a>&nbsp;&nbsp;
        <a href="login.asp?act=logout">退出登陆</a>&nbsp;&nbsp;
        <%end if%>
        </div>
      </div>
    </div>
    <div id="nav"> <!--  begin nav  -->
      <div id="navLink">
        <ul>
          <li><a title="查看留言" href="index.asp"<%if pagename="查看留言" or pagename="管理留言" then%> class="selected"<%end if%>>查看留言</a></li>
          <li><a title="写留言" href="new.asp"<%if pagename="写留言" then%> class="selected"<%end if%>>写留言</a></li>
          <li><a title="搜索留言" href="search.asp"<%if pagename="搜索留言" or pagename="搜索结果" then%> class="selected"<%end if%>>搜索留言</a></li>
          <li><a title="留言帮助" href="help.asp"<%if pagename="留言帮助" then%> class="selected"<%end if%>>留言帮助</a></li>
          <li><%if not login then%><a title="管理登陆" href="login.asp"<%if pagename="管理登陆" then%> class="selected"<%end if%>>管理登陆</a><%else%><a title="退出登陆" href="login.asp?act=logout">退出登陆</a><%end if%></li>
        </ul>
      </div>
    </div> <!--  end nav  -->
    <div id="mainContent"> <!-- 	begin mainContent  -->
      <div id="gbcontent">
      <%call pageContent()%>
      </div>
    </div> <!--  end mainContent  -->
</body>
</html>
<%
end sub

dim errinfo	'//////// 错误信息
errinfo=""
sub showError()
	if not errinfo="" then
		response.redirect "error.asp?errinfo="&errinfo
		response.flush
	end if
end sub

sub getEmot()	'//////// 获取表情图
	dim ii,i
	for i=1 to 42
		if len(i)=1 then ii="0" & i else ii=i%><a href="javascript:insertemot('[emot<%=ii%>]')"><img src="<%=emotFolder%>/<%=ii%>.gif" class="emot" /></a>&nbsp;<%
		if i=15 or i=30 then response.write "<br />"
	next
end sub

Function RndCode()	'//////// 生成四位的随即数字
Dim Codetype, vCode, vCodes
Dim CodeAmount
Codetype = "0123456789"
CodeAmount = Len(Codetype)
Randomize
For i = 1 To 4
vCode = Int(Rnd * CodeAmount)
vCodes = vCodes & Mid(Codetype, vCode + 1, 1)
Next
RndCode = vCodes
End Function

function sql_filter(text)	'//////// 在提交内容时进行SQL过滤
	if isnull(text) then
		sql_filter=""
		exit function
	end if

	dim Replace_words
	Set Replace_words=new RegExp
	Replace_words.IgnoreCase =True
	Replace_words.Global=True

	Replace_words.Pattern="(')"
	text=Replace_words.Replace(text,"''")
	Replace_words.Pattern="(;)"
	text=Replace_words.Replace(text,"；")
	Replace_words.Pattern="(%)"
	text=Replace_words.Replace(text,"％")
	Replace_words.Pattern="(and)"
	text=Replace_words.Replace(text,"ａｎｄ")
	Replace_words.Pattern="(exec)"
	text=Replace_words.Replace(text,"ｅｘｅｃ")
	Replace_words.Pattern="(execute)"
	text=Replace_words.Replace(text,"ｅｘｅｃｕｔｅ")
	Replace_words.Pattern="(insert)"
	text=Replace_words.Replace(text,"ｉｎｓｅｒｔ")
	Replace_words.Pattern="(select)"
	text=Replace_words.Replace(text,"ｓｅｌｅｃｔ")
	Replace_words.Pattern="(delete)"
	text=Replace_words.Replace(text,"ｄｅｌｅｔｅ")
	Replace_words.Pattern="(update)"
	text=Replace_words.Replace(text,"ｕｐｄａｔｅ")
	Replace_words.Pattern="(count)"
	text=Replace_words.Replace(text,"ｃｏｕｎｔ")
	Replace_words.Pattern="(chr)"
	text=Replace_words.Replace(text,"ｃｈｒ")
	Replace_words.Pattern="(mid)"
	text=Replace_words.Replace(text,"ｍｉｄ")
	Replace_words.Pattern="(master)"
	text=Replace_words.Replace(text,"ｍａｓｔｅｒ")
	Replace_words.Pattern="(truncate)"
	text=Replace_words.Replace(text,"ｔｒｕｎｃａｔｅ")
	Replace_words.Pattern="(char)"
	text=Replace_words.Replace(text,"ｃｈａｒ")
	Replace_words.Pattern="(declare)"
	text=Replace_words.Replace(text,"ｄｅｃｌａｒｅ")

	Set Replace_words=Nothing
	sql_filter = text
end function

function back_filter(text)	'//////// 在显示内容时还原被替换掉的文本
	if isnull(text) then
		back_filter=""
		exit function
	end if
	text = Replace(text,"''","'")
	text = Replace(text,"；",";")
	text = Replace(text,"％","%")
	text = Replace(text,"ａｎｄ","and")
	text = Replace(text,"ｅｘｅｃ","exec")
	text = Replace(text,"ｅｘｅｃｕｔｅ","execute")
	text = Replace(text,"ｉｎｓｅｒｔ","insert")
	text = Replace(text,"ｓｅｌｅｃｔ","select")
	text = Replace(text,"ｄｅｌｅｔｅ","delete")
	text = Replace(text,"ｕｐｄａｔｅ","update")
	text = Replace(text,"ｃｏｕｎｔ","count")
	text = Replace(text,"ｃｈｒ","chr")
	text = Replace(text,"ｍｉｄ","mid")
	text = Replace(text,"ｍａｓｔｅｒ","master")
	text = Replace(text,"ｔｒｕｎｃａｔｅ","truncate")
	text = Replace(text,"ｃｈａｒ","char")
	text = Replace(text,"ｄｅｃｌａｒｅ","declare")
	back_filter = text
end function

function formatNum(number)	'//////// 将数字转化为千分位格式
	if not(isnumeric(number)) or number = 0 then
		result = 0
		elseif len(fix(number)) < 4 then
		result = number
	else
		dim pos,res,loopcount,tempresult,dec,result
		pos = instr(1,number,".")
		if pos > 0 then
			dec = mid(number,pos)
		end if
		res = strreverse(fix(number))
		loopcount = 1
		while loopcount <= len(res)
			tempresult = tempresult + mid(res,loopcount,3)
			loopcount = loopcount + 3
			if loopcount <= len(res) then
			tempresult = tempresult + ","
			end if
		wend
		result = strreverse(tempresult) + dec
	end if
	formatNum = result
end function
%>