<%
Dim Sys_Level, Level_Name
Sys_Level = Session("Sys_Level")
If Sys_Level = 3 Then Level_Name = "ϵͳ����Ա"
If Sys_Level = 2 Then Level_Name = "��Ϣ���Ա"
If Sys_Level = 1 Then Level_Name = "��Ϣ�༭Ա"
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td bgcolor="#74ABE4" height="25"><font color="#FFFFFF">���� ��ӭ <font color="#00FFFF" face="Arial, Helvetica, sans-serif"><%=Session("Sys_Admin")%> (<%=Level_Name%>)</font> 
    ����������</font></td>
    <td bgcolor="#74ABE4" height="25">
      <div align="center"><a href="/" class="tt3" target="_parent">������ҳ</a></div>    </td>
  </tr>
</table>

