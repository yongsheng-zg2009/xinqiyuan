<%

'#################################################################
'# Ѹ��Ӱ��
'#################################################################

set rs=conn.execute("select count(*) as offnum from Feedback where online<>'1'")
if cint(rs("offnum"))>0 then tit="������ "&rs("offnum")&" ��δ�������"
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
<tr><td>��</td></tr>
<tr><td width=30 height=37 background="IMAGES/down.gif"><a href=#top><img src=images/up.gif border=0></a></td>
<td height=37 background="IMAGES/down.gif">&nbsp;<span class="STYLE1">&nbsp;<span class="STYLE2"><a href=http://www.xunje.com target=_blank>
Ѹ��Ӱ��</a></td>
<td width=30 height=37 background="IMAGES/down.gif"><a href=book_admin.asp title="�������Ա�<%=tit%>"><img src=images/admin.gif border=0></a><br></td>
</tr>
</table>