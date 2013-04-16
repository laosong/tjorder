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
    <title>售后服务_天酒商城</title>
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
                        <dd><a href="/help/ship.htm#1">配送时间</a></dd>
                        <dd><a href="/help/ship.htm#2">配送费用</a></dd>
                        <dd><a href="/help/ship.htm#3">配送范围</a></dd>
                    </dl>
                    <dl>
                        <dt>售后服务</dt>
                        <dd><a href="#1">退换货政策</a></dd>
                        <dd><a href="#2">退换货流程</a></dd>
                    </dl>
                </div>
            </div>
        </div>
        <div class="help_con m790 right">
            <a name="1"></a><h3 class="con_til">退换货政策</h3></a>
            <div class="help_del mart10">
                <p class="fb">退换货承诺</p>
                <p>天酒商城承诺：自您签收商品之日起15日内，为您提供退换货服务！</p>
                <p></p>
                <p class="fb">退换货办理方式</p>
                <p>请拨打天酒商城客服中心电话400 60 36519，客服将为您办理。</p>
                <p></p>
                <p class="fb">退换货须知</p>
                <p>申请办理退换货业务时，客户或酒品需满足以下条款，天酒商城将为您提供退换货服务：</p>
                <p>1.客户签收时应当场开箱验货，核对酒品种类、数量、规格、赠品、金额是否与订单一致，确认无误签收后，非因酒品质量问题不予办理退换货业务。</p>
                <p>2.要求退换酒品需满足外包装完整、无污损。要求退换酒品无外包装时，需满足酒瓶未开启；酒品所附赠品和发票齐全且保存完好，批号相符，同时保留原始的物流包装，并完整填写退换货登记卡。</p>
                <p>3.客户办理退换货业务时，丢失所售酒品和赠品的，则需要按照天酒商城公布的价格进行赔偿；丢失发票的，不予办理退换货。</p>
                <p>4.客户所在地满足天酒商城配送条件时，将由配送人员上门服务，收回酒品、附属物品和退换货登记卡；若不满足，请客户与天酒商城客服人员沟通确认后，将酒品、附属物品和退换货登记卡一并邮寄返回天酒商城（地址：贵州省仁怀市双馨花园E栋3-3，收件人：春秋酒业，电话：0852-2313159， 邮编：564500），运费由天酒商城承担，但一个订单只可以免费享受退换货一次。</p>
            </div>
            <a name="2"></a><h3 class="con_til">退换货流程</h3></a>
            <div class="help_del mart10">
                <p class="fb">15天无理由退换</p>
                <p>凡本店购买的所有实物商品，无论何时，无论什么原因，15内想退就退。</p>
                <p class="fb">退换货条件</p>
                <p>如需退换货，请您及时与线客服取得联系，并仔细阅读我们的售后说明书，准确填写姓名、联系电话、订单号、退换货商品名称以及数量、退款账号、退货原因等。</p>
                <p>本店出售的产品不是因为质量缺陷造成的退换货，请确保产品包装完整，未被人为破损、污损、没有拆封。退货时请把所有相关附件（如防尘袋、包装塑料纸、销售单、已开发票等）一并寄回，以免补寄附件耽误您的宝贵时间。</p>
                <p class="fb txtcenter" style="color: red">不接收任何到付件或物流自提件！</p>
                <p class="fb">退换货处理时间</p>
                <p>我们实际收到用户寄回的商品后，将在48小时内办理退换货或者退款。请您耐心等待或与售后联系咨询处理进度。</p>
                <p class="fb">退换货邮费</p>
                <p>天酒7天无理由退换货协议，非商品质量缺陷的实物产品退货您只需承担回程物流快递运费即可，换货时需承担来回运费。不喜欢、不想要、想换一个别的款……您想退就退，我们支持无限期退换货售后服务，免去您的后顾之忧。虚拟产品（如包邮卡、礼品卡）、礼品不参与退换货。 已返现金的退换货，扣除已返现金金额再进行退换货最终结算。</p>
            </div>
        </div><!-- end content -->
    </div>
    <c:import url="../footer.jsp" charEncoding="utf-8"/>
</div>
</body>
</html>