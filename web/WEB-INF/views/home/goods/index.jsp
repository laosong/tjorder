<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<s:portlet url="/pl/news-list.htm" var="news" param="state=2&pageItemNum=7&pageNo=1"/>
<s:portlet url="/pl/goods-list.htm" var="special" param="state=2&flag_special=0&orderbyIndex=3"/>
<s:portlet url="/pl/goods-list.htm" var="new" param="state=2&flag_new=0&orderbyIndex=2"/>
<s:portlet url="/pl/goods-list.htm" var="recommend" param="state=2&flag_recommend=0&orderbyIndex=4"/>
<s:portlet url="/pl/goods-list.htm" var="hot" param="state=2&flag_hot=0&orderbyIndex=1"/>
<s:portlet url="/pl/goods-list.htm" var="price0" param="state=2&types=2&orderbyIndex=10&pageItemNum=2"/>
<s:portlet url="/pl/category.htm" var="root" param="id=0"/>
<s:portlet url="/pl/brand-list.htm" var="brand" param="orderbyIndex=1"/>
<s:portlet url="/pl/ad-list.htm" var="ad-search" param="area_cd=search"/>
<s:portlet url="/pl/ad-list.htm" var="slider" param="area_cd=slider"/>
<s:portlet url="/pl/ad-list.htm" var="btn1" param="pos_cd=index-btn-1"/>
<s:portlet url="/pl/ad-list.htm" var="btn2" param="pos_cd=index-btn-2"/>
<s:portlet url="/pl/ad-list.htm" var="btn3" param="pos_cd=index-btn-3"/>
<s:portlet url="/pl/ad-list.htm" var="side1" param="pos_cd=index-side-1"/>
<s:portlet url="/pl/ad-list.htm" var="side2" param="pos_cd=index-side-2"/>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="网上购物,网上商城，茅台天酒商场" />
    <meta name="description" content="天酒36519.COM-专业的茅台美酒网上购物商城，在线销售茅台、久丰、国台等多个品牌百万种优质商品。便捷、诚信、安全的服务，为您提供愉悦的网上商城购物体验!" />
    <title>天酒商场—购茅台美酒，上天酒商城！</title>
    <link href="/css/base.css" rel="stylesheet" type="text/css"/>
    <link href="/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="/css/main.css" rel="stylesheet" type="text/css"/>
    <link href="/css/product.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/other.js"></script>
    <script type="text/javascript">
        function addfavorite()
        {
            if (document.all)
            {
                window.external.addFavorite('http://www.36519.com/','高端白酒_天酒商城');
            }
            else if (window.sidebar)
            {
                window.sidebar.addPanel('高端白酒_天酒商城', 'http://www.36519.com/', "");
            }
        }
    </script></head>
<body>
<c:import url="../topbar.jsp" charEncoding="utf-8"/>
<div id="container">
<c:import url="../header.jsp?p=index" charEncoding="utf-8"/>
<div class="mainAd mart10 clearfix">
    <div class="adWrap left">
        <div class="ad">
            <ul class="adImg">
                <c:forEach var="obj" items="${slider.list}" varStatus="status">
                    <s:portlet var="upfilePl" url="/pl/upfile-list.htm" param="ownerId=${obj.id}&ownerType=4"/>
                    <li <c:if test="${status.index==0}">class="adImg_cur"</c:if> >
                        <a href="${obj.href}" target="_blank"><img src="${upfilePl.list[0].path}" width="550" height="235" alt="${obj.title}" /></a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <ul class="adNum clearfix">
            <c:forEach var="obj" items="${slider.list}" varStatus="status">
                <li <c:if test="${status.index==0}">class="adNum_cur"</c:if> >${status.count}</li>
            </c:forEach>
        </ul>
    </div>
    <div class="notice sbar230 right">
        <h3 class="s230_h3"><a href="/home/news-list.htm">天酒公告</a></h3>
        <ul class="s230_cul">
            <c:forEach var="obj" items="${news.list}">
                <li><a href="/home/news/${obj.id}.htm" target="_blank">${obj.title}</a></li>
            </c:forEach>
        </ul>
    </div>
