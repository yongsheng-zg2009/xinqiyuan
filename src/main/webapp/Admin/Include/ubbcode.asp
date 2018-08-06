<%
Function CheckLinkStr(Str)
	Str = Replace(Str, "document.cookie", ".")
	Str = Replace(Str, "document.write", ".")
	Str = Replace(Str, "javascript:", "javascript ")
	Str = Replace(Str, "vbscript:", "vbscript ")
	Str = Replace(Str, "javascript :", "javascript ")
	Str = Replace(Str, "vbscript :", "vbscript ")
	Str = Replace(Str, "[", "&#91;")
	Str = Replace(Str, "]", "&#93;")
	Str = Replace(Str, "<", "&#60;")
	Str = Replace(Str, ">", "&#62;")
	Str = Replace(Str, "{", "&#123;")
	Str = Replace(Str, "}", "&#125;")
	Str = Replace(Str, "|", "&#124;")
	Str = Replace(Str, "script", "&#115;cript")
	Str = Replace(Str, "SCRIPT", "&#083;CRIPT")
	Str = Replace(Str, "Script", "&#083;cript")
	Str = Replace(Str, "script", "&#083;cript")
	Str = Replace(Str, "object", "&#111;bject")
	Str = Replace(Str, "OBJECT", "&#079;BJECT")
	Str = Replace(Str, "Object", "&#079;bject")
	Str = Replace(Str, "object", "&#079;bject")
	Str = Replace(Str, "applet", "&#097;pplet")
	Str = Replace(Str, "APPLET", "&#065;PPLET")
	Str = Replace(Str, "Applet", "&#065;pplet")
	Str = Replace(Str, "applet", "&#065;pplet")
	Str = Replace(Str, "embed", "&#101;mbed")
	Str = Replace(Str, "EMBED", "&#069;MBED")
	Str = Replace(Str, "Embed", "&#069;mbed")
	Str = Replace(Str, "embed", "&#069;mbed")
	Str = Replace(Str, "document", "&#100;ocument")
	Str = Replace(Str, "DOCUMENT", "&#068;OCUMENT")
	Str = Replace(Str, "Document", "&#068;ocument")
	Str = Replace(Str, "document", "&#068;ocument")
	Str = Replace(Str, "cookie", "&#099;ookie")
	Str = Replace(Str, "COOKIE", "&#067;OOKIE")
	Str = Replace(Str, "Cookie", "&#067;ookie")
	Str = Replace(Str, "cookie", "&#067;ookie")
	Str = Replace(Str, "event", "&#101;vent")
	Str = Replace(Str, "EVENT", "&#069;VENT")
	Str = Replace(Str, "Event", "&#069;vent")
	Str = Replace(Str, "event", "&#069;vent")
	CheckLinkStr = Str
End Function

Function CutURL(URLStr)
	Dim URLLen
	URLLen=Len(URLStr)
	If URLLen>65 Then
		CutURL=Left(URLStr,URLLen*0.5)&" ... "&Right(URLStr,URLLen*0.3)
	Else
		CutURL=URLStr
	End If
End Function

