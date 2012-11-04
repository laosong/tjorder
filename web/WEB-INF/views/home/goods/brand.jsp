<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<s:portlet url="/pl/brand-obj.htm" var="brand" param="id=${id}"/>
<s:portlet var="upfileLogo" url="/pl/upfile-map.htm" param="ownerId=${id}&ownerType=10"/>
<s:portlet url="/pl/goods-list.htm" var="pList" param="state=2&pageItemNum=10&pageNo=${param.pageNo}&brand_id=${brand.obj.category_id}"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="买茅台酒、劲酒、汾酒、国酒等各种白酒，上天酒商城." />
    <meta name="description" content="茅台酒,劲酒,汾酒,国酒,五粮液,高端白酒,天酒商城" />
    <title>${brand.obj.manufacturer}_天酒商城</title>
    <link href="/css/base.css" rel="stylesheet" type="text/css"/>
    <link href="/css/common.css"	rel="stylesheet" type="text/css"/>
    <link href="/css/product.css"	rel="stylesheet" type="text/css"/>
    <link href="/css/main.css" rel="stylesheet" type="text/css"/>
    <style type="text/css" title="currentStyle">@import "/plugin/buk/buk.css";</style>
    <script type="text/javascript" language="javascript" src="/plugin/buk/pager.js"></script>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.jqzoom.js"></script>
    <script type="text/javascript" src="/js/other.js"></script>
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
    <div id="content" class="brandCon mart10">
        <div class="brand_intro">
            <h3 class="acticle_til fb txtcenter">${brand.obj.manufacturer}</h3>
            <div class="brand_intro_del mart20 clearfix">
                <div class="brand_intro_img left"><img src="${upfileLogo.map['l-default'].path}" alt="${brand.obj.manufacturer}" /></div>
                <div class="brand_intro_txt acticle_del left">
                    ${brand.obj.text}
                </div>
            </div>
        </div>
        <div class="p_plist mart10">
            <h4>商品列表</h4>
            <ul class="m_p clearfix">
                <c:forEach var="obj" items="${pList.list}">
                    <s:portlet var="upfilePl" url="/pl/upfile-map.htm" param="ownerId=${obj.id}"/>
                    <li>
                        <div class="m_p_img"><a href="/home/product/${obj.id}.htm" target="_blank"><img src="${upfilePl.map['l-default'].path}" alt="${obj.degree}° ${obj.title}${obj.volume}ml" /></a></div>
                        <div class="m_p_del">
                            <p class="m_p_til"><a href="#" target="_blank">${obj.degree}° ${obj.title}${obj.volume}ml</a></p>
                            <p class="m_p_price f999">特惠价：<span class="fred fb"><tags:price price="${obj.price}"/></span></p>
                            <p class="m_p_price f999"><del>原价：<tags:price price="${obj.market_price}"/></del></p>
                        </div>
                    </li>
                </c:forEach>
            </ul>
            <tags:pager maxPageNo="${pList.maxPageNo}" pageNo="${pList.pageNo}" />
        </div>
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