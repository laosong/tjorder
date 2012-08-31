<@override name="head_css">
<style type="text/css">
</style>
</@override>
<@override name="body_content">
<div id="content">
    <div class="shopcarbread eb_step1 ebBg fb">
        <span class="stepCur">1.我的购物车</span><span>2.填写核对订单信息</span><span>3.支付订单</span><span>4.完成</span>
    </div>
    <div class="ebCon_wrap mart10">
        <div class="ebCon">
            <@block name="body_cart"></@block>
        </div>
        <span class="sFillet ht5 ebBg ebFillet990_b"></span>
    </div>
</div>
</@override>
<@override name="body_footerjs">
    <@super/>
<script type="text/javascript">
    $(function () {
    });
</script>
</@override>
<@extends name="buybase.ftl"/>