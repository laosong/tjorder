<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<s:portlet url="/pl/category.htm" var="ca" param="id=${id}"/>
<s:portlet url="/pl/category.htm" var="root" param="id=0"/>
<s:portlet url="/pl/cookie-list.htm" var="cukie" param="name=Viewed_p&isLong=true&info="/><!-- {cukie.infoList}-->
<s:newBean var="bId" classType="java.lang.Long" initVal="0"/><!--品牌-->
<s:newBean var="sId" classType="java.lang.Long" initVal="0"/><!--系列id-->
<s:newBean var="p1" classType="java.lang.Double" initVal="${param.p1}"/><!--price start-->
<s:newBean var="p2" classType="java.lang.Double" initVal="${param.p2}"/><!--price end-->
<s:newBean var="pIndex" classType="java.lang.Integer" initVal="0"/><!---->
<s:newBean var="oIndex" classType="java.lang.Integer" initVal="${param.o}"/><!--order by-->
<s:newBean var="oo1" classType="java.lang.Integer" initVal="21"/><!--order by-->
<s:newBean var="oo2" classType="java.lang.Integer" initVal="23"/><!--order by-->
<s:newBean var="oo3" classType="java.lang.Integer" initVal="25"/><!--order by-->
<s:newBean var="oo4" classType="java.lang.Integer" initVal="27"/><!--order by-->
<s:newBean var="oo5" classType="java.lang.Integer" initVal="29"/><!--order by-->
<jsp:useBean id="filter1" class="java.lang.String" />
<jsp:useBean id="filter2" class="java.lang.String" />
<c:if test="${p1==1&&p2==99}"><c:set var="pIndex" value="1"/></c:if>
<c:if test="${p1==100&&p2==299}"><c:set var="pIndex" value="2"/></c:if>
<c:if test="${p1==300&&p2==599}"><c:set var="pIndex" value="3"/></c:if>
<c:if test="${p1==600&&p2==999}"><c:set var="pIndex" value="4"/></c:if>
<c:if test="${p1==1000&&p2==1999}"><c:set var="pIndex" value="5"/></c:if>
<c:if test="${p1==2000}"><c:set var="pIndex" value="6"/></c:if>
<c:if test="${p1!=0||p2!=0}"><c:set var="filter2" value="&price_low=${p1}&price_high=${p2}"/></c:if>
<c:if test="${oIndex<21||oIndex>40}"><c:set var="oIndex" value="21"/></c:if>
<c:if test="${oIndex==21}"><c:set var="oo1" value="22"/></c:if>
<c:if test="${oIndex==23}"><c:set var="oo2" value="24"/></c:if>
<c:if test="${oIndex==25}"><c:set var="oo3" value="26"/></c:if>
<c:if test="${oIndex==27}"><c:set var="oo4" value="28"/></c:if>
<c:if test="${oIndex==29}"><c:set var="oo5" value="30"/></c:if>
<c:if test="${ca.category.parent_id==0}"><c:set var="bId" value="${id}"/><c:set var="filter1" value="&brand_id=${id}"/></c:if>
<c:if test="${ca.category.parent_id!=0}">
    <c:set var="bId" value="${ca.category.parent_id}"/><c:set var="sId" value="${id}" /><c:set var="filter1" value="&category_id=${id}"/>
</c:if>
<s:portlet url="/pl/category.htm" var="brand" param="id=${bId}"/>
<s:portlet url="/pl/goods-list.htm" var="pvHigh" param="state=2&types=2&pageNo=1&pageItemNum=3&orderbyIndex=11"/>
<s:portlet url="/pl/goods-list.htm" var="pList"
           param="state=2&types=2&pageItemNum=8&pageNo=${param.pageNo}&orderbyIndex=${oIndex}${filter1}${filter2}"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="买茅台酒、劲酒、汾酒、国酒等各种白酒，上天酒商城." />
    <meta name="description" content="茅台酒,劲酒,汾酒,国酒,五粮液,高端白酒,天酒商城" />
    <title>高端白酒_天酒商城</title>
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
            <div class="p_brand">
                <h2 class="f14px fb">商品筛选</h2>
                <dl class="mart10 clearfix">
                    <dt>品牌</dt>
                    <dd>
                        <a href="javascript:util_setHref(util_replaceUrl('0list.htm'));" <c:if test="${empty bId}">class="curB"</c:if> >不限</a>
                        <c:forEach var="unit" items="${root.currNode.children}" varStatus="status">
                            <a href="javascript:util_setHref(util_replaceUrl('0list${unit.data.id}.htm'));" <c:if test="${unit.data.id==bId}">class="curB"</c:if> >${unit.data.full_name}</a>
                        </c:forEach>
                    </dd>
                </dl>
                <c:if test="${!empty bId}">
                    <dl class="mart10 clearfix">
                        <dt>系列</dt>
                        <dd>
                            <a href="javascript:util_setHref(util_replaceUrl('0list${bId}.htm'));" <c:if test="${sId==0}">class="curB"</c:if> >不限</a>
                            <c:forEach var="unit" items="${brand.currNode.children}" varStatus="status">
                                <a href="javascript:util_setHref(util_replaceUrl('0list${unit.data.id}.htm'));" <c:if test="${unit.data.id==sId}">class="curB"</c:if> >${unit.data.full_name}</a>
                            </c:forEach>
                        </dd>
                    </dl>
                </c:if>
            </div>
            <div class="p_order mart10">
                <dl class="clearfix">
                    <dt class="left">排序条件：</dt>
                    <dd class="left">
                        <a href="javascript:util_setHref(util_replaceQString2('o',${oo1}));" <c:if test="${oIndex==21||oIndex==22}">class="curO"</c:if> >上架时间 <c:if test="${oIndex==21}">↓</c:if> <c:if test="${oIndex==22}">↑</c:if></a>
                        <a href="javascript:util_setHref(util_replaceQString2('o',${oo3}));" <c:if test="${oIndex==25||oIndex==26}">class="curO"</c:if> >酒精度 <c:if test="${oIndex==25}">↓</c:if> <c:if test="${oIndex==26}">↑</c:if></a>
                        <a href="javascript:util_setHref(util_replaceQString2('o',${oo4}));" <c:if test="${oIndex==27||oIndex==28}">class="curO"</c:if> >访问量 <c:if test="${oIndex==27}">↓</c:if> <c:if test="${oIndex==28}">↑</c:if></a>
                        <a href="javascript:util_setHref(util_replaceQString2('o',${oo5}));" <c:if test="${oIndex==29||oIndex==30}">class="curO"</c:if> >容量 <c:if test="${oIndex==29}">↓</c:if> <c:if test="${oIndex==30}">↑</c:if></a>
                    </dd>
                </dl>
            </div>
            <div class="p_plist">
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