</div>
<div id="content" class="clearfix mart10">
<div class="main_cul clearfix">
    <div class="m_cul_l m750 left">
        <h3 class="m750_h3 tj btn">特价商品</h3>
        <ul class="m_p clearfix">
            <c:forEach var="obj" items="${special.list}">
                <s:portlet var="upfilePl" url="/pl/upfile-map.htm" param="ownerId=${obj.id}"/>
                <li>
                    <div class="m_p_img"><a href="/home/product/${obj.id}.htm" target="_blank"><img src="${upfilePl.map['l-default'].path}" alt="${obj.degree}°${obj.title}${obj.volume}ml" /></a></div>
                    <div class="m_p_del">
                        <p class="m_p_til"><a href="/home/product/${obj.id}.htm" target="_blank">${obj.degree}°${obj.title}${obj.volume}ml</a></p>
                        <p class="m_p_price f999">天酒价：<span class="fred fb"><tags:price price="${obj.price}"/></span></p>
                        <p class="m_p_price f999"><del>原价：<tags:price price="${obj.market_price}"/></del></p>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
    <div class="sbar230 right">
        <a href="/home/0list.htm"><h3 class="s_0p_h3 btn">0元品鉴</h3></a>
        <ul class="s230_cul s_0p">
            <c:forEach var="obj" items="${price0.list}">
            <s:portlet var="upfilePl" url="/pl/upfile-map.htm" param="ownerId=${obj.id}"/>
            <li>
                <div class="s_0p_img clearfix">
                    <a href="/home/product/${obj.id}.htm" target="_blank"><img src="${upfilePl.map['l-default'].path}" class="left" /></a>
                    <div class="s_0p_txt f999"><span>容量：${obj.volume}ml</span><span>剩余：余量有限</span><span>访问量：${obj.page_view}次</span></div>
                </div>
                <p class="s_0p_til"><a href="/home/product/${obj.id}.htm" target="_blank">${obj.degree}°${obj.title}</a></p>
                <p class="s_0p_price f999">天酒价：<span class="fred fb">￥0</span></p>
            </li>
            </c:forEach>
        </ul>
    </div>
</div><!-- end main_cul -->
<div class="m_brand mart10">
    <ul class="clearfix">
        <c:forEach var="unit" items="${brand.list}" varStatus="status">
            <s:portlet url="/pl/category.htm" var="ca" param="id=${unit.category_id}"/>
            <s:portlet var="upfilePl" url="/pl/upfile-map.htm" param="ownerId=${unit.id}&ownerType=10"/>
            <li <c:if test="${status.index==0||status.index==9}">class="first"</c:if> >
                <a href="/home/brand/${unit.id}.htm" target="_blank"><img src="${upfilePl.map['l-default'].path}" width="98" alt="${ca.category.full_name}" /><span>${ca.category.full_name}</span></a>
            </li>
        </c:forEach>
    </ul>
</div>
<div class="main_cul mart10 clearfix">
    <div class="m_cul_l m750 left">
        <h3 class="m750_h3 xp btn">新品上市</h3>
        <ul class="m_p clearfix">
            <c:forEach var="obj" items="${new.list}">
                <s:portlet var="upfilePl" url="/pl/upfile-map.htm" param="ownerId=${obj.id}"/>
                <li>
                    <div class="m_p_img"><a href="/home/product/${obj.id}.htm" target="_blank"><img src="${upfilePl.map['l-default'].path}" alt="${obj.degree}°${obj.title}${obj.volume}ml" /></a></div>
                    <div class="m_p_del">
                        <p class="m_p_til"><a href="/home/product/${obj.id}.htm" target="_blank">${obj.degree}°${obj.title}${obj.volume}ml</a></p>
                        <p class="m_p_price f999">天酒价：<span class="fred fb"><tags:price price="${obj.price}"/></span></p>
                        <p class="m_p_price f999"><del>原价：<tags:price price="${obj.market_price}"/></del></p>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
    <div class="sbar230 right">
        <h3  class="s230_h3">人气排行 </h3>
        <ul class="s230_cul s_rankt">
            <c:forEach var="obj" items="${recommend.list}" varStatus="status">
                <s:portlet var="upfilePl" url="/pl/upfile-map.htm" param="ownerId=${obj.id}"/>
                <li <c:if test="${status.index==0}">class="open"</c:if> >
                    <span class="num n0${status.count}"><a href="/home/product/${obj.id}.htm" target="_blank">${obj.degree}°${obj.title}${obj.volume}ml</a></span>
                    <div class="s_rankt_del s_0p_img clearfix">
                        <a href="/home/product/${obj.id}.htm" target="_blank"><img src="${upfilePl.map['l-default'].path}" class="left" /></a>
                        <div class="s_0p_txt f999"><span>度数：${obj.degree}°</span><span>天酒价：<tags:price price="${obj.price}"/></span><span><del>市场价：<tags:price price="${obj.market_price}"/></del></span></div>
                    </div>
            </li>
            </c:forEach>

        </ul>
    </div>
