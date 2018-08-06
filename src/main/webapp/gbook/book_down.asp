<%

'#################################################################
'# 迅捷影视
'#################################################################

set rs=conn.execute("select count(*) as offnum from Feedback where online<>'1'")
if cint(rs("offnum"))>0 then tit="，共有 "&rs("offnum")&" 条未审核留言"
set rsoff=nothing

%>
<style type="text/css">
<!--
.STYLE1 {
	color: #FFFFFF;
	font-size: 12px;
}
.STYLE2 {color: #999999}
-->
</style>

<table width="760" border=0 cellspacing=0 cellpadding=0 bgcolor="#000000" align=center class="grayline">
<tr><td>　</td></tr>
<tr><td width=30 height=37 background="IMAGES/down.gif"><a href=#top><img src=images/up.gif border=0></a></td>
<td height=37 background="IMAGES/down.gif">&nbsp;<span class="STYLE1">&nbsp;<span class="STYLE2"><a href=http://www.xunje.com target=_blank>
迅捷影视</a></td>
<td width=30 height=37 background="IMAGES/down.gif"><a href=book_admin.asp title="管理留言本<%=tit%>"><img src=images/admin.gif border=0></a><br></td>
</tr>
</table>