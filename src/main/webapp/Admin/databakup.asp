<% 
oldDB = server.mappath("MyDB/#9za0yb#$%@.mdb") '�������ݿ��ַ 
newDB = server.mappath("databakup/db_new.mdb") '������ʱ�ļ� 
Set FSO = Server.CreateObject("Scripting.FileSystemObject") 
Set Engine = Server.CreateObject("JRO.JetEngine") 
prov = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" 
Engine.CompactDatabase prov & OldDB, prov & newDB 
set Engine = nothing 
FSO.DeleteFile oldDB 'ɾ����ʱ�ļ� 
FSO.CopyFile newDB, oldDB 
set FSO = Nothing 
response.write "OK" 
%> 

