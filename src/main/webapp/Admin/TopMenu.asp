<HTML>
<HEAD>
<TITLE>TopMenu</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<!--<base target='main'>-->
<SCRIPT language=JavaScript type=text/JavaScript>
		function initLocation(o)
		{
			if(o != null && o != "" && o != "undefind")
			{
				var re = new RegExp("===","ig");
				o = o.replace(re,"&");
				parent.main.location = o;
			}
		}
var XMLHttp = { _objPool: [],
	_getInstance: function ()
	{
		for (var i = 0; i < this._objPool.length; i ++) 
		{ 
			if (this._objPool[i].readyState == 0 || this._objPool[i].readyState == 4) 
			{ 
				return this._objPool[i]; 
			}
		} 
		this._objPool[this._objPool.length] = this._createObj(); 
		return this._objPool[this._objPool.length - 1]; 
	}, 
	 
	_createObj: function () 
	{ 
		if (window.XMLHttpRequest) 
		{ 
			var objXMLHttp = new XMLHttpRequest(); 
		} 
		else 
		{ 
			var MSXML = ["MSXML2.XMLHTTP.6.0", "MSXML2.XMLHTTP.4.0", "MSXML2.XMLHTTP.3.0", "MSXML2.XMLHTTP", "Microsoft.XMLHTTP"]; 
			for(var n = 0; n < MSXML.length; n ++) 
			{ 
				try 
				{ 
					var objXMLHttp = new ActiveXObject(MSXML[n]); //MSXML[n]
					break; 
				} 
				catch(e){ } 
			} 
		 }		   
		if (objXMLHttp.readyState == null) { 
			objXMLHttp.readyState = 0; 
	 
			objXMLHttp.addEventListener("load", function () { 
					objXMLHttp.readyState = 4; 
					if (typeof objXMLHttp.onreadystatechange == "function") { 
						objXMLHttp.onreadystatechange(); 
					} 
				},  false); 
		} 
		return objXMLHttp; 
	}, 
	sendReq: function (method, url, data, callback) 
	{ 
		var objXMLHttp = this._getInstance(); 
		with(objXMLHttp) { 
			try { 
				if (url.indexOf("?") != -1) { 
					url += "&randnum=" + Math.random(); 
				} 
				else { 
					url += "?randnum=" + Math.random(); 
				} 
				open(method, url, true); 
				setRequestHeader("Content-Type","text/xml");
				setRequestHeader("Content-Type","gb2312");
				send(); 
				onreadystatechange = function () { 
					if (objXMLHttp.readyState == 4 && (objXMLHttp.status == 200 || objXMLHttp.status == 304)) { 
						callback(objXMLHttp); 
					} 
				} 
			} 
			catch(e) { 
			} 
		} 
	} 
};
		function preloadImg(src) 
		{
			var img=new Image();
			img.src=src;
		}
		function setLocationOver(o){return;}
		function setMainLocation(win){
			var lo = win.location.toString();
			var lo1 = "";
			for(var i = 0;i < lo.length;i++)
			{
				var cha = lo.charAt(i);
				if(cha == "&")
					lo1 +="==="
				else
					lo1 += cha;
			}
			if(window.XMLHttp)XMLHttp.sendReq("GET","?op=13&lo=" + lo1,"",setLocationOver);
		}
		preloadImg('Images/open.gif');

		var displayBar=true;
		function switchBar(obj) 
		{
			if (displayBar) 
			{
				parent.frame.cols='0,*';
				displayBar=false;
				obj.src='TopMenu/open.gif';
				obj.title='打开左边管理导航菜单';
			} 
			else 
			{
				parent.frame.cols='200,*';
				displayBar=true;
				obj.src='TopMenu/close.gif';
				obj.title='关闭左边管理导航菜单';
			}
		}
		
		//退出后台管理
		function LoginOut()
		{
			if(document.all)
			{
				ht = parent.document.getElementsByTagName("html");
				ht[0].style.filter = "progid:dXImageTransform.Microsoft.BasicImage(grayscale=1)";
				if(!confirm('您确定要退出管理吗?'))
				{
					ht[0].style.filter = "";
					return false;
				}else
				{
					//session("adminName")="";
					parent.window.location="logout.asp";
					return true;
				}
			}
			return true;
		}
		</SCRIPT>
<link href="css/default.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY>
<TABLE class=C_Headerbg cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TR>
    <TD class=C_HeaderLeft width=12>&nbsp;</TD>
    <TD width=130><A href="http://www.tqtec.cn/" target=_blank><IMG 
      height=34 alt=天勤科技 src="TopMenu/JiSu_Admin_08.gif" width=130 
      border=0></A></TD>
    <TD vAlign=top align=right width=55><IMG src="TopMenu/close.gif" width="40" height="42" 
      style="CURSOR: hand" title=关闭左边管理导航菜单 onclick=switchBar(this)> 
    </TD>
    <TD align=right>&nbsp;</TD>
    <TD align=middle width=500><IFRAME id=Bbs style="DISPLAY: none" 
      src="TopMenu/Bbs.htm" frameBorder=0 width=297 scrolling=no 
      height=25></IFRAME></TD>
    <TD class=C_HeaderMiddle style="FONT-WEIGHT: bold" vAlign=top align=middle   width=200>
	<A id=ShopIndex href="/" target=_blank>网站首页</A> | 
	<a href="AdminInfo.asp" target="mainFrame">管理首页</a> | 
	<A id=LoginOut   onclick="if(!LoginOut()){return false;};"  href="#">退出</A>
	</TD>
    <TD class=C_HeaderRight width=12>&nbsp;</TD>
  </TR>
</TABLE>
</BODY>
</HTML>

