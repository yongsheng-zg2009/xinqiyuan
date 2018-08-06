<!--#include file="Dir.inc.asp"-->
<HTML>
<HEAD>
<TITLE>LeftMenu</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2900.2963" name=GENERATOR>
<META content=C# name=CODE_LANGUAGE>
<META content=JavaScript name=vs_defaultClientScript>
<META content=http://schemas.microsoft.com/intellisense/ie5 name=vs_targetSchema>
<link href="css/default.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY>
<SCRIPT>
function showMenu(obj){
//alert()
	var ob = event.srcElement;
	if(ob.tagName == "TD")
	{
		ob = ob.parentNode.childNodes[1].childNodes[0]
	}
	if(ob.tagName == "A")
	{
		ob = ob.parentNode.parentNode.childNodes[1].childNodes[0]
	}
	if(obj.style.display =="")
	{
		obj.style.display = "none"
		ob.src ="LeftMenu/up.gif"
	}
	else
	{
		obj.style.display = ""
		ob.src = "LeftMenu/down.gif"
	}
}
		</SCRIPT>
 <TABLE cellSpacing=0 cellPadding=0 width=178 border=0>
  <TR>
    <TD class=C_Left_03 vAlign=top width=8><IMG height=7 
      src="LeftMenu/JiSu_Admin_22.gif" width=8></TD>
    <TD class=C_Left_01>　</TD>
    <TD class=C_Left_04 vAlign=top width=8><IMG height=7 src="LeftMenu/JiSu_Admin_25.gif" width=8></TD></TR>
  <TR>
    <TD class=C_Left_03>　</TD>
    <TD vAlign=top><% call showMenu() %>
	  <TABLE class=Left_Item01 cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TR onclick=showMenu(am,this)>
          <TD class=Left_Item01_Title style="CURSOR: hand">数据管理</TD>
          <TD style="CURSOR: hand"><IMG alt=显示/隐藏子菜单  src="LeftMenu/down.gif"></TD>
		</TR>
	  </TABLE>
      <TABLE class=Left_boder id=am cellSpacing=0 cellPadding=0 width="100%"    border=0>
        <TR>
          <TD class=Left_Item02> <a href="http://www.tqtec.cn/count/index.asp?siteid=12" target="mainFrame">流量统计</a> | <a href="/admin/News/Admin/UploadFile.asp" target="mainFrame">文件管理</a></TD>
        </TR>
        </TBODY></TABLE>
      <TABLE class=Left_Item01 cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD class=Left_Item01_Title>版权信息</TD>
          <TD><IMG src="LeftMenu/down.gif"></TD></TR></TBODY></TABLE>
      <TABLE class=Left_boder cellSpacing=0 cellPadding=0 width="100%" 
        border=0><TBODY>
        <TR>
          <TD class=Left_Item02 
          id=version>天勤科技网站管理系统3.0<BR>
            版权所有：天勤科技</TD>
        </TR></TBODY></TABLE></TD>
    <TD class=C_Left_04>　</TD></TR>
  <TR>
    <TD class=C_Left_03 vAlign=bottom width=8><IMG height=8 
      src="LeftMenu/JiSu_Admin_48.gif" width=8></TD>
    <TD class=C_Left_02>　</TD>
    <TD class=C_Left_04 vAlign=bottom width=8><IMG height=8 
      src="LeftMenu/JiSu_Admin_51.gif" width=8></TD></TR></TBODY></TABLE>
<SCRIPT>
	var table = document.getElementById("../LeftMenu");
	if(table != null)
	{
		for(var i=0;i < table.rows.length;i++)
		{
			table.rows[i].onclick = function(){
				var e = event.srcElement;
				e = e.parentNode.parentNode;
				for(var i=0;i<table.rows.length;i++)
				{
					table.rows[i].className = "C_Left_Menu_default";
				}
				e.className = "C_Left_Menu_current";
			}
		}
	}
		</SCRIPT>
</BODY></HTML>

