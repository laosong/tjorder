<#-- @ftlvariable name="order" type="com.brains.prj.tianjiu.order.domain.Order" -->
<@override name="title">完成订单_<@super/></@override>
<@override name="head_css">
<style type="text/css">
</style>
</@override>
<@override name="body_content">
<div id="content">
    <div class="shopcarbread eb_step4 ebBg fb">
        <span>1.我的购物车</span><span>2.填写核对订单信息</span><span>3.支付订单</span><span class="stepCur">4.完成</span>
    </div>
    <div class="ebCon_wrap mart10">
        <span class="sFillet ht5 ebBg ebFillet990_t"></span>
        <div class="ebCon">
            <div class="orderFinish_wrap">
                <div class="orderFinish f14px">订单&nbsp;<span class="fred fb">${order.getOrderCd()}</span>&nbsp;已支付完成，您可以
                </div>
                <p class="orderFinish_skip">
                    <a href="/orderAction/myOrders">去我的订单</a><span style="width: 50px">或者</span><a href="/">去商城首页</a>
                </p>
            </div>
        </div>
        <span class="sFillet ht5 ebBg ebFillet990_b"></span>
    </div>
</div>
</@override>
<@override name="body_footerjs">
<script type="text/javascript">
    $(function () {
    });
</script>
</@override>
<@extends name="buybase.ftl"/>