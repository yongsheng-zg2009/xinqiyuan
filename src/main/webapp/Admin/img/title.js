<!--
document.body.onmousemove=quickalt;
document.body.onmouseover=getalt;
document.body.onmouseout=restorealt;
var tempalt='';
function getalt(){
if(event.srcElement.title && (event.srcElement.title!='' || (event.srcElement.title=='' && tempalt!=''))){
altlayer.style.left=window.event.clientX;
altlayer.style.top=window.event.clientY;
altlayer.style.display='';
tempalt=event.srcElement.title;
tempbg=event.srcElement.altbg;
tempcolor=event.srcElement.altcolor;
tempborder=event.srcElement.altborder;
event.srcElement.title='';
altlayer.innerHTML=tempalt;
if (typeof(tempbg)!="undefined"){altlayer.style.background=tempbg}else{altlayer.style.background="white"}
if (typeof(tempcolor)!="undefined"){altlayer.style.color=tempcolor}else{altlayer.style.color=tempcolor="black"}
if (typeof(tempborder)!="undefined"){altlayer.style.border='1px solid '+tempborder;}else{altlayer.style.border='1px solid #000000';}
}
}
function quickalt(){
if(altlayer.style.display==''){
altlayer.style.left=window.event.clientX;
altlayer.style.top=window.event.clientY;
}
}
function restorealt(){
event.srcElement.title=tempalt;
tempalt='';
altlayer.style.display='none';
}
//-->