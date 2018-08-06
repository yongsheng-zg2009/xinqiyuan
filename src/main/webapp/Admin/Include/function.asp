<%
Function CheckStr(byVal ChkStr) '检查无效字符
	Dim Str:Str=ChkStr
	Str=Trim(Str)
	If IsNull(Str) Then
		CheckStr = ""
		Exit Function 
	End If
	Dim re
	Set re=new RegExp
	re.IgnoreCase =True
	re.Global=True
	re.Pattern="(\r\n){3,}"
	Str=re.Replace(Str,"$1$1$1")
	Set re=Nothing
	Str = Replace(Str,"'","''")
	Str = Replace(Str, "select", "sel&#101;ct")
	Str = Replace(Str, "join", "jo&#105;n")
	Str = Replace(Str, "union", "un&#105;on")
	Str = Replace(Str, "where", "wh&#101;re")
	Str = Replace(Str, "insert", "ins&#101;rt")
	Str = Replace(Str, "delete", "del&#101;te")
	Str = Replace(Str, "update", "up&#100;ate")
	Str = Replace(Str, "like", "lik&#101;")
	Str = Replace(Str, "drop", "dro&#112;")
	Str = Replace(Str, "create", "cr&#101;ate")
	Str = Replace(Str, "modify", "mod&#105;fy")
	Str = Replace(Str, "rename", "ren&#097;me")
	Str = Replace(Str, "alter", "alt&#101;r")
	Str = Replace(Str, "cast", "ca&#115;t")
	CheckStr=Str
End Function





Function HTMLEncode(reString) '转换HTML代码
	Dim Str:Str=reString
	If Not IsNull(Str) Then
		Str = UnCheckStr(Str)
		Str = Replace(Str, "&", "&amp;")
		Str = Replace(Str, ">", "&gt;")
		Str = Replace(Str, "<", "&lt;")
		Str = Replace(Str, CHR(32), "&nbsp;")
		Str = Replace(Str, CHR(9), "&nbsp;&nbsp;&nbsp;&nbsp;")
		Str = Replace(Str, CHR(9), "&#160;&#160;&#160;&#160;")
		Str = Replace(Str, CHR(34),"&quot;")
		Str = Replace(Str, CHR(39),"&#39;")
		Str = Replace(Str, CHR(13), "")
		Str = Replace(Str, CHR(10), "<br>")
		HTMLEncode = Str
	End If
End Function

Function UnCheckStr(Str)
		Str = Replace(Str, "sel&#101;ct", "select")
		Str = Replace(Str, "jo&#105;n", "join")
		Str = Replace(Str, "un&#105;on", "union")
		Str = Replace(Str, "wh&#101;re", "where")
		Str = Replace(Str, "ins&#101;rt", "insert")
		Str = Replace(Str, "del&#101;te", "delete")
		Str = Replace(Str, "up&#100;ate", "update")
		Str = Replace(Str, "lik&#101;", "like")
		Str = Replace(Str, "dro&#112;", "drop")
		Str = Replace(Str, "cr&#101;ate", "create")
		Str = Replace(Str, "mod&#105;fy", "modify")
		Str = Replace(Str, "ren&#097;me", "rename")
		Str = Replace(Str, "alt&#101;r", "alter")
		Str = Replace(Str, "ca&#115;t", "cast")
		UnCheckStr=Str
End Function


Function MultiPage(Numbers,Perpage,Curpage,Url_Add) '分页函数
	CurPage=Int(Curpage)
	Dim URL
	URL=Request.ServerVariables("Script_Name")&Url_Add
	MultiPage=""
	Dim Page,Offset,PageI
	If Int(Numbers)>Int(PerPage) Then
		Page=10
		Offset=2
		Dim Pages,FromPage,ToPage
		If Numbers Mod Cint(Perpage)=0 Then
			Pages=Int(Numbers/Perpage)
		Else
			Pages=Int(Numbers/Perpage)+1
		End If
		FromPage=Curpage-Offset
		ToPage=Curpage+Page-Offset-1
		If Page>Pages Then
			FromPage=1
			ToPage=Pages
		Else
			If FromPage<1 Then
				Topage=Curpage+1-FromPage
				FromPage=1
				If (ToPage-FromPage)<Page And (ToPage-FromPage)<Pages Then ToPage=Page
			ElseIF Topage>Pages Then
				FromPage =Curpage-Pages +ToPage
				ToPage=Pages
				If (ToPage-FromPage)<Page And (ToPage-FromPage)<Pages Then FromPage=Pages-Page+1
			End If
		End If
		MultiPage="<a href="""&Url&"page=1"">&lt;</a> "
		For PageI=FromPage TO ToPage
			If PageI<>CurPage Then
				MultiPage=MultiPage&"<a href="""&Url&"page="&PageI&""">"&PageI&"</a>&nbsp;"
			Else
				MultiPage=MultiPage&"<span style='font-size: 8pt;color: #660000;'>"&PageI&"</span>&nbsp;"
			End If
		Next
		If Int(Pages)>Int(Page) Then
			MultiPage=MultiPage&" ... <a href="""&Url&"page="&Pages&"""> "&pages&" &gt;</a>&nbsp;<input type=""text"" name=""custompage"" size=""1"" class=""pageinput"" onKeyDown=""javascript: if(window.event.keyCode == 13) window.location='"&Url&"page='+this.value;"">"
		Else
			MultiPage=MultiPage&"<a href="""&Url&"page="&Pages&""">&gt;</a>"
		End If
	End If
End Function
%>
