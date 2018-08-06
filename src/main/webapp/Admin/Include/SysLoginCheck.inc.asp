<%
'////
Dim usid
usid=Request("usid")
If usid="guest" Then
	Session("Sys_Admin") = "guest"
	Session("Sys_Level") = "1"
	Session("A_Columns") = "A, A0046, A00460001, A00460002, A00460003, A00460004"
	session("adminLogin") = true
	session("adminName") = "admin"
End if
'//
Function CheckPermission()
	If Session("Sys_Admin")<>"" then 
		checkPermission=True
	Else
		checkPermission=FALSE
	End if
End Function

Dim Tmpadmin
Tmpadmin = CheckPermission()
If Tmpadmin <> TRUE then
	response.redirect "/Admin/Login.asp?Position=2"
End If
'http://localhost/admin/News/Admin/NewsAdd.asp?usid=guest
%>
