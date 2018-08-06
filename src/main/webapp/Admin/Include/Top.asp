<%
Dim Sys_Level, Level_Name
Sys_Level = Session("Sys_Level")
If Sys_Level = 3 Then Level_Name = "系统管理员"
If Sys_Level = 2 Then Level_Name = "信息审核员"
If Sys_Level = 1 Then Level_Name = "信息编辑员"
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td bgcolor="#74ABE4" height="25"><font color="#FFFFFF">→ 欢迎 <font color="#00FFFF" face="Arial, Helvetica, sans-serif"><%=Session("Sys_Admin")%> (<%=Level_Name%>)</font> 
    进入控制面板</font></td>
    <td bgcolor="#74ABE4" height="25">
      <div align="center"><a href="/" class="tt3" target="_parent">返回首页</a></div>    </td>
  </tr>
</table>

