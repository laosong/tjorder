<#-- @ftlvariable name="cartEmptyException" type="com.brains.prj.tianjiu.order.service.CartEmptyException" -->
<#-- @ftlvariable name="goodsStateException" type="com.brains.prj.tianjiu.order.service.GoodsStateException" -->
<#-- @ftlvariable name="evaGoodsBuyException" type="com.brains.prj.tianjiu.order.service.EvaGoodsBuyException" -->
<@override name="title">转结算出错_<@super/></@override>
<@block name="body_cart">
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
        <#assign evaOrders = evaGoodsBuyException.getEvaOrders()>
        <#assign evaItems = evaGoodsBuyException.getEvaItems()>
        <#if (evaOrders?size>0)>
            <p>
                您<#list evaOrders as evaOrder>${evaOrder.getCreatedDate()?datetime}的订单${evaOrder.getOrderCd()}</#list>已经够过买过品鉴商品，您本次不能购买任何品鉴商品
            </p>
        <#elseif (evaItems?size>0)>
            <p>
                您购物车含<#list evaItems as evaItem>${evaItem.getName()}</#list>等品鉴商品，品鉴商品一个月只能购买一件
            </p>
        </#if>
    </div>
    </#if>
</@block>