//---------------------主要部分------------------------------
		//activeObj:触发时间的元素id
		//contObj:要显示内容的id
		//clearObj:清除显示层的id
		//newDivWidth:显示层的宽度
		//newDivHeight:显示层的高度
var popContentHTML = "";
var contentObj = undefined;
var isie6 = window.XMLHttpRequest?false:true;
function openPopWindow(activeObj,contObj,clearObj,newDivWidth,newDivHeight,callback){
	var oletter=document.getElementById(activeObj);
	var lettercont=document.getElementById(contObj);
	var oclearbox=document.getElementById(clearObj);	
	oletter.onclick=function(){
			//_hiddenSelect();
			box_createDiv(lettercont,newDivWidth,newDivHeight);
			if(callback)
				callback();
		}
}
function openPopWindowEx(activeObj,contObj,clearObj,newDivWidth,newDivHeight,callback){
	var oletter=document.getElementById(activeObj);
	var lettercont=document.getElementById(contObj);
	var oclearbox=document.getElementById(clearObj);	
	box_createDiv(lettercont,newDivWidth,newDivHeight);
	if(callback)
		callback();
	
}

function popwindow_show(contentItemId, popupWidth, popupHeight,contentHTML,callback) {
	var item = document.getElementById(contentItemId);
	//_hiddenSelect();
	box_createDiv(item, popupWidth, popupHeight,contentHTML);
    if(callback)
        callback();
}

function owinWidth(){//当前窗口的width
		var winWidth;
		if (window.innerWidth){
   			winWidth = window.innerWidth;
		}
   		else if ((document.body) && (document.body.clientWidth)){
   			winWidth = document.body.clientWidth;
		}
   		if (document.documentElement  && document.documentElement.clientWidth){
   			winWidth = document.documentElement.clientWidth;
		}
		return winWidth;
}
function owinHeight(){//当前窗口的height
		var winHeight;
		if (window.innerHeight){
   			winHeight = window.innerHeight
		}else if ((document.body) && (document.body.clientHeight)){
   			winHeight = document.body.clientHeight
		}
		if (document.documentElement  && document.documentElement.clientHeight){
   			winHeight = document.documentElement.clientHeight;
		}
		return winHeight;	
}
function box_createDiv(pinner,newDivWidth,newDivHeight, contentHTML){//创建背景
	var obody=document.body;
	document.documentElement.style.overflowY="auto";
	document.documentElement.style.overflowX="hidden";
	var newDiv=document.createElement("div");
	newDiv.id="bgdiv";
	newDiv.style.width = "100%";
	newDiv.style.zIndex = 1100;
	newDiv.innerHTML = "<iframe class=\"divshim\"></iframe>";
	var winWidth=owinWidth();
	var winHeight=owinHeight();
	if(obody.offsetHeight>winHeight){
		newDiv.style.height=obody.offsetHeight+"px";
	}else{
		newDiv.style.height=winHeight+'px';
	}
	newDiv.style.background="#000";
	newDiv.style.position="absolute";
	if(typeof(newDiv.style.filter)=="string"){
		newDiv.style.filter="alpha(opacity=30)";
	}else{
		newDiv.style.opacity="0.3";
	}
	newDiv.style.top=0;
	newDiv.style.left=0;
	//var newP=city_createP(winWidth,winHeight,newDivWidth,newDivHeight);
	var newP=city_createP(winWidth,winHeight,0,0);
	if(pinner){
	newP.innerHTML=pinner.innerHTML;
	popContentHTML = pinner.innerHTML;
	pinner.innerHTML = "";
	contentObj = pinner;
	}
        else newP.innerHTML = contentHTML;
	obody.appendChild(newDiv);
	obody.appendChild(newP);
	_show(newP, winWidth, winHeight, 0, 0, newDivWidth, newDivHeight, 50, 40, 1);
}
function _show(item, winWidth, winHeight, width, height, maxWidth, maxHeight, stepWidth, stepHeight, timeout) {
	if (width >= maxWidth) {
		width = maxWidth;
	}
	if (height >= maxHeight) {
		height = maxHeight;
	}

	item.style.marginTop = - item.offsetHeight / 2 + "px";
	item.style.marginLeft = - item.offsetWidth / 2 + "px";

	item.style.width = width + "px";

	item.style.height = height + "px";
	
	if (width == maxWidth && height == maxHeight) {
		return;
	}
	_show(item, winWidth, winHeight, width + stepWidth, height + stepHeight, maxWidth, maxHeight, stepWidth, stepHeight, timeout);
}
function city_createP(winWidth,winHeight,newDivWidth,newDivHeight){//创建显示层
	var obody=document.body;
	var newP=document.createElement("div");
	newP.id="contdiv";
	newP.className="pop_new_p";
	newP.style.width=newDivWidth+"px";
	newP.style.height=newDivHeight+"px";
	newP.style.zIndex = 1101;
	//newP.style.background="#fff";
	if(isie6){
		newP.style.top = (winHeight - newDivHeight) / 2 + document.documentElement.scrollTop + document.body.scrollTop + "px";
	}else{
		newP.style.top= "50%";
	}
	newP.style.left= "50%"
	return newP;
}
function box_clearDiv(){//清除生成背景和容器层
	var bgd=document.getElementById("bgdiv");
	var contd=document.getElementById("contdiv");
    if(contd)
        document.body.removeChild(contd);
    if(bgd)
        document.body.removeChild(bgd);
	document.documentElement.style.overflowY="auto";
	//showselect();
    if(contentObj)
        contentObj.innerHTML = popContentHTML;
}
function popwindow_close(callbackFn){
    box_clearDiv();
    if(callbackFn)
        callbackFn();
}