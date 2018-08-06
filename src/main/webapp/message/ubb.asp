<%
'**************************************
'**		UBB.asp
'**
'** 文件说明：UBB转换函数
'** 修改日期：2006-04-30
'** 作者：Howlion
'** Email：howlion@163.com
'**************************************

function UBBCode(strContent,issuper)

	strContent = HTMLEncode(strContent)
	dim re
	Set re=new RegExp
	re.IgnoreCase =True
	re.Global=True

	re.Pattern="(javascript)"
	strContent=re.Replace(strContent,"&#106avascript")
	re.Pattern="(jscript:)"
	strContent=re.Replace(strContent,"&#106script:")
	re.Pattern="(js:)"
	strContent=re.Replace(strContent,"&#106s:")
	re.Pattern="(value)"
	strContent=re.Replace(strContent,"&#118alue")
	re.Pattern="(about:)"
	strContent=re.Replace(strContent,"about&#58")
	re.Pattern="(file:)"
	strContent=re.Replace(strContent,"file&#58")
	re.Pattern="(document.cookie)"
	strContent=re.Replace(strContent,"documents&#46cookie")
	re.Pattern="(vbscript:)"
	strContent=re.Replace(strContent,"&#118bscript:")
	re.Pattern="(vbs:)"
	strContent=re.Replace(strContent,"&#118bs:")
	re.Pattern="(on(mouse|exit|error|click|key))"
	strContent=re.Replace(strContent,"&#111n$2")

	if UBBcfg_emot=1 or issuper=1 then
		re.Pattern="(\[face([0-9]{2})\])"
		strContent=re.Replace(strContent,"<img src="""&emotFolder&"/$2.gif"" class=""emot"" />")
		re.Pattern="(\[emot([0-9]{2})\])"
		strContent=re.Replace(strContent,"<img src="""&emotFolder&"/$2.gif"" class=""emot"" />")
	end if

	if UBBcfg_pic=1 or issuper=1 then
		re.Pattern="(\[IMG\])(.[^\[]*)(\[\/IMG\])"
		strContent=re.Replace(strContent,"<div class=""autoSizeImg""><a href=""$2"" target=""_blank""><img border='0' SRC=""$2"" alt=""$2"" /></a></div>")
	end if

	if UBBcfg_swf=1 or issuper=1 then
		re.Pattern="(\[FLASH=([0-9]{1,3}),([0-9]{1,3})\])(.[^\[]*)(\[\/FLASH\])"
		strContent= re.Replace(strContent,"<div class=""autoSizeImg""><object codebase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0 classid=clsid:d27cdb6e-ae6d-11cf-96b8-444553540000 width=$2 height=$3><param name=movie value=""$4""><param name=quality value=high><embed src=""$4"" quality=high pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?p1_prod_version=shockwaveflash' type='application/x-shockwave-flash' width=$2 height=$3>$4</embed></object></div>")
	end if

	if UBBcfg_font=1 or issuper=1 then
		re.Pattern="(\[face=*(.[^\]]*)\])"
		strContent = re.Replace(strContent,"<font face=""$2"">")
		re.Pattern="(\[/face\])"
		strContent = re.Replace(strContent,"</font>")
	end if

	if UBBcfg_color=1 or issuper=1 then
		re.Pattern="(\[color=*(.[^\]]*)\])"
		strContent = re.Replace(strContent,"<font color=""$2"">")
		re.Pattern="(\[/color\])"
		strContent = re.Replace(strContent,"</font>")
	end if

	if UBBcfg_size=1 or issuper=1 then
		re.Pattern="(\[size=1\])"
		strContent = re.Replace(strContent,"<span style=""font-size: 9px;"">")
		re.Pattern="(\[size=2\])"
		strContent = re.Replace(strContent,"<span style=""font-size: 12px;"">")
		re.Pattern="(\[size=3\])"
		strContent = re.Replace(strContent,"<span style=""font-size: 16px;"">")
		re.Pattern="(\[size=4\])"
		strContent = re.Replace(strContent,"<span style=""font-size: 20px;"">")
		re.Pattern="(\[size=5\])"
		strContent = re.Replace(strContent,"<span style=""font-size: 26px;"">")
		re.Pattern="(\[/size\])"
		strContent = re.Replace(strContent,"</span>")
	end if

	if UBBcfg_b=1 or issuper=1 then
		re.Pattern="(\[B\])"
		strContent = re.Replace(strContent,"<b>")
		re.Pattern="(\[/B\])"
		strContent = re.Replace(strContent,"</b>")
	end if

	if UBBcfg_i=1 or issuper=1 then
		re.Pattern="(\[I\])"
		strContent = re.Replace(strContent,"<i>")
		re.Pattern="(\[/I\])"
		strContent = re.Replace(strContent,"</i>")
	end if

	if UBBcfg_u=1 or issuper=1 then
		re.Pattern="(\[U\])"
		strContent = re.Replace(strContent,"<u>")
		re.Pattern="(\[/U\])"
		strContent = re.Replace(strContent,"</u>")
	end if

	if UBBcfg_center=1 or issuper=1 then
		re.Pattern="(\[center\])"
		strContent = re.Replace(strContent,"<center>")
		re.Pattern="(\[/center\])"
		strContent = re.Replace(strContent,"</center>")
	end if

	if UBBcfg_shadow=1 or issuper=1 then
		re.Pattern="\[SHADOW=*([0-9]*),*(#*[a-z0-9]*),*([0-9]*)\](.[^\[]*)\[\/SHADOW]"
		strContent=re.Replace(strContent,"<table width=""$1""><tr><td style=""filter:shadow(color=$2, strength=$3)"">$4</td></tr></table>")
	end if

	if UBBcfg_glow=1 or issuper=1 then
		re.Pattern="\[GLOW=*([0-9]*),*(#*[a-z0-9]*),*([0-9]*)\](.[^\[]*)\[\/GLOW]"
		strContent=re.Replace(strContent,"<table width=""$1""><tr><td style=""filter:glow(color=$2, strength=$3)"">$4</td></tr></table>")
	end if

	if UBBcfg_URL=1 or issuper=1 then
		re.Pattern="(\[URL\])(.[^\[]*)(\[\/URL\])"
		strContent= re.Replace(strContent,"<a href=""$2"" target=""_blank"">$2</a>")
		re.Pattern="(\[URL=(.[^\[]*)\])(.[^\[]*)(\[\/URL\])"
		strContent= re.Replace(strContent,"<a href=""$2"" target=""_blank"">$3</a>")
		re.Pattern = "^(http://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"<a target=""_blank"" href=""$1"">$1</a>")
		re.Pattern = "(http://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)$"
		strContent = re.Replace(strContent,"<a target=""_blank"" href=""$1"">$1</a>")
		re.Pattern = "[^>=""](http://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"<a target=""_blank"" href=""$1"">$1</a>")
		re.Pattern = "^(ftp://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"<a target=""_blank"" href=""$1"">$1</a>")
		re.Pattern = "(ftp://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)$"
		strContent = re.Replace(strContent,"<a target=""_blank"" href=""$1"">$1</a>")
		re.Pattern = "[^>=""](ftp://[A-Za-z0-9\.\/=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"<a target=""_blank"" href=""$1"">$1</a>")
		re.Pattern = "^(rtsp://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"<a target=""_blank"" href=""$1"">$1</a>")
		re.Pattern = "(rtsp://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)$"
		strContent = re.Replace(strContent,"<a target=""_blank"" href=""$1"">$1</a>")
		re.Pattern = "[^>=""](rtsp://[A-Za-z0-9\.\/=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"<a target=""_blank"" href=""$1"">$1</a>")
		re.Pattern = "^(mms://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"<a target=""_blank"" href=""$1"">$1</a>")
		re.Pattern = "(mms://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)$"
		strContent = re.Replace(strContent,"<a target=""_blank"" href=""$1"">$1</a>")
		re.Pattern = "[^>=""](mms://[A-Za-z0-9\.\/=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"<a target=""_blank"" href=""$1"">$1</a>")
	end if

	if UBBcfg_email=1 or issuper=1 then
		re.Pattern="(\[EMAIL\])(.[^\]]*)(\[\/EMAIL\])"
		strContent= re.Replace(strContent,"<a href=""mailto:$2"">$2</a>")
		re.Pattern="(\[EMAIL=(.[^\]]*)\])(.[^\]]*)(\[\/EMAIL\])"
		strContent= re.Replace(strContent,"<a href=""mailto:$2"">$3</a>")
	end if

	set re=Nothing
	UBBCode=strContent

end function

function HTMLEncode(fString)
	if not isnull(fString) then
		fString = back_filter(fString)
		fString = replace(fString, ">", "&gt;")
		fString = replace(fString, "<", "&lt;")
		fString = Replace(fString, CHR(32), "&nbsp;")
		fString = Replace(fString, CHR(9), "&nbsp;")
		fString = Replace(fString, CHR(34), "&quot;")
		fString = Replace(fString, CHR(39), "&#39;")
		fString = Replace(fString, CHR(10) & CHR(10), "</p><p> ")
		fString = Replace(fString, CHR(10), "<br /> ")
		fString = Replace(fString, CHR(36), "&#36;")
		HTMLEncode = fString
	end if
end function
%>