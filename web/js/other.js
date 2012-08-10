// JavaScript Document
/* 
* 创建时间：2012.07.20
* 创建原因：页面部分jquery特效
*/

/* 焦点图切换 */
function switchImg(imgheight){
     var len = $(".adNum > li").length;
	 var index = 0;
	 var adTimer;
	 $(".adNum li").click(function(){
		index = $(".adNum li").index(this);
		showImg(index, imgheight);
	 }).eq(0).click();	
	 //滑入 停止动画，滑出开始动画.
	 $('.ad').hover(function(){
			 clearInterval(adTimer);
		 },function(){
			 adTimer = setInterval(function(){
			    showImg(index, imgheight)
				index ++;
				if(index == len){index = 0;}
			  } , 4000);
	 }).trigger("mouseleave");
}
function showImg(index, imgheight){
	var ht = "";
	if(imgheight){
		ht = imgheight;
	}
	else{
		ht = "235px";
	}
	var adHeight = $(".ad li").height();
	$(".adImg li").eq(index).addClass("adImg_cur").stop(true,false).animate({height: ht},600).siblings().removeClass("adImg_cur").animate({height: "0"},800);
	$(".adNum li").eq(index).addClass("adNum_cur").siblings().removeClass("adNum_cur");
}

/* 返回顶部 */
function backToTop(bottomHeight, leftWidth){
    var $backToTopCon = "<img src='http://www.jiandan100.cn/images/common/backtop.png' alt='返回顶部' />", 
		$backToTopEle = $('<div class="r_backtop"></div>').appendTo($("body"))
		.html($backToTopCon).click(function() {
			$("html, body").animate({scrollTop: 0}, 120);
	}), $backToTopFun = function() {
		var st = $(document).scrollTop(), 
		winh = $(window).height(),
		top = st + winh,
		maxHeight = $(document).height();
		limitTop = winh - 100;
		(st > 50)? $backToTopEle.show(): $backToTopEle.hide();
		if(top < maxHeight - bottomHeight){
			if (!window.XMLHttpRequest) { //IE6定位
				top = top - 100;
			}else{
				top = limitTop;
			}
		}else{
			if (!window.XMLHttpRequest) { //IE6定位
				top = top - 100 - (bottomHeight + top - maxHeight);
			}else{
				top = limitTop - (bottomHeight + top - maxHeight);
			}
		}
		$backToTopEle.css({"left": $('#container').offset().left + leftWidth, "top": top});
	};
	$(window).bind("scroll", $backToTopFun);
}

/*多余字符省略号显示，鼠标滑过弹出tooltip*/
function displayEllipsis(element, maxchars){
	var displayItem = $(element);
	displayItem.each(function(){
		var _this = this;
		var textCon = $(_this).html();
		if($(_this).text().length > maxchars){
			$(_this).text($(_this).text().substring(0, maxchars - 2));
			$(_this).html($(_this).html() + "…");
			$(_this).css({"cursor": "pointer", "display": "block"});
			var x = 10;  
			var y = 20;
			$(_this).mouseover(function(e){
				var tooltip = "<div id='tooltip'>"+ textCon +"</div>"; //创建 div 元素
				$("body").append(tooltip);
				$("#tooltip")
					.css({
						"top": (e.pageY+y) + "px",
						"left": (e.pageX+x) - 60  + "px"
					}).show("fast");
			}).mouseout(function(){
				$("#tooltip").remove(); 
			}).mousemove(function(e){
				$("#tooltip")
					.css({
						"top": (e.pageY+y) + "px",
						"left": (e.pageX+x) - 60  + "px"
					});
			});
		}
		else{
			$(_this).css({"display": "block"});
		}
	});
}

/*tab切换*/
function setTab(name, cursel, callback){
	var tagItem = $(".tabTag_" + name).children();
	var conItem = $(".tabCon_" + name).children();
	tagItem.each(function(i){
		if(i == cursel){
			tagItem.eq(i).addClass("curTag").siblings().removeClass("curTag");
			conItem.eq(i).show().siblings().hide();
		}
	})
	var imglazy = $(".tabCon_" + name).find("img").attr("original");
	if (imglazy) {
	    $("img[original]").lazyload({ placeholder: "http://www.jiandan100.cn/images/common/grey.gif" });
	}
    if(callback){
        callback(name, cursel);
	}
}
function hoverTab(tagItem){
	var tag = $(tagItem).children();
	tag.hover(function(){
		var _this = this;
		$(_this).addClass("tagHover");
	},function(){
		var _this = this;
		$(_this).removeClass("tagHover");
	})
}

/*下拉菜单*/
function slideMenus(tagObj, slideObj){
	var mouseout_tid = "";
	var mouseover_tid = "";
	$(tagObj).hover(function(){
		var _self = this;
		clearTimeout(mouseout_tid);
		mouseover_tid = setTimeout(function(){
			$(_self).addClass("open");
			$(_self).find(slideObj).show();
			$(_self).siblings().removeClass("open").find(slideObj).hide();
		},200);
	},function(){
		var _self = this;
		mouseout_tid = setTimeout(function(){
			$(_self).removeClass("open");
			$(_self).find(slideObj).hide();
		},100);
		clearTimeout(mouseover_tid);
	});
}
function slideContent(tagItem){
	var $tagObj = $(tagItem);
	var mouseover_tid = "";
	$tagObj.each(function(i){
		var _self = this;
		$(_self).mouseover(function(){
			clearTimeout(mouseover_tid);
			mouseover_tid = setTimeout(function(){
				$(_self).addClass("open");
				$(_self).siblings().removeClass("open");
			},200)
		})
	})
}