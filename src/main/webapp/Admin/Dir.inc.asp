<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%
'//Ԥ����
dim menu(3,5),j,tmpmenu,menuname,menurl, H_level
H_Level = Session("Sys_Level")
menu(0,0)="��Ϣ����"
menu(0,1)="<a href=/admin/News/Admin/NewsAdd.asp?cataid=A0001 target=mainFrame>������Ϣ</a> | <a href=/admin/News/Admin/NewsList.asp target=mainFrame>��Ϣ����</a>"
menu(0,2)="<a href=/admin/News/Admin/NewsList.asp target=mainFrame>��Ϣ���</a> <!-- | <a href=/ts/adsearch.asp target=mainFrame>�������</a> -->"

menu(1,0)="��Ŀ����"
menu(1,1)="<a href=/admin/News/Admin/NewsCataAdd.asp target=mainFrame>��Ŀ����</a> | <a href=/admin/News/Admin/NewsCataFix.asp target=mainFrame>��Ŀ�ϲ�</a>"

menu(2,0)="��������"
menu(2,1)="<a href=/message/index.asp target=mainFrame>�鿴����</a> | <a href=/message/login.asp target=mainFrame>��������</a>"
menu(2,2)="<a href=/message/admin.asp?act=main target=mainFrame>��������</a> "



menu(3,0)="ϵͳ����"
If H_Level = 3 Then
menu(3,1)="<a href=/admin/News/Admin/LinkAdd.asp target=mainFrame>�������</a> | <a href=/admin/News/Admin/LinkList.asp target=mainFrame>���ӹ���</a>"
menu(3,2)="<a href=/admin/SysSet.asp target=mainFrame>ϵͳ����</a> | <a href=/admin/SysUser.asp target=mainFrame>�ʺŹ���</a>"
menu(3,3)="<a href=/admin/ModifyPasswd.asp target=mainFrame>�޸�����</a>"
Else
menu(3,1)="<a href=/admin/ModifyPasswd.asp target=mainFrame>�޸�����</a>"
End If

sub showMenu()
    dim menuStr
    for i=0 to ubound(menu,1)
        menuStr = "<TABLE class=Left_Item01 cellSpacing=0 cellPadding=0 width=""100%"" border=0>"&_
                  "<TR onclick=showMenu(a"&i&",this)>"&_
                  "<TD class=Left_Item01_Title style=""CURSOR: hand"">"&menu(i,0)&"</TD>"&_
				  "<TD style=""CURSOR: hand""><IMG alt=��ʾ/�����Ӳ˵�  src=""LeftMenu/down.gif""></TD>"&_
                  "</TR></TABLE>"&_
                  "<TABLE class=Left_boder id=a"&i&" cellSpacing=0 cellPadding=0 width=""100%""  border=0>" 
				  for j=1 to ubound(menu,2)
				  if isempty(menu(i,j)) then exit for
				  menuStr = menuStr&"<tr><td class=Left_Item02>"&menu(i,j)&"</td></tr>"
				  next
				  menuStr = menuStr&"</table>"
	    Response.Write menuStr
    next
end sub
%>
