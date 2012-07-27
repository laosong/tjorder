<#-- @ftlvariable name="orders" type="java.util.Collection<com.brains.prj.tianjiu.order.domain.Order>" -->
<#assign page_name = "complete_orders">

<@override name="title"><@super/>我的订单</@override>
<@override name="head_css">
<style type="text/css">
</style>
</@override>
<@override name="my_body_content">
<h1>已结束订单</h1>
<table cellpadding="0" cellspacing="0" border="0" class="display" id="dt_1">
    <thead>
    <tr>
        <th width="5%"></th>
        <th width="15%">订单编号</th>
        <th width="15%">下单日期</th>
        <th width="35%">商品名称</th>
        <th width="15%">总价</th>
        <th width="10%">状态</th>
    </tr>
    </thead>
    <tbody>
        <#list orders as order>
        <tr>
            <td>${order_index+1}</td>
            <td>${order.getId()}</td>
            <td>2012/09/01</td>
            <td>
                <#list order.getOrderItems() as order_item>
                    <img src="/upload/${order_item.getProductItem().getImg()!("")}"" width="60" height="60" border="0"
                    align="middle"/>${order_item.getProductItem().getName()}<br/>
                </#list>
            </td>
            <td>${order.getSumPrice()}</td>
            <td>${order.getState()}</td>
        </tr>
        </#list>
    </tbody>
</table>
</@override>
<@override name="body_footerjs">
<script type="text/javascript">
    $(function () {
        oTable = $('#dt_1').dataTable({
            "bJQueryUI":true, "bPaginate":false,
            "oLanguage":{ "sInfo":"本页共 _TOTAL_ 条", "sInfoEmpty":"本页共  0 条", "sZeroRecords":"未找到匹配记录", "sSearch":"搜索:"}
        });
    });
</script>
</@override>
<@extends name="mybase.ftl"/>