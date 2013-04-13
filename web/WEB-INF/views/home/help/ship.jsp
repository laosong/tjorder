<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="买茅台酒、劲酒、汾酒、国酒等各种白酒，上天酒商城." />
    <meta name="description" content="茅台酒,劲酒,汾酒,国酒,五粮液,高端白酒,天酒商城" />
    <title>配送方式_天酒商城</title>
    <link href="/css/base.css" rel="stylesheet" type="text/css"/>
    <link href="/css/common.css" rel="stylesheet" type="text/css"/>
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
        <div class="sbar190 left">
            <div class="sbar_help sbar190_cul cul_border">
                <h4 class="s190_til fb">帮助中心</h4>
                <div class="help_nav">
                    <dl>
                        <dt>购物指南</dt>
                        <dd><a href="/help/buy.htm#1">如何购物</a></dd>
                        <dd><a href="/help/buy.htm#2">购物保障</a></dd>
                        <dd><a href="/help/buy.htm#3">发票说明</a></dd>
                    </dl>
                    <dl>
                        <dt>购买支付</dt>
                        <dd><a href="/help/pay.htm#1">货到付款</a></dd>
                        <dd><a href="/help/pay.htm#2">在线支付</a></dd>
                    </dl>
                    <dl>
                        <dt>配送方式</dt>
                        <dd><a href="#1">配送时间</a></dd>
                        <dd><a href="#2">配送费用</a></dd>
                        <dd><a href="#3">配送范围</a></dd>
                    </dl>
                    <dl>
                        <dt>售后服务</dt>
                        <dd><a href="/help/service.htm#1">退换货政策</a></dd>
                        <dd><a href="/help/service.htm#2">退换货流程</a></dd>
                    </dl>
                </div>
            </div>
        </div>
        <div class="help_con m790 right">
            <a name="1"></a><h3 class="con_til">配送时间</h3></a>
            <div class="help_del mart10">
                <p>配送时间</p>
                <p>下单后，48小时之内发货</p>
            </div>
            <a name="2"></a><h3 class="con_til">配送费用</h3></a>
            <div class="help_del mart10">
                <p>配送费用</p>
                <p>非特殊说明，天酒商城全场满99元免运费；不足100元，每单需加10元配送费，订单不限瓶数。</p>
            </div>
            <a name="3"></a><h3 class="con_til">配送范围</h3></a>
            <div class="help_del mart10">
                <p>配送范围</p>
                <p>全国（具体参见下表）</p>
                <p>配送安全说明：为保证货品安全，每瓶产品都采用安全包装，以确保在运输途中不会因挤压、碰撞等因素造成破损；如出现破损，请与快递人员当面核实，并对破损进行拍照取证，后致电400 60 36519与客服沟通；</p>
                <p></p>
            </div>
        </div><!-- end content -->
    </div>
    <c:import url="../footer.jsp" charEncoding="utf-8"/>
</div>
</body>
</html>