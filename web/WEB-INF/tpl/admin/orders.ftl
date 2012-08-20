<#-- @ftlvariable name="orders" type="java.util.Collection<com.brains.prj.tianjiu.order.domain.Order>" -->
<#assign page_name = "allorders">

<@override name="admin_body_content">
<table cellpadding="0" cellspacing="0" border="0" class="display" id="orderTable">
    <thead>
    <tr>
        <th></th>
        <th>订单号</th>
        <th>订购日期</th>
        <th>货品</th>
        <th>金额</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <#list orders as order>
        <tr>
            <td>${order_index+1}</td>
            <td>${order.getOrderCd()}</td>
            <td>${order.getCreatedDate()?datetime}</td>
            <td>
                <#list order.getOrderItems() as order_item>
                    <a href="#" target="_blank">${order_item.getGoodsItem().getName()}</a><br>
                </#list>
            </td>
            <td>${order.getSumPrice()?string.currency}</td>
            <td><@order_status order.getState()/></td>
            <td><a href="#">action</a></td>
        </tr>
    </#list>
    <tbody>
    </tbody>
</table>
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