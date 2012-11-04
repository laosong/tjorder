<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<s:portlet url="/pl/news-list.htm" var="news" param="pageNo=${param.pageNo}&pageItemNum=15"/>
<s:portlet url="/pl/goods-list.htm" var="pvHigh" param="state=2&pageNo=1&pageItemNum=3&orderbyIndex=11"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="买茅台酒、劲酒、汾酒、国酒等各种白酒，上天酒商城." />
    <meta name="description" content="茅台酒,劲酒,汾酒,国酒,五粮液,高端白酒,天酒商城" />
    <title>公告列表_天酒商城</title>
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
    <div id="content" class="noticeCon mart10">
        <div class="m790 right">
            <h3 class="con_til">天酒公告</h3>
            <ul class="notice_list mart10">
                <c:forEach var="obj" items="${news.list}">
                    <li><span class="left"><a href="/home/news/${obj.id}.htm" target="_blank">${obj.title}</a></span><span class="f999 right"><tags:date date="${obj.publish_date}"/></span></li>
                </c:forEach>
            </ul>
            <c:if test="${fn:length(news.list)>0}"><tags:pager maxPageNo="${news.maxPageNo}" pageNo="${news.pageNo}" /></c:if>
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