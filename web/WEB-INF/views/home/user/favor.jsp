<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<s:portlet var="u" url="/pl/curr-user.htm" param=""/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="买茅台酒、劲酒、汾酒、国酒等各种白酒，上天酒商城." />
    <meta name="description" content="茅台酒,劲酒,汾酒,国酒,五粮液,高端白酒,天酒商城" />
    <title>我的藏酒阁_天酒商城</title>
    <link href="/css/base.css" rel="stylesheet" type="text/css"/>
    <link href="/css/common.css"	rel="stylesheet" type="text/css"/>
    <link href="/css/main.css" rel="stylesheet" type="text/css"/>
    <link href="/css/personal.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
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
            <h3 class="con_til">我的藏酒阁</h3>
            <div class="personal_del tablestyle mart10">
                <table summary="我的藏酒阁" class="personal_order">
                    <tr>
                        <th width="12%">商品编号</th>
                        <th>商品</th>
                        <th width="12%">天酒优惠价</th>
                        <th width="10%">原价</th>
                        <th width="10%">库存状态</th>
                        <th width="15%">操作</th>
                    </tr>
                    <c:forEach var="unit" items="${u.user.profiles.profiles.favor.list}" varStatus="ct">
                        <s:portlet var="upfilePl" url="/pl/upfile-map.htm" param="ownerId=${unit.obj}"/>
                        <s:portlet var="obj" url="/pl/goods-obj.htm" param="id=${unit.obj}"/>
                        <tr>
                            <td>${obj.goods.serial_num}</td>
                            <td class="t_l">
                                <a href="/home/product/${unit.obj}.htm" target="_blank"><img src="${upfilePl.map['l-default'].path}" alt="${obj.goods.degree}° ${obj.goods.title}${obj.goods.volume}ml" />${obj.goods.degree}° ${obj.goods.title}${obj.goods.volume}ml</a></td>
                            <td><tags:price price="${obj.goods.price}"/></td>
                            <td><tags:price price="${obj.goods.market_price}"/></td>
                            <td class="f999"><c:if test="${obj.goods.state==1}">已下架</c:if><c:if test="${obj.goods.state==2}">现货</c:if></td>
                            <td class="o_l"><a href="javascript:window.location.href='del-favor.htm?id=${unit.obj}&toUrl='+window.location.href">删除</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <c:import url="./menu.jsp?p=favor" charEncoding="utf-8"/>
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