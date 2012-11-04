<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<s:portlet url="/pl/cookie-list.htm" var="cukie" param="name=Viewed_p&isLong=true&info="/><!-- {cukie.infoList}-->
<s:portlet url="/pl/goods-list.htm" var="pvHigh" param="state=2&pageNo=1&pageItemNum=3&orderbyIndex=11"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="买茅台酒、劲酒、汾酒、国酒等各种白酒，上天酒商城." />
    <meta name="description" content="茅台酒,劲酒,汾酒,国酒,五粮液,高端白酒,天酒商城" />
    <title>搜索结果_天酒商城</title>
    <link href="/css/base.css" rel="stylesheet" type="text/css"/>
    <link href="/css/common.css"	rel="stylesheet" type="text/css"/>
    <link href="/css/product.css" rel="stylesheet" type="text/css"/>
    <link href="/css/main.css" rel="stylesheet" type="text/css"/>
    <link href="/plugin/buk/buk.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.jqzoom.js"></script>
    <script type="text/javascript" src="/js/other.js"></script>
    <script type="text/javascript" language="javascript" src="/plugin/buk/pager.js"></script>
    <script type="text/javascript" src="/js/js_foundation.js"></script>
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
        <div class="product m790 right">
            <h3 class="con_til">
                <c:if test="${!empty keyword}">与<span class="fred">“${keyword}”</span>相关商品</c:if>
                <c:if test="${empty keyword}">全部商品</c:if>
            </h3>
            <div class="p_plist">
                <c:if test="${fn:length(list)==0}"><p class="mart10">没有符合条件的搜索结果</p></c:if>
                <ul class="m_p clearfix">
                    <c:forEach var="obj" items="${list}">
                    <s:portlet var="upfilePl" url="/pl/upfile-map.htm" param="ownerId=${obj.id}"/>
                    <li>
                        <div class="m_p_img"><a href="/home/product/${obj.id}.htm" target="_blank"><img src="${upfilePl.map['l-default'].path}" alt="${obj.degree}° ${obj.title}${obj.volume}ml" /></a></div>
                        <div class="m_p_del">
                            <p class="m_p_til"><a href="#" target="_blank">[${obj.degree}]° ${obj.title}${obj.volume}ml</a></p>
                            <p class="m_p_price f999">特惠价：<span class="fred fb"><tags:price price="${obj.price}"/></span></p>
                            <p class="m_p_price f999"><del>原价：<tags:price price="${obj.market_price}"/></del></p>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
                <c:if test="${fn:length(list)>0}"><tags:pager maxPageNo="${maxPageNo}" pageNo="${pageNo}" /></c:if>
            </div>
        </div>
        <div class="sbar190 left">
            <div class="sbar_other sbar190_cul cul_border">
                <h4 class="s190_til">人气排行</h4>
                <ul class="sbar190_con">
                    <c:forEach var="obj" items="${pvHigh.list}">
                        <s:portlet var="upfilePl" url="/pl/upfile-map.htm" param="ownerId=${obj.id}"/>
                        <li>
                            <div class="s_0p_img texcenter"><a href="/home/product/${obj.id}.htm"><img src="${upfilePl.map['l-default'].path}" /></a></div>
                            <p class="s_0p_til"><a href="/home/product/${obj.id}.htm">${obj.degree}°${obj.title} ${obj.volume}ml</a></p>
                            <p class="s_0p_price f999">天酒价：<span class="fred fb"><tags:price price="${obj.price}"/></span></p>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="sbar_other sbar190_cul cul_border mart10">
                <h4 class="s190_til">浏览历史</h4>
                <ul class="sbar190_con">
                    <c:forEach var="obj" items="${cukie.list}" begin="0" end="3">
                        <s:portlet var="upfilePl" url="/pl/upfile-map.htm" param="ownerId=${obj}"/>
                        <s:portlet var="goodsObj" url="/pl/goods-obj.htm" param="id=${obj}"/>
                        <li>
                            <div class="s_0p_img texcenter"><a href="/home/product/${goodsObj.goods.id}.htm"><img src="${upfilePl.map['l-default'].path}" /></a></div>
                            <p class="s_0p_til"><a href="/home/product/${goodsObj.goods.id}.htm">${goodsObj.goods.degree}°${goodsObj.goods.title} ${goodsObj.goods.volume}ml</a></p>
                            <p class="s_0p_price f999">天酒价：<span class="fred fb"><tags:price price="${goodsObj.goods.price}"/></span></p>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div><!-- end content -->
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