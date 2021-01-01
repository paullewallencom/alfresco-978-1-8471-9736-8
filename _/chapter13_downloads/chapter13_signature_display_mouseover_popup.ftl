<script>

var ua = navigator.userAgent.toLowerCase();
var divw=0;
var divh=0;

if (document.getElementById || document.all)
	document.write('<div id="imgtrailer" style="position:absolute;visibility:hidden;"></div>')

function gettrailobject()
	{
	if (document.getElementById)
		return document.getElementById("imgtrailer")
	else if (document.all)
		return document.all.trailimagid
	}

function gettrailobj()
	{
	if (document.getElementById)
		return document.getElementById("imgtrailer").style
	else if (document.all)
		return document.all.trailimagid.style
	}

function truebody()
	{
	return (!window.opera && document.compatMode && document.compatMode!="BackCompat")?document.documentElement : document.body
	}

function trailOff()
	{
	document.onmousemove='';
	gettrailobj().visibility="hidden";
	}

function trailOn(thumbimg,imgtitle,ownername,size,created,thw,thh)
	{

//alert('Width = ' + thw + ' , Height= ' + thh);

	if(ua.indexOf('opera') == -1 && ua.indexOf('safari') == -1)
		{
		gettrailobj().left="-500px";
		divthw = parseInt(thw) + 2;
                sizekb = (parseInt(size) / 1,024);
		gettrailobject().innerHTML = '<div style="background-color: #b2a99d; layer-background-color: #b2a99d; border: 1px none #808080; padding:10px; width:'+divthw+'px;"><div style="background-color: #FFFFFF; layer-background-color: #FFFFFF; border: 1px solid #808080;background-image: url(img/lloading.gif);"><img name="currentImage" src="'+thumbimg+'" border="0"><div style="padding:3px"></div></div><div class=h2 style="padding:1px;">Name: '+imgtitle+'<br/>Owner:'+ownername+'<br/>Size: '+sizekb+' kb<br/>Created: '+created+'</div>';
		gettrailobj().visibility="visible";

		divw = parseInt(thw)+25;
		divh = parseInt(thh)+130;
		document.onmousemove=followmouse;

//redisplay now we now the widths, need to do this so we wrap property when we are against a right edge
if (typeof thw == "undefined") {
//alert('thw is undefined');
   thw = document.images["currentImage"].width;
   thh = document.images["currentImage"].height;
   //alert('Width = ' + thw + ' , Height= ' + thh);
   trailOn(thumbimg,imgtitle,ownername,size,created,thw,thh)

}

		}
	}

function followmouse(e)
	{
	var docwidth=document.all? truebody().scrollLeft+truebody().clientWidth : pageXOffset+window.innerWidth-15
	var docheight=document.all? Math.min(truebody().scrollHeight, truebody().clientHeight) : Math.min(document.body.offsetHeight, window.innerHeight)
if(typeof e != "undefined")
	{
	if(docwidth < 15+e.pageX+divw)
		xcoord = e.pageX-divw-5;
	else
		xcoord = 15+e.pageX;
	if(docheight < 15+e.pageY+divh)
		ycoord = 15+e.pageY-Math.max(0,(divh + e.pageY - docheight - truebody().scrollTop - 30));
	else
		ycoord = 15+e.pageY;
	}
else if (typeof window.event != "undefined")
	{
	if(docwidth < 15+truebody().scrollLeft+event.clientX+divw)
		xcoord = truebody().scrollLeft-5+event.clientX-divw;
	else
		xcoord = truebody().scrollLeft+15+event.clientX;

	if(docheight < 15+truebody().scrollTop+event.clientY+divh)
		ycoord = 15+truebody().scrollTop+event.clientY-Math.max(0,(divh + event.clientY - docheight - 30));
	else
		ycoord = truebody().scrollTop+15+event.clientY;
	}
	gettrailobj().left=xcoord+"px"
	gettrailobj().top=ycoord+"px"
	}



// The following script is used to open a window containing a signature image that automatically resizes to
// window to the same size as the image. 

// Set the horizontal and vertical position for the image popup
PositionX = 500;
PositionY = 200;

// Set these value approximately 20 pixels greater than the
// size of the largest image to be used (needed for Netscape)
defaultWidth  = 400;
defaultHeight = 200;

// Set autoclose true to have the window close automatically
// Set autoclose false to allow multiple popup windows
var AutoClose = true;

// ================================
if (parseInt(navigator.appVersion.charAt(0))>=4){
var isNN=(navigator.appName=="Netscape")?1:0;
var isIE=(navigator.appName.indexOf("Microsoft")!=-1)?1:0;}
var optNN='scrollbars=no,width='+defaultWidth+',height='+defaultHeight+',left='+PositionX+',top='+PositionY;
var optIE='scrollbars=no,width=150,height=100,left='+PositionX+',top='+PositionY;

function popImage(imageURL,imageTitle){
if (isNN){imgWin=window.open('about:blank','',optNN);}
if (isIE){imgWin=window.open('about:blank','',optIE);}
with (imgWin.document){
writeln('<html><head><title>Loading...</title><style>body{margin:0px;}</style>');writeln('<sc'+'ript>');
writeln('var isNN,isIE;');writeln('if (parseInt(navigator.appVersion.charAt(0))>=4){');
writeln('isNN=(navigator.appName=="Netscape")?1:0;');writeln('isIE=(navigator.appName.indexOf("Microsoft")!=-1)?1:0;}');
writeln('function reSizeToImage(){');writeln('if (isIE){');writeln('window.resizeTo(100,100);');
writeln('width=100-(document.body.clientWidth-document.images[0].width);');
writeln('height=100-(document.body.clientHeight-document.images[0].height);');
writeln('window.resizeTo(width,height);}');writeln('if (isNN){');       
writeln('window.innerWidth=document.images["George"].width;');writeln('window.innerHeight=document.images["George"].height;}}');
writeln('function doTitle(){document.title="'+imageTitle+'";}');writeln('</sc'+'ript>');
if (!AutoClose) writeln('</head><body bgcolor=000000 scroll="no" onload="reSizeToImage();doTitle();self.focus()">')
else writeln('</head><body bgcolor=000000 scroll="no" onload="reSizeToImage();doTitle();self.focus()" onblur="self.close()">');
writeln('<img name="George" src='+imageURL+' style="display:block"></body></html>');
close();		
}}

</script>

<#assign colcount=0> <#-- count the no. of image columns -->

<table width="100%" cols="3">
<#list space.children as child>

  <#if child.isDocument && child.mimetype = "image/gif">
    <#if colcount % 3 = 0><tr></#if>
    <td align="left">

<div style='padding:8px'><a href="javascript:popImage('/alfresco${child.url}','${child.properties.name}');"><img border="1" width="200" height="75" src="/alfresco${child.url}" alt='${child.properties.name}'   onmouseover="trailOn('/alfresco${child.url}','${child.properties.name}','${child.properties.creator}','${child.size}','${child.properties.created?date}');" onmouseout="trailOff();"></a></div>




<div>Name: ${child.properties.name}</div>
<div>Created: ${child.properties.created?date}</div>

</td>
    
<#if colcount % 3 = 2></tr></#if>
<#assign colcount=colcount+1>

  </#if>

</#list>

</table>
