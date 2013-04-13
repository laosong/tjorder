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
    <title>购物指南_天酒商城</title>
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
                        <dd><a href="#1">如何购物</a></dd>
                        <dd><a href="#2">购物保障</a></dd>
                        <dd><a href="#3">发票说明</a></dd>
                    </dl>
                    <dl>
                        <dt>购买支付</dt>
                        <dd><a href="/help/pay.htm#1">货到付款</a></dd>
                        <dd><a href="/help/pay.htm#2">在线支付</a></dd>
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
            <a name="1"></a><h3 class="con_til">如何购物</h3></a>
            <div class="help_del mart10">
                <p>1、免费注册</p>
                <p>第一步：点击网站顶部“注册”,进入会员注册页面。</p>
                <p>第二步：根据相关的提示内容填写注册信息，最后点击“同意以下协议，注册”按钮。</p>
                <p>第三步：完成注册后，系统自动登录。即可开始您的天酒购物之旅。</p>
                <p></p>
                <p>2、挑选商品</p>
                <p>方法一：通过搜索功能查找。在搜索框中输入关键字、商品名称或商品编码进行搜索。</p>
                <p>方法二：通过分类导航查找。</p>
                <p></p>
                <p>3、确认下单</p>
                <p>第一步：挑选到心仪的商品后，选择要购买的数量，点击“加入购物车”即可将商品放入购物车。</p>
                <p>第二步：如需要修改商品数量，可在“购买数量”一栏修改，确认商品名称、数量及金额等信息无误后点击“结算”。</p>
                <p>第三步：填写收货地址、付款方式、发票信息等详细内容，填写完成后，点击“提交订单”。</p>
                <p>第四步：成功提交订单，选择在线支付的客户需根据网站提示完成支付。</p>
                <p></p>
                <p>4、订单跟踪</p>
                <p>成功提交订单后，您可随时登录天酒商城，进入“我的订单”查看订单状态。</p>
                <p></p>
                <p>5、验货签收</p>
                <p>签收时请注意：</p>
                <p>请您务必开箱验货，确认无误后再签收，如发现商品有破损、漏酒等情况请第一时间联系天酒商城网客服中心400 60 36519 或直接拒签。</p>
                <p></p>
            </div>
            <a name="2"></a><h3 class="con_til">购物保障</h3></a>
            <div class="help_del mart10">
                <p>天酒商城为您提供以下保障：</p>
                <p>1、商品保障：品牌授权，正品保障；</p>
                <p>2、物流保障：完美包装，快速配送；</p>
                <p>3、售后保障：价格保护，正规发票。</p>
                <p>【商品保障】</p>
                <p>1、品牌授权：</p>
                <p>天酒商城已得到品牌商的书面授权，授予天酒商城在www.36519.com上以网络销售的形式，销售品牌旗下正品酒的资格；</p>
                <p>2、正品保障：</p>
                <p>天酒商城所有商品均由品牌商或一级经销商供货，全部为行货正品，请您放心购买；</p>
                <p>3、收到商品可先验货：</p>
                <p>（货到付款订单）您可以在收到商品时，先进行验货，如果不满意，您可以直接将商品拒收，不用支付任何费用。</p>
                <p>【物流保障】</p>
                <p>完美的包装，保护您尊贵的酒品；</p>
                <p>【售后保障】</p>
                <p>客服随行：</p>
                <p>专业的客户服务人员，将为您排忧解难，客服热线：400 60 36519</p>
                <p>正规发票：</p>
                <p>天酒商城为您提供正规的机打发票，请您在下订单时选择并填写相关内容。</p>
            </div>
            <a name="3"></a><h3 class="con_til">发票说明</h3></a>
            <div class="help_del mart10">
                <p>开具发票注意事项</p>
                <p>1.通过天酒商城网站（www.36519.com)或是天酒商城客服中心电话订购商品，您可选择开具发票，一个订单对应一张发票，发票将随同商品一起寄到；如果发票寄送地址和收货地址不一致，天酒商城将提供一次免费寄送发票的服务；</p>
                <p>2.天酒商城提供的发票为酒类专用发票，此发票可用作单位报销使用；</p>
                <p>3.配送费金额包含在订单发票金额中；</p>
                <p>4.发票金额不能高于订单金额；</p>
                <p>5.使用红包、礼品卡、返现金额等支付的部分，不再开具发票；</p>
                <p>6.发票抬头:您可写个人或公司名称</p>
                <p>7.发票内容：酒水或明细。(天酒商城只可开具内容为酒类的专用发票)</p>
                <p>8.您订货后若不需要开具发票，我们将随商品为您开具“天酒商城发货单”以使您的售后服务得以保障；</p>
                <p>9.开具发票后，若有退换货发生，则需将发票随商品一起退回；</p>
                <p>10.补开、更换发票</p>
                <p>(1)补开发票以当月订单为准，即只可补开当月发票；</p>
                <p>(2)更换发票需提供“天酒商城发货单”或详细的订购信息；</p>
                <p>(3)请您提供正确的发票收件地址，我们会在补开发票后以快递的方式为您寄出，请您注意查收；</p>
                <p>(4)若因客户个人原因导致更换或补开发票，需由客户承担发票快递费用；</p>
                <p>(5)因发票抬头、内容或金额等情形需更换发票时，请您与天酒商城客服中心联系确认后，将原发票退回天酒商城后方予以重开。</p>
                <p></p>
                <p>您可将发票寄至以下地址：</p>
                <p>地址：贵州省仁怀市双馨花园E栋3-3</p>
                <p>收件人：春秋酒业</p>
                <p>电话：0852-2313159</p>
                <p>邮编：564500</p>
            </div>
        </div>
    </div><!-- end content -->
    <c:import url="../footer.jsp" charEncoding="utf-8"/>
</div>
</body>
</html>