<#-- @ftlvariable name="orders" type="java.util.Collection<com.brains.prj.tianjiu.order.domain.Order>" -->
<#assign page_name = "orderstodeal">

<@override name="admin_body_content">
<h1>未完成订单</h1>
<table cellpadding="0" cellspacing="0" border="0" class="display" id="orderTable">
    <thead>
    <tr>
        <th></th>
        <th>订单号</th>
        <th>订购日期</th>
        <th>订单金额</th>
        <th>订单状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
        <#list orders as order>
        <tr style="height: 35px;">
            <td>${order_index+1}</td>
            <td>${order.getOrderCd()}</td>
            <td>${order.getCreatedDate()?datetime}</td>
            <td>${order.getSumPrice()?string.currency}</td>
            <td><@OrderStateString order.getState()/></td>
            <td><a href="/orderAction/adminOrder?orderId=${order.getId()?c}">查看详细</a></td>
        </tr>
        </#list>
    </tbody>
</table>
<div id="pager-bottom" class="pager-default"></div>
</@override>
<@override name="body_footerjs">
    <@super/>
<script type="text/javascript">
    $(function () {
        $('#orderTable').dataTable({
            "bJQueryUI":true,
            "bPaginate":false,
            "oLanguage":{ "sInfo":"本页共 _TOTAL_ 条", "sInfoEmpty":"本页共  0 条", "sZeroRecords":"未找到匹配记录", "sSearch":"过滤:"}
        });
    });
</script>
</@override>
<@extends name="orderadminbase.ftl"/>