<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<s:portlet var="u" url="/pl/curr-user.htm" param=""/>
<s:portlet url="/pl/category.htm" var="ca" param="id=${goods.category_id}"/>
<s:portlet url="/pl/brand-list.htm" var="brand" param="orderbyIndex=1"/>
<s:portlet url="/pl/goods-list.htm" var="sameBrand" param="state=2&pageNo=1&pageItemNum=7&orderbyIndex=11&brand_id=${ca.category.parent_id}"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="买茅台酒、劲酒、汾酒、国酒等各种白酒，上天酒商城." />
    <meta name="description" content="茅台酒,劲酒,汾酒,国酒,五粮液,高端白酒,天酒商城" />
    <title>高端白酒_天酒商城</title>
    <link href="/css/base.css" rel="stylesheet" type="text/css"/>
    <link href="/css/common.css"	rel="stylesheet" type="text/css"/>
    <link href="/css/product.css"	rel="stylesheet" type="text/css"/>
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
        $(function() {
            $( "#subtractNum").click(function(){  var count=$('#proNum').val();  if(count>1) $('#proNum').val(--count);   });
            $( "#addNum").click(function(){ var count=$('#proNum').val(); $('#proNum').val(++count);   });
        });
    </script>
</head>
<body>
<c:import url="../topbar.jsp" charEncoding="utf-8"/>
<div id="container">
    <c:import url="../header.jsp" charEncoding="utf-8"/>
    <div id="content" class="clearfix mart10">
        <div class="product m790 right">
            <h3 class="f16px fb">${goods.title}</h3>
            <div class="pro_del mart10 clearfix">
                <div class="pro_del_l left">
                    <jsp:useBean id="big" class="java.lang.String" scope="page"/><jsp:useBean id="middle" class="java.lang.String" scope="page"/>
                    <jsp:useBean id="small" class="java.lang.String" scope="page"/><s:newBean var="first" classType="java.lang.Boolean" initVal="true"/>
                    <s:portlet var="upfilePl" url="/pl/upfile-2list.htm" param="ownerId=${goods.id}&ownerType=1&orderbyIndex=1"/>
                    <c:forEach var="uList" items="${upfilePl.list}">
                        <c:if test="${ fn:startsWith(uList[0].label,'p-')}">
                            <c:forEach var="upfile" items="${uList}">
                                <c:if test="${ upfile.mark=='s'}"><c:set var="small" value="${upfile.path}"/> </c:if>
                                <c:if test="${ upfile.mark=='m'}"><c:set var="middle" value="${upfile.path}"/></c:if>
                                <c:if test="${ upfile.mark=='b'}"><c:set var="big" value="${upfile.path}"/></c:if>
                            </c:forEach>
                            <c:if test="${first}">
                                <div class="pro_del_img jqzoom"><img src="${middle}" class="img_s" alt="${goods.title}" jqimg="${big}" id="bigImg"/></div>
                                <c:set var="first" value="false"/>
                            </c:if>
                        </c:if>
                    </c:forEach>
                    <div class="mart10"></div>
                    <ul class="pro_del_imgList clearfix">
                        <c:forEach var="uList" items="${upfilePl.list}">
                            <c:if test="${ fn:startsWith(uList[0].label,'p-')}">
                                <c:forEach var="upfile" items="${uList}">
                                    <c:if test="${ upfile.mark=='s'}"><c:set var="small" value="${upfile.path}"/> </c:if>
                                    <c:if test="${ upfile.mark=='m'}"><c:set var="middle" value="${upfile.path}"/></c:if>
                                    <c:if test="${ upfile.mark=='b'}"><c:set var="big" value="${upfile.path}"/></c:if>
                                </c:forEach>
                                <li><img src="${small}" src-mid="${middle}" src-big="${big}" alt="${goods.title}" width="40" height="40" /></li>
                            </c:if>
                        </c:forEach>
                    </ul>

                </div>
                <div class="pro_del_r">
                    <ul>
                        <li>市场价:<del><tags:price price="${goods.market_price}"/></del><span class="f999">商品货号：${goods.serial_num}</span></li>
                        <li>天酒价：<span class="price fred fb"><tags:price price="${goods.price}"/></span></li>
                        	<jsp:useBean id="brandId" class="java.lang.String"/>
                        	<c:forEach var="unit" items="${brand.list}">
                        		<c:if test="${unit.category_id==ca.currNode.parent.data.id}"><c:set var="brandId" value="${unit.id}"/></c:if> 
                        	</c:forEach>
                        <li>商品品牌：<a href="/home/brand/${brandId}.htm" target="_blank">${ca.currNode.parent.data.full_name}</a></li>
                        <li>商品库存：有货，可送至全国</li>
                        <li>容量：${goods.volume}ml</li>
                        <li>香型：${goods.flavor}</li>
                        <li>酒精含量：${goods.degree}</li>
                    </ul>
                    <s:newBean var="inFavor" classType="java.lang.Bealean" initVal="false"/>
                    <c:forEach var="unit" items="${u.user.profiles.profiles.favor.list}" varStatus="ct">
                        <c:if test="${unit.obj==goods.id}"><c:set  var="inFavor" value="true"/></c:if>
                    </c:forEach>
                    <div class="pro_del_buy mart20">
                        <div class="b_num">我要买：<i id="subtractNum">-</i><input type="text" id="proNum" value="1" /><i id="addNum">+</i></div>
                        <div class="b_submit mart15">
                            <a href="javascript:window.location.href='/orderAction/addCartItem?itemId=${goods.id}&itemCount='+$('#proNum').val();" class="btn b_buy">加入购物车</a>
                            <c:if test="${inFavor}"></c:if>
                            <c:if test="${!inFavor}"><a href="javascript:window.location.href='/home/user/add-favor.htm?id=${goods.id}&toUrl='+window.location.href;" class="btn b_collect">收藏</a></c:if>
                        </div>
                    </div>
                </div>
            </div><!-- end pro_del -->
            <div class="pro_intro mart30">
                <ul class="pro_intro_tab tab tabTag_product clearfix">
                    <li onclick="setTab('product', 0);" class="curTag btn"><span class="btn">商品描述</span></li>
                    <li onclick="setTab('product', 1);" class="btn"><span class="btn">商品属性</span></li>
                    <!-- <li onclick="setTab('product', 2);" class="btn"><span class="btn">质监报告</span></li>-->
                    <li onclick="setTab('product', 2);" class="btn"><span class="btn">运输包装</span></li>
                    <li onclick="setTab('product', 3);" class="btn"><span class="btn">用户评价</span></li>
                </ul>
                <div class="tabCon_product">
                    <div class="pro_intro_del">
                        ${goods.text}
                    </div>
                    <div class="pro_intro_del hidden">
                        <p>
                        <table width="95%" border="0" cellspacing="0">
                            <tr><td width="30%">容量:</td><td>${goods.volume}ml</td></tr>
                            <tr><td >度数:</td><td>${goods.degree}度</td></tr>
                            <tr><td >香型:</td><td>${goods.flavor}</td></tr>
                            <tr><td >推荐适用场合:</td><td>${goods.occasion}</td></tr>
                            <tr><td >规格:</td><td>${goods.specs}</td></tr>
                            <tr><td >生产许可证编号:</td><td>${goods.permit_num}</td></tr>
                            <tr><td >产品标准号:</td><td>${goods.std_num}</td></tr>
                            <tr><td >配料表:</td><td>${goods.ele_table}</td></tr>
                            <tr><td >商品条形码:</td><td>${goods.bar_code}</td></tr>
                        </table>
                        </p>
                    </div>
                    <!-- <div class="pro_intro_del hidden">
                        ${goods.exam_report}
                    </div>-->
                    <div class="pro_intro_del hidden">
                        ${goods.package_info}
                    </div>
                    <div class="pro_intro_del hidden">
                        
                    </div>
                </div>
            </div><!-- end pro_intro -->
            <div class="pro_comment mart30">
                <div class="pro_comment_til">用户评价</div>
                <div class="pro_comment_average mart10">
                    <ul class="clearfix">
                        <li class="a_cmt left">我在天酒购买过此产品：<a href="/home/user/add-comments.htm?gid=${goods.id}" class="f12px fb btnCom btnCom_reb"><span>我要评价</span></a></li>
                        <li class="a_star f14px fb right">
                            <c:if test="${goods.comment_num>0}"><span class="left">平均星级: <fmt:formatNumber value="${goods.rank/goods.comment_num}" pattern="#.0"/></span></c:if>
                            <c:if test="${goods.comment_num<=0}"><span class="left">平均星级: 暂无</span></c:if>
                        </li>
                    </ul>
                </div>
                <span  id="comments-list"></span>
                <script type="text/javascript" >
                    <c:if test="${!empty goods.id}">
                    $.get('/home/products/comments-list.htm?id=${goods.id}&pageNo=1', function(data) {
                        $('#comments-list').html(data);
                    });
                    </c:if>
                </script>
            </div><!-- end pro_comment -->
        </div>
        <div class="sbar190 left">
            <div class="sbar_other sbar190_cul cul_border mart10">
                <h4 class="s190_til">同品牌其他产品</h4>
                <ul class="sbar190_con">
                    <c:forEach var="obj" items="${sameBrand.list}">
                        <s:portlet var="upfilePl" url="/pl/upfile-map.htm" param="ownerId=${obj.id}"/>
                        <c:if test="${obj.id!=goods.id}">
                            <li>
                                <div class="s_0p_img texcenter">
                                    <a href="/home/product/${obj.id}.htm"><img src="${upfilePl.map['l-default'].path}" border="0" alt=""></a>
                                </div>
                                <p class="s_0p_til"><a href="/home/product/${obj.id}.htm">${obj.title}</a></p>
                                <p class="s_0p_price f999">天酒价：<span class="fred fb"><tags:price price="${obj.price}"/></span></p>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
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