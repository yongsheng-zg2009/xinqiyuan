function tick() { 
var hours, minutes, seconds, xfile; 
var intHours, intMinutes, intSeconds; 
var today, theday; 
today = new Date(); 
function initArray(){ 
this.length=initArray.arguments.length 
for(var i=0;i<this.length;i++) 
this[i+1]=initArray.arguments[i] } 
var d=new initArray( 
"������", 
"����һ", 
"���ڶ�", 
"������", 
"������", 
"������", 
"������"); 
theday = today.getYear()+"��" + [today.getMonth()+1]+"��" +today.getDate() +"�� "+ d[today.getDay()+1]+" "; 
intHours = today.getHours(); 
intMinutes = today.getMinutes(); 
intSeconds = today.getSeconds(); 
if (intHours == 0) { 
hours = "12:"; 
xfile = "��ҹ"; 
} else if (intHours < 12) { 
hours = intHours+":"; 
xfile = "����"; 
} else if (intHours == 12) { 
hours = "12:"; 
xfile = "����"; 
} else { 
intHours = intHours - 12 
hours = intHours + ":"; 
xfile = "����"; 
} 
if (intMinutes < 10) { 
minutes = "0"+intMinutes+":"; 
} else { 
minutes = intMinutes+":"; 
} 
if (intSeconds < 10) { 
seconds = "0"+intSeconds+" "; 
} else { 
seconds = intSeconds+" "; 
} 
timeString = theday+xfile+hours+minutes+seconds; 
Clock.innerHTML = timeString; 
window.setTimeout("tick();", 100); 
} 
window.onload = tick; 