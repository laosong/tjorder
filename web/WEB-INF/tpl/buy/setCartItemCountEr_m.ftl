<#-- @ftlvariable name="badParameterException" type="com.brains.prj.tianjiu.order.common.BadParameterException" -->
<#-- @ftlvariable name="badBuyCountException" type="com.brains.prj.tianjiu.order.service.BadBuyCountException" -->
<#-- @ftlvariable name="goodsNotFoundException" type="com.brains.prj.tianjiu.order.service.GoodsNotFoundException" -->
<#-- @ftlvariable name="goodsStateException" type="com.brains.prj.tianjiu.order.service.GoodsStateException" -->
<#-- @ftlvariable name="evaGoodsBuyException" type="com.brains.prj.tianjiu.order.service.EvaGoodsBuyException" -->
<#-- @ftlvariable name="evaGoodBuyCountException" type="com.brains.prj.tianjiu.order.service.EvaGoodBuyCountException" -->
<#-- @ftlvariable name="cartItemNotFoundException" type="com.brains.prj.tianjiu.order.service.CartItemNotFoundException" -->
<@override name="title">设置购物车出错_<@super/></@override>
<@block name="body_cart">
    <#if badParameterException??>
    <div class="infoTip">
        <p>${badParameterException.getMessage()}</p>
    </div>
    </#if>
    <#if badBuyCountException??>
    <div class="infoTip">
        <p>一次购买的单个产品数量必须在${badBuyCountException.getMinCount()?c}与${badBuyCountException.getMaxCount()?c}之间</p>
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
    <#if evaGoodsBuyException??>
    <div class="infoTip">
        <p>品鉴商品</p>
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
</@block>