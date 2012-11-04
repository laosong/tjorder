<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<s:portlet var="u" url="/pl/curr-user.htm" param=""/>
<s:portlet var="c" url="/pl/comments-obj.htm" param="id=${id}"/>
<s:portlet var="goodsObj" url="/pl/goods-obj.htm" param="id=${c.obj.owner_id}"/>
<s:portlet var="upfilePl" url="/pl/upfile-map.htm" param="ownerId=${goodsObj.goods.id}"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="买茅台酒、劲酒、汾酒、国酒等各种白酒，上天酒商城." />
    <meta name="description" content="茅台酒,劲酒,汾酒,国酒,五粮液,高端白酒,天酒商城" />
    <title>我的评论_天酒商城</title>
    <link href="/css/base.css" rel="stylesheet" type="text/css"/>
    <link href="/css/common.css"	rel="stylesheet" type="text/css"/>
    <link href="/css/main.css" rel="stylesheet" type="text/css"/>
    <link href="/css/personal.css" rel="stylesheet" type="text/css"/>
    <link href="/plugin/buk/buk.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/other.js"></script>
    <script type="text/javascript" language="javascript" src="/plugin/buk/pager.js"></script>
    <script type="text/javascript">
        function addfavorite()
        {
            if (document.all)
            {
                window.external.addFavorite('http://www.36519.cn/','高端白酒_天酒商城');
            }
            else if (window.sidebar)
            {
                window.sidebar.addPanel('高端白酒_天酒商城', 'http://www.36519.cn/', "");
            }
        }
    </script>
</head>
<body>
<c:import url="../topbar.jsp" charEncoding="utf-8"/>
<div id="container">
    <c:import url="../header.jsp" charEncoding="utf-8"/>
    <div id="content" class="clearfix mart10">
        <div class="personal_con m790 right">
            <h3 class="con_til">发表评价</h3>
            <div class="pCmt_del tablestyle mart10">
                <div class="pCmt_p clearfix">
                    <div class="pCmt_p_img left"><a href="/home/product/${goodsObj.obj.id}" target="_blank" title="${goodsObj.goods.degree}° ${goodsObj.goods.title}${goodsObj.goods.volume}ml"><img src="${upfilePl.map['l-default'].path}" alt="${goodsObj.goods.degree}° ${goodsObj.goods.title}${goodsObj.goods.volume}ml" /></a></div>
                    <ul class="pCmt_p_intro left">
                        <li>商品名称：<a href="">${goodsObj.goods.degree}° ${goodsObj.goods.title}${goodsObj.goods.volume}ml</a></li>
                        <li>天酒价：<span class="fred fb"><tags:price price="${goodsObj.goods.price}"/></span></li>
                        <li>平均得分：
                            <c:if test="${goodsObj.goods.comment_num>0}"><span class="fred fb"><fmt:formatNumber value="${goodsObj.goods.rank/goodsObj.goods.comment_num}" pattern="#.0"/></span></c:if>
                            <c:if test="${goodsObj.goods.comment_num<=0}"><span class="fred fb"> 暂无</span></c:if>
                        </li>
                        <li>评论数：<span>${goodsObj.goods.comment_num}条</span></li>
                    </ul>
                </div>
                <div class="pCmt_txt mart20">
                    <p>欢迎您发表原创、与商品质量相关、对其它用户有参考价值的商品评价；</p>
                    <p class="mart5">如果您发表的评价内容与商品本身的质量无关，评价将被删除；</p>
                </div>
                <div class="pCmt_form mart20">
                    <div class="pCmt_area">
                        <label  class="f14px fb"><span>*</span>您的评分：</label>
                        <ul class="pCmt_stars mart10 clearfix">
                            <li><div class="btn cmt_stars stars_${c.obj.score}">5星</div>(${c.obj.score}分)</li>
                        </ul>
                    </div>
                    <div class="pCmt_area mart20">
                        <label for="comment" class="f14px fb"><span>*</span>评语：</label>
                        <textarea rows="6" id="comment" class="pCmt_textarea mart5"  style="background: none;border: none;" disabled="disabled">${c.obj.msg}</textarea>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="./menu.jsp?p=comments" charEncoding="utf-8"/>
    </div><!-- end content -->
    <c:import url="../footer.jsp" charEncoding="utf-8"/>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        //移动鼠标显示产品大图
        $(".jqzoom").jqueryzoom({
            xzoom: 350, //放大图的宽度(默认是 200)
            yzoom: 350, //放大图的高度(默认是 200)
            offset: 10, //离原图的距离(默认是 10)
            position: "right", //放大图的定位(默认是 "right")
            preload:1
        });
        //切换产品图
        $(".pro_del_l ul li img").hover(function(){
            var imgMid = $(this).attr("src-mid");
            var imgBig = $(this).attr("src-big");
            $("#bigImg").attr({"src": imgMid ,"jqimg": imgBig });
            $(this).parent().addClass("curImg").siblings().removeClass("curImg");
        },function(){
            $(this).parent().removeClass("curImg");
        });
    })
</script>
</body>
</html>