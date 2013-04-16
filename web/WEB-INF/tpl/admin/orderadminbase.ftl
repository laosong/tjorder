<#-- @ftlvariable name="page_name" type="String" -->
<#macro orderadmin_nav nav_name="allorders">
<div id="side">
    <ul id="menu">
        <li><a href="/orderAction/adminOrders"<#if nav_name=="orderstodeal">class="highlight"</#if>>未完成订单</a></li>
        <li><a href="/orderAction/adminOrdersList"<#if nav_name=="allorders">class="highlight"</#if>>所有订单</a></li>
        <li><a href="javascript:void(0);">支付方式</a></li>
        <li><a href="javascript:void(0);">快递方式</a></li>
    </ul>
</div>
</#macro>
<#macro OrderStateString os=0>
    <#if os==0>刚创建
    <#elseif os==1>已提交
    <#elseif os==2>已付款
    <#elseif os==3>已发货
    <#elseif os==4>已完成
    <#elseif os==5>已取消
    </#if>
</#macro>
<#macro OrderPayString os=0>
    <#if os==2>已支付
    <#else>未支付
    </#if>
</#macro>
<@override name="body_content">
<div id="bottom-main">
    <@orderadmin_nav page_name/>
    <div id="content" style="overflow: hidden;">
        <@block name="admin_body_content"></@block>
    </div>
</div>
</@override>

<@override name="body_footerjs">
<script type="text/javascript">
    $(function () {
        $("#top-nav-tabs").tabs(
                {
                    select:function (event, ui) {
                        var url = window.location.href;
                        switch (ui.index) {
                            case 0:
                                url = "/admin/commodity/ad-list.htm";
                                break;
                            case 1:
                                url = "/admin/usr/admin-list.htm";
                                break;
                            case 2:
                                url = "/orderAction/adminOrders";
                                break;
                        }
                        window.location.href = url;
                        return false;
                    },
                    selected:2
                }
        );
    });
</script>
</@override>
<@extends name="adminbase.ftl"/>