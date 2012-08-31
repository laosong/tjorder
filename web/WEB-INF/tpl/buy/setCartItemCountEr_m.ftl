<#-- @ftlvariable name="badParameterException" type="com.brains.prj.tianjiu.order.common.BadParameterException" -->
<#-- @ftlvariable name="badBuyCountException" type="com.brains.prj.tianjiu.order.service.BadBuyCountException" -->
<#-- @ftlvariable name="goodsNotFoundException" type="com.brains.prj.tianjiu.order.service.GoodsNotFoundException" -->
<#-- @ftlvariable name="goodsStateException" type="com.brains.prj.tianjiu.order.service.GoodsStateException" -->
<#-- @ftlvariable name="evaGoodsBuyException" type="com.brains.prj.tianjiu.order.service.EvaGoodsBuyException" -->
<#-- @ftlvariable name="evaGoodBuyCountException" type="com.brains.prj.tianjiu.order.service.EvaGoodBuyCountException" -->
<#-- @ftlvariable name="cartItemNotFoundException" type="com.brains.prj.tianjiu.order.service.CartItemNotFoundException" -->
<#if badParameterException??>
${badParameterException.getMessage()}\r\n
</#if>
<#if badBuyCountException??>
一次购买的单个产品数量必须在${badBuyCountException.getMinCount()?c}与${badBuyCountException.getMaxCount()?c}之间\r\n
</#if>
<#if goodsNotFoundException??>
没有找到编号为${goodsNotFoundException.getGoodsId()}的商品\r\n
</#if>
<#if goodsStateException??>
${goodsStateException.getGoodsItem().getName()}可能已经下架，不能再购买了\r\n
</#if>
<#if evaGoodsBuyException??>
品鉴商品\r\n
</#if>
<#if evaGoodBuyCountException??>
品鉴商品每月限购${evaGoodBuyCountException.getBuyMax()?c}件\r\n
</#if>
<#if cartItemNotFoundException??>
没有找到此商品\r\n
</#if>