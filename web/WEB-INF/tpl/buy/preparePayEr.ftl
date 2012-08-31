<#-- @ftlvariable name="badParameterException" type="com.brains.prj.tianjiu.order.common.BadParameterException" -->
<@override name="title">支付出错_<@super/></@override>
<@override name="body_payorder">
    <#if badParameterException??>
    <div class="infoTip">
        <p>${badParameterException.getMessage()}</p>
    </div>
    </#if>
</@override>
<@extends name="payorderbase.ftl"/>