</div><!-- end main_cul -->
<div class="m_ad clearfix mart10">
    <s:portlet var="btn1file" url="/pl/upfile-list.htm" param="ownerId=${btn1.list[0].id}&ownerType=4"/>
    <s:portlet var="btn2file" url="/pl/upfile-list.htm" param="ownerId=${btn2.list[0].id}&ownerType=4"/>
    <s:portlet var="btn3file" url="/pl/upfile-list.htm" param="ownerId=${btn3.list[0].id}&ownerType=4"/>
    <a href="${btn1.list[0].href}" target="_blank"><img src="${btn1file.list[0].path}" alt="${btn1.list[0].title}" /></a>
    <a href="${btn2.list[0].href}" target="_blank"><img src="${btn2file.list[0].path}" alt="${btn2.list[0].title}" /></a>
    <a href="${btn3.list[0].href}" target="_blank"><img src="${btn3file.list[0].path}" alt="${btn3.list[0].title}" /></a>
</div>
<div class="main_cul mart10 clearfix">
    <div class="m_cul_l m750 left">
        <h3 class="m750_h3 hq btn">婚庆产品</h3>
        <ul class="m_p clearfix">
            <c:forEach var="obj" items="${hot.list}">
                <s:portlet var="upfilePl" url="/pl/upfile-map.htm" param="ownerId=${obj.id}"/>
                <li>
                    <div class="m_p_img"><a href="/home/product/${obj.id}.htm" target="_blank"><img src="${upfilePl.map['l-default'].path}" alt="${obj.degree}°${obj.title}${obj.volume}ml" /></a></div>
                    <div class="m_p_del">
                        <p class="m_p_til"><a href="/home/product/${obj.id}.htm" target="_blank">${obj.degree}°${obj.title}${obj.volume}ml</a></p>
                        <p class="m_p_price f999">天酒价：<span class="fred fb"><tags:price price="${obj.price}"/></span></p>
                        <p class="m_p_price f999"><del>原价：<tags:price price="${obj.market_price}"/></del></p>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
    <div class="s_ad sbar230 right">
        <s:portlet var="side1file" url="/pl/upfile-list.htm" param="ownerId=${side1.list[0].id}&ownerType=4"/>
        <a href="${side1.list[0].href}" target="_blank"><img src="${side1file.list[0].path}" alt="${side1.list[0].title}" /></a>
        <s:portlet var="side2file" url="/pl/upfile-list.htm" param="ownerId=${side2.list[0].id}&ownerType=4"/>
        <a href="${side2.list[0].href}" target="_blank"  class="mart10"><img src="${side2file.list[0].path}" alt="${side2.list[0].title}" /></a>
    </div>
</div><!-- end main_cul -->
</div>
<c:import url="../footer.jsp" charEncoding="utf-8"/>
</div>

</body>
<script type="text/javascript">
    switchImg();//焦点图切换
    slideMenus(".slideTrigger", ".slideCon");//二级菜单
    slideContent(".s_rankt li");

    displayEllipsis(".notice li a", 19);//省略显示
    $(document).ready(function(){
        $(".s_input").focus(function(){
            $(this).css("color","#333");
            if($(this).val() == this.defaultValue){
                $(this).val("");
            }
        }).blur(function(){
                    if($(this).val() == ''){
                        $(this).css("color","#999");
                        $(this).val(this.defaultValue);
                    }
                })
    })
</script>

</html>