<?php
$db_server="localhost"; 
$db_user_name="pursuer"; 
$db_user_password="acpmpursuer"; 
$db_name="pursuer"; 
$conn=@mysql_connect($db_server,$db_user_name,$db_user_password) or die("连接数据库出错，请看用户名或密码");
mysql_select_db($db_name,$conn);
mysql_query('set names"gbk"');

$nametitle="鄂州市文星通网络工程有限责任公司";
$url="http://www.wxtwl.net";
$mail="admin@wxtwl.net";
$tel="0711-3211376";
$keywords="test";
$description="test";
