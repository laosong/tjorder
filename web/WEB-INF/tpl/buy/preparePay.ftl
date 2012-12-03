<#-- @ftlvariable name="order" type="com.brains.prj.tianjiu.order.domain.Order" -->
<@override name="title">支付订单_<@super/></@override>
<@override name="head_css">
<style type="text/css">
</style>
</@override>
<@override name="body_content">
<div id="content">
    <div class="shopcarbread eb_step3 ebBg fb">
        <span>1.我的购物车</span><span>2.填写核对订单信息</span><span class="stepCur">3.支付订单</span><span>4.完成</span>
    </div>
    <div class="ebCon_wrap mart10">
        <div class="ebCon">
            <div class="payOrder_succeed">
                <dl class="ebBg">
                    <dt>订单提交成功，请您尽快付款！</dt>
                    <dd>订单号：${order.getOrderCd()}
                        <span>|</span>应付金额：<em class="succeed_price f14px fb fred">${order.getSumPrice()?string.currency}</em>
                    </dd>
                </dl>
            </div>
            <p class="mart20">
                <span class="f16px fb">立即支付<em class="succeed_price fred">${order.getSumPrice()?string.currency}</em>，即可完成订单。</span>请您在<span class="fred fb">24小时</span>内完成支付，否则订单会被自动取消。
                <a href="javascript:void(0);" class="btnCom btnCom_reb" id="gotoAlipayBtn"><span>去支付宝支付</span></a>
            </p>
        </div>
        <span class="sFillet ht5 ebBg ebFillet990_b"></span>
    </div>
</div>
</@override>
<@override name="body_footerjs">
<form name="gotoAlipayForm" id="gotoAlipayForm" method="POST" action="/orderAction/alipaySubmit">
    <input type="hidden" name="orderCd" value="${order.getOrderCd()}">
</form>
<script type="text/javascript">
    $(function () {
        $("#gotoAlipayBtn").click(function (event) {
            $("#gotoAlipayForm").submit();
        })
    });
</script>
</@override>
<@extends name="buybase.ftl"/>