<#-- @ftlvariable name="badParameterException" type="com.brains.prj.tianjiu.order.common.BadParameterException" -->
<#-- @ftlvariable name="badBuyCountException" type="com.brains.prj.tianjiu.order.service.BadBuyCountException" -->
<#-- @ftlvariable name="goodsNotFoundException" type="com.brains.prj.tianjiu.order.service.GoodsNotFoundException" -->
<#-- @ftlvariable name="goodsStateException" type="com.brains.prj.tianjiu.order.service.GoodsStateException" -->
<#-- @ftlvariable name="cartFullException" type="com.brains.prj.tianjiu.order.service.CartFullException" -->
<#-- @ftlvariable name="evaGoodsBuyException" type="com.brains.prj.tianjiu.order.service.EvaGoodsBuyException" -->
<#-- @ftlvariable name="evaGoodBuyCountException" type="com.brains.prj.tianjiu.order.service.EvaGoodBuyCountException" -->
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
<#if cartFullException??>
购物车最多只能放${cartFullException.getMaxItemCount()}个商品，现在已经满了\r\n
您需要删除其中的一些或者您可以先结算再购买此商品\r\n
</#if>
<#if evaGoodsBuyException??>
品鉴商品\r\n
</#if>
<#if evaGoodBuyCountException??>
品鉴商品每月限购${evaGoodBuyCountException.getBuyMax()?c}件\r\n
</#if>