Function UBBCode(strContent)
	If isEmpty(strContent) Or isNull(strContent) Then
        Exit Function
	Else
		Dim re, strMatches, strMatch, tmpStr1, tmpStr2, tmpStr3, tmpStr4, RNDStr
		Set re=new RegExp
		re.IgnoreCase =True
		re.Global=True

		re.Pattern="\[code\](<br>)+"
		strContent=re.Replace(strContent,"[code]")

		re.Pattern="\[code\](.*?)\[\/code\]"
		Set strMatches=re.Execute(strContent)
		For Each strMatch In strMatches
			RNDStr=Int(7999 * Rnd + 2000)
			tmpStr1=strMatch.SubMatches(0)
			strContent= Replace(strContent,strMatch.Value,"<table width=""100%"" border=""0"" align=""center"" cellpadding=""0"" cellspacing=""0"" class=""code_head""><tr><td>代码：</td><td align=""right""><a href=""javascript:CopyText(document.all.CODE_"&RNDStr&");"">[复制代码]</a> </td></tr></table><div class=""code_main"" id=""CODE_"&RNDStr&""" style=""overflow-y: auto;overflow-x:hidden;"">"&tmpStr1&"</div></div>")
		Next
		Set strMatches=Nothing
		re.Pattern="([^=\]][\s]*?|^)(https?|ftp|gopher|news|telnet|mms|rtsp)://([a-z0-9/\-_+=.~!%@?#%&;:$\\()|]+)"
		StrContent=re.Replace(StrContent,"$1[url]$2://$3[/url]")
		re.Pattern = "\[url=(.[^\]]*)\](.*?)\[\/url]"
		Set strMatches=re.Execute(strContent)
		For Each strMatch In strMatches
			tmpStr1=CheckLinkStr(strMatch.SubMatches(0))
			tmpStr2=strMatch.SubMatches(1)
			strContent=Replace(strContent,strMatch.Value,"<a target=""_blank"" href="""&tmpStr1&""">"&tmpStr2&"</a>")
		Next
		Set strMatches=Nothing
		re.Pattern = "\[url](.*?)\[\/url]"
		Set strMatches=re.Execute(strContent)
		For Each strMatch In strMatches
			tmpStr1=CheckLinkStr(strMatch.SubMatches(0))
			tmpStr2=CutURL(tmpStr1)
			strContent=Replace(strContent,strMatch.Value,"<a target=""_blank"" href="""&tmpStr1&""">"&tmpStr2&"</a>")
		Next
		Set strMatches=Nothing

		re.Pattern="\[img\](.*?)\[\/img\]"
		Set strMatches=re.Execute(strContent)
			For Each strMatch In strMatches
				tmpStr1=CheckLinkStr(strMatch.SubMatches(0))
				strContent=Replace(strContent,strMatch.Value,"<img src="""&tmpStr1&""" border=""0"" onload=""javascript:DrawImage(this);""  alt=""按此在新窗口打开图片"" onmouseover=""this.style.cursor='hand';"" onclick=""window.open(this.src);"">")
			Next
		Set strMatches=Nothing



		strContent=replace(strContent,"[swf]","[swf=500,350]")
		strContent=replace(strContent,"[wmv]","[wmv=500,350]")
		strContent=replace(strContent,"[wma]","[wma=450,70]")
		strContent=replace(strContent,"[rm]","[rm=500,350]")
		strContent=replace(strContent,"[ra]","[ra=450,60]")

			re.Pattern="\[(swf|wma|wmv|rm|ra|qt)=(\d*?|),(\d*?|)\](.*?)\[\/(swf|wma|wmv|rm|ra|qt)\]"
			Set strMatches=re.Execute(strContent)
			For Each strMatch in strMatches
				RNDStr=Int(7999 * Rnd + 2000)
				tmpStr1=CheckLinkStr(strMatch.SubMatches(3))
				strContent= Replace(strContent,strMatch.Value,"<div class=""code_head""><input id=""VOBJ_"&RNDStr&""" type=""hidden"" value=""-1"" /><a href=""javascript:UBBShowObj('"&strMatch.SubMatches(0)&"','OBJ_"&RNDStr&"','"&strMatch.SubMatches(3)&"','"&strMatch.SubMatches(1)&"','"&strMatch.SubMatches(2)&"');""> 点击显示/隐藏影音文件</a></div><div id=""OBJ_"&RNDStr&""" class=""code_main"">源地址：<a href="""&strMatch.SubMatches(3)&""" target=""_blank"">"&strMatch.SubMatches(3)&"</a></div>")
			Next
			Set strMatches=Nothing

		
		re.Pattern = "\[email=(.[^\]]*)\](.*?)\[\/email]"
		strContent = re.Replace(strContent,"<a href=""mailto:$1"">$2</a>")
		re.Pattern = "\[email](.*?)\[\/email]"
		strContent = re.Replace(strContent,"<a href=""mailto:$1"">$1</a>")

		re.Pattern="\[fly\](.*?)\[\/fly]"
		strContent=re.Replace(strContent,"<marquee width=""95%"" behavior=""alternate"" scrollamount=""3"">$1</marquee>")	
		re.Pattern="\[font=([^<>\]]*?)\](.*?)\[\/font]"
		strContent=re.Replace(strContent,"<font face=""$1"">$2</font>")
		re.Pattern="\[color=([^<>\]]*?)\](.*?)\[\/color]"
		strContent=re.Replace(strContent,"<font color=""$1"">$2</font>")
		
		re.Pattern="\[size=(\d*?)\](.*?)\[\/size]"
		strContent=re.Replace(strContent,"<font size=""$1"">$2</font>")
		re.Pattern="\[b\](.*?)\[\/b]"
		strContent=re.Replace(strContent,"<strong>$1</strong>")
		re.Pattern="\[i\](.*?)\[\/i]"
		strContent=re.Replace(strContent,"<em>$1</em>")	
		re.Pattern="\[u\](.*?)\[\/u]"
		strContent=re.Replace(strContent,"<u>$1</u>")

		set facelist_rs = conn.execute("select face_image, face_text from face")
		do while not facelist_rs.eof
			strContent=Replace(strContent,facelist_rs("face_text")," <img src=""images/face/"&facelist_rs("face_image")&""" border=""0"" align=""absmiddle"">")
			facelist_rs.movenext
		loop
		facelist_rs.close
		set facelist_rs = nothing

		Set re=Nothing
		UBBCode=strContent
	End IF

End Function
%>
