<#-- @ftlvariable name="cartEmptyException" type="com.brains.prj.tianjiu.order.service.CartEmptyException" -->
<#-- @ftlvariable name="goodsStateException" type="com.brains.prj.tianjiu.order.service.GoodsStateException" -->
<#-- @ftlvariable name="evaGoodsBuyException" type="com.brains.prj.tianjiu.order.service.EvaGoodsBuyException" -->
<@override name="title">转结算出错_<@super/></@override>
<@override name="body_cart">
    <#if cartEmptyException??>
    <div class="infoTip">
        <p>购物车是空的，请先去挑选一些商品</p>
    </div>
    </#if>
    <#if goodsStateException??>
    <div class="infoTip">
        <p>${goodsStateException.getGoodsItem().getName()}可能已经下架，不能再购买了</p>
    </div>
    </#if>
    <#if evaGoodsBuyException??>
    <div class="infoTip">
        <#if (evaGoodsBuyException.getEvaOrders().size()>0)>
            <p>您
                <#list evaGoodsBuyException.getEvaOrders() as evaOrder>
                ${evaOrder.getCreatedDate()?datetime}的订单${evaOrder.getOrderCd()}
                </#list>已经够过买过品鉴商品，您本次不能购买任何品鉴商品
            </p>
        </#if>
        <#if (evaGoodsBuyException.getEvaItems().size()>0)>
            <p>您购物车含
                <#list evaGoodsBuyException.getEvaItems() as evaItem>
                ${evaItem.getName()}
                </#list>等品鉴商品，品鉴商品一个月只能购买一件
            </p>
        </#if>
    </div>
    </#if>
</@override>
<@extends name="showcartbase.ftl"/>