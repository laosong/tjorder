<#-- @ftlvariable name="badParameterException" type="com.brains.prj.tianjiu.order.common.BadParameterException" -->
<#-- @ftlvariable name="goodsNotFoundException" type="com.brains.prj.tianjiu.order.service.GoodsNotFoundException" -->
<#-- @ftlvariable name="goodsStateException" type="com.brains.prj.tianjiu.order.service.GoodsStateException" -->
<#-- @ftlvariable name="evaGoodBuyCountException" type="com.brains.prj.tianjiu.order.service.EvaGoodBuyCountException" -->
<#-- @ftlvariable name="cartItemNotFoundException" type="com.brains.prj.tianjiu.order.service.CartItemNotFoundException" -->
<@override name="title">增加购物车出错_<@super/></@override>
<@override name="body_cart">
    <#if badParameterException??>
    <div class="infoTip">
        <p>${badParameterException.getMessage()}</p>
    </div>
    </#if>
    <#if goodsNotFoundException??>
    <div class="infoTip">
        <p>没有找到编号为${goodsNotFoundException.getGoodsId()}的商品</p>
    </div>
    </#if>
    <#if goodsStateException??>
    <div class="infoTip">
        <p>${goodsStateException.getGoodsItem().getName()}可能已经下架，不能再购买了</p>
    </div>
    </#if>
    <#if evaGoodBuyCountException??>
    <div class="infoTip">
        <p>品鉴商品每月限购${evaGoodBuyCountException.getBuyMax()?c}件</p>
    </div>
    </#if>
    <#if cartItemNotFoundException??>
    <div class="infoTip">
        <p>没有找到此商品</p>
    </div>
    </#if>
</@override>
<@extends name="showcartbase.ftl"/>