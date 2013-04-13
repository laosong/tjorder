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
    <title>购买支付_天酒商城</title>
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
                        <dd><a href="#1">货到付款</a></dd>
                        <dd><a href="#2">在线支付</a></dd>
                    </dl>
                    <dl>
                        <dt>配送方式</dt>
                        <dd><a href="/help/ship.htm#1">配送时间</a></dd>
                        <dd><a href="/help/ship.htm#2">配送费用</a></dd>
                        <dd><a href="/help/ship.htm#3">配送范围</a></dd>
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
            <a name="1"></a><h3 class="con_til">货到付款</h3></a>
            <div class="help_del mart10">
                <p>货到付款</p>
                <p>货到付款是快递人员送货上门，客户收单验货后，直接将货款交给配送员的一种结算方式（注：目前暂未开通POS机刷卡服务的地区，货到后需要现金支付）。</p>
                <p>如果您所在地区支持货到付款服务，请您在订购过程的“支付方式”处，选择支持方式为“货到付款”，</p>
            </div>
            <a name="2"></a><h3 class="con_til">在线支付</h3></a>
            <div class="help_del mart10">
                <p>1、在线支付平台</p>
                <p>天酒商城提供支付宝、手机支付、银联在线支付等在线支付平台支付，覆盖率达98％，同时天酒商城还支持中国工商银行、交通银行、中国建设银行、招商银行、中国银行、中国农业银行、中国民生银行、中信银行、北京银行、深圳发展银行、浦发银行、广发银行、兴业银行中国邮政储蓄银行、中国光大银行等12个银行的网银在线支付。选择在线支付，即时到帐，准确快捷！</p>
                <p>2、银行卡的开通</p>
                <p>因各地银行政策不同，建议您在网上支付前拨打所在地银行电话，咨询该行可供网上支付的银行卡种类及开通手续。</p>
                <p>3、支付金额上限</p>
                <p>目前各银行对于网上支付均有一定金额的限制，由于各银行政策不同，建议您在申请网上支付功能时向银行咨询相关事宜。</p>
                <p>4、到款时间</p>
                <p> 网上支付均是支付成功即到账。若由于网络故障导致您已支付成功的订单未改变订单状态，请您联系我们的客服人员为您解决。客服热线：400 60 36519（免长途费）</p>
                <p>温馨提示：在线支付付款等待期限为48小时。请您在订购成功后48小时内完成支付，否则我们将不会保留您的订单。</p>
            </div>
        </div>
    </div><!-- end content -->
    <c:import url="../footer.jsp" charEncoding="utf-8"/>
</div>
</body>
</html>