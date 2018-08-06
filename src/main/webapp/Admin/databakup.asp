<% 
oldDB = server.mappath("MyDB/#9za0yb#$%@.mdb") '更改数据库地址 
newDB = server.mappath("databakup/db_new.mdb") '生成临时文件 
Set FSO = Server.CreateObject("Scripting.FileSystemObject") 
Set Engine = Server.CreateObject("JRO.JetEngine") 
prov = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" 
Engine.CompactDatabase prov & OldDB, prov & newDB 
set Engine = nothing 
FSO.DeleteFile oldDB '删除临时文件 
FSO.CopyFile newDB, oldDB 
set FSO = Nothing 
response.write "OK" 
%> 

