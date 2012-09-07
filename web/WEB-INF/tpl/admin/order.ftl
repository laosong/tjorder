<#-- @ftlvariable name="order" type="com.brains.prj.tianjiu.order.domain.Order" -->
<#assign page_name = "allorders">

<@override name="head_css">
</@override>
<@override name="admin_body_content">
<h1>订单详细情况</h1>
<div style="margin-bottom: 20px;">
    <span>订单编号:${order.getOrderCd()}</span>
    <span style="margin-left: 50px;">订购日期:${order.getCreatedDate()?datetime}</span>
    <span style="margin-left: 50px;">当前状态:<@OrderStateString order.getState()/></span>
    <span style="margin-left: 50px;">金额:${order.getSumPrice()?string.currency}</span>
</div>
<table cellpadding="0" cellspacing="0" border="0" class="display" id="orderItemTable">
    <thead>
    <tr>
        <th></th>
        <th>商品编号</th>
        <th>商品信息</th>
        <th>单价</th>
        <th>数量</th>
    </tr>
    </thead>
    <tbody>
        <#list order.getOrderItems() as orderItem>
            <#assign goodsItem = orderItem.getGoodsItem()>
        <tr>
            <td>${orderItem_index+1}</td>
            <td>${goodsItem.getId()}</td>
            <td>${goodsItem.getName()}</td>
            <td>${orderItem.getPrice()}</td>
            <td>${orderItem.getQuantity()}</td>
        </tr>
        </#list>
    </tbody>
</table>
<div style="margin-top: 20px; margin-left: 100px; margin-bottom: 20px;">
    <button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary" style="font-size:9pt;">
        <span class="ui-button-icon-primary ui-icon ui-icon-scissors"></span><span class="ui-button-text">发货</span>
    </button>
    <button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary" style="font-size:9pt;">
        <span class="ui-button-icon-primary ui-icon ui-icon-scissors"></span><span class="ui-button-text">完成</span>
    </button>
</div>
<h1>订单处理细节</h1>
<ul>
    <li>${order.getCreatedDate()?datetime} 用户提交订单</li>
</ul>
</@override>
<@override name="body_footerjs">

    <@super/>
<script type="text/javascript">
    $(function () {
        $('#orderItemTable').dataTable({
            "bJQueryUI":true,
            "bPaginate":false,
            "oLanguage":{ "sInfo":"共 _TOTAL_ 条", "sInfoEmpty":"本页共  0 条", "sZeroRecords":"", "sSearch":"过滤:"}
        });
    });
</script>
</@override>
<@extends name="orderadminbase.ftl"/>