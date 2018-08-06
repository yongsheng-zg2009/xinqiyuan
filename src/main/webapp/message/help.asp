<!--#include file="inc_common.asp"-->
<%
'**************************************
'**		help.asp
'**
'** 文件说明：帮助页面
'** 修改日期：2006-04-30
'** 作者：Howlion
'** Email：howlion@163.com
'**************************************

pagename="留言帮助"
call bodySkin()
sub pageContent()
	helpContent()
end sub

function helpContent()
%>
        <div id="helpContent">
        <b>UBB使用帮助：（以下效果均可用按钮实现）</b><br /><br />
		<ul>
			<li>[b]文字[/b]：在文字的位置可以任意加入您需要的字符，显示为粗体效果。</li>
			<li>[i]文字[/i]：在文字的位置可以任意加入您需要的字符，显示为斜体效果。</li>
			<li>[u]文字[/u]：在文字的位置可以任意加入您需要的字符，显示为下划线效果。</li>
			<li>[center]文字[/center]：可以使文字居中显示。</li>
			<li>[url]http://www.sohu.com[/url]</li>	<li>[url=http://www.sohu.com]搜狐[/url]：有两种方法可以加入超级连接，可以连接具体地址或者文字连接。</li>
			<li>[email]howlion@163.com[/email]</li>	<li>[email=mailto:howlion@163.com]Howlion[/email]：有两种方法可以加入邮件连接，可以连接具体地址或者文字连接。</li>	<li>[glow=255,red,2]文字[/glow]：在标签的中间插入文字可以实现文字发光特效，glow内属性依次为宽度、颜色和边界大小。</li>	<li>[shadow=255,red,2]文字[/shadow]：在标签的中间插入文字可以实现文字阴影特效，shadow内属性依次为宽度、颜色和边界大小。</li>
			<li>[size=数字]文字[/size]：输入您的字体大小，在标签的中间插入文字可以实现文字大小改变。</li>
			<li>[face=字体]文字[/face]：输入您需要的字体，在标签的中间插入文字可以实现文字字体转换。</li>
		</ul>
        </div>
<%
end function
%>