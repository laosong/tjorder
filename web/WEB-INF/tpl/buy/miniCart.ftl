<#-- @ftlvariable name="cart" type="com.brains.prj.tianjiu.order.domain.ShoppingCart" -->
<div id="scrollCart">
    <ul class="clearfix">
        <li class="t_cart_num">
        <#if cart??>
            <a href="/orderAction/showCart">购物车<span class="cartCount">${cart.getItemSum()?c}</span>件</a>
        <#else>
            <#assign toUrl="/orderAction/showCart">
            <a href="/home/user/login.htm?toUrl=${toUrl?url("utf-8")}">购物车未登录</a>
        </#if>
        </li>
        <li class="t_cart_pay link_white fb">
            <a href="/orderAction/submitCart" target="_blank">去结算</a>
        </li>
    </ul>
</div>