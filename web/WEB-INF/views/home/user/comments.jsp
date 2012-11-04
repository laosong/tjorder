<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<s:portlet var="u" url="/pl/curr-user.htm" param=""/>
<s:portlet var="c" url="/pl/comments-list.htm" param="creator=${u.user.id}&pageItemNum=10&pageNo=${param.pageNo}"/>
<s:portlet var="uc" url="/pl/orderItem-list.htm" param="user_id=${u.user.id}&commented=0&pageItemNum=10&pageNo=${param.pageNo}"/>
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
            <h3 class="con_til">我的评论</h3>
            <div class="personal_del mart20">
                <ul class="per_tab tab tabTag_comment clearfix">
                    <li onclick="location.href='/home/user/comments.htm?tab=1' " class="curTag btn"><span class="btn">未评价商品</span></li>
                    <li onclick="location.href='/home/user/comments.htm?tab=2' " class="btn"><span class="btn">已评价商品</span></li>
                </ul>
                <div class="tabCon_comment tablestyle mart10">
                    <div class="per_comment">
                        <div class="per_comment_list">
                            <table summary="未评价商品" class="personal_order">
                                <tr>
                                    <th width="12%">商品编号</th>
                                    <th>订单商品</th>
                                    <th width="12%">订单编号</th>
                                    <th width="12%">购买时间</th>
                                    <th width="15%">评语</th>
                                </tr>
                                <c:forEach var="unit" items="${uc.list}">
                                    <s:portlet var="goodsObj" url="/pl/goods-obj.htm" param="id=${unit.item_id}"/>
                                    <s:portlet var="upfilePl" url="/pl/upfile-map.htm" param="ownerId=${unit.item_id}"/>
                                <tr>
                                    <td>${goodsObj.goods.serial_num}</td>
                                    <td class="t_l">
                                        <a href="/home/product/${goodsObj.goods.id}.htm" target="_blank"><img src="${upfilePl.map['l-default'].path}" alt="${goodsObj.goods.degree}° ${goodsObj.goods.title}${goodsObj.goods.volume}ml" />${goodsObj.goods.degree}° ${goodsObj.goods.title}${goodsObj.goods.volume}ml</a>
                                    </td>
                                    <td>${unit.order_cd}</td>
                                    <td class="f999"><tags:date date="${unit.created_date}"/></td>
                                    <td class="o_l"><a href="/home/user/add-comments.htm?gid=${unit.item_id}">撰写评价</a></td>
                                </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <tags:pager id="page-1" maxPageNo="${uc.maxPageNo}" pageNo="${uc.pageNo}"  para1="tab" value1="1" />
                    </div><!-- end per_comment -->
                    <div class="per_comment hidden">
                        <div class="per_comment_list">
                            <table summary="已评价商品" class="personal_order">
                                <tr>
                                    <th width="12%">商品编号</th>
                                    <th>订单商品</th>
                                    <th width="12%">日期</th>
                                    <th width="12%">满意指数</th>
                                    <th width="15%">评语</th>
                                </tr>
                                <c:forEach var="unit" items="${c.list}">
                                    <s:portlet var="upfilePl" url="/pl/upfile-map.htm" param="ownerId=${unit.owner_id}"/>
                                    <tr>
                                        <td>${unit.serial_num}</td>
                                        <td class="t_l">
                                            <a href="/home/product/${unit.owner_id}.htm" target="_blank"><img src="${upfilePl.map['l-default'].path}" alt="${unit.degree}° ${unit.goods_title}${unit.volume}ml" />${unit.degree}° ${unit.goods_title}${unit.volume}ml</a>
                                        </td>
                                        <td><tags:date date="${unit.created_date}"/></td>
                                        <td class="f999"><div class="btn cmt_stars stars_${unit.score}">评价星级</div></td>
                                        <td class="o_l"><a href="/home/user/comments-detail${unit.id}.htm">查看评价</a></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <tags:pager maxPageNo="${c.maxPageNo}" pageNo="${c.pageNo}" para1="tab" value1="2" />
                    </div><!-- end per_comment -->
                </div><!-- end tabCon_comment -->
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
    <c:if test='${param.tab==2}'>setTab('comment', 1);</c:if>
    <c:if test='${param.tab!=2}'>setTab('comment', 0);</c:if>
</script>
</body>
</html>