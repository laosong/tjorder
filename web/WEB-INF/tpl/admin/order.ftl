<#-- @ftlvariable name="order" type="com.brains.prj.tianjiu.order.domain.Order" -->
<#-- @ftlvariable name="orderStatuses" type="java.util.Collection<com.brains.prj.tianjiu.order.domain.OrderStatus>" -->
<#assign page_name = "order">

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
<div style="margin-bottom: 20px;">
</div>
<div style="margin-bottom: 20px;">
    <span>支付方式:${order.paymentInfo.payDesc?html}</span>
    <span style="margin-left: 50px;">支付状态:<@OrderPayString order.getState()/></span>
    <span style="margin-left: 50px;">配送方式:${order.deliveryInfo.deliverDesc?html}</span>
</div>
<div style="margin-bottom: 10px;">
    <span>收货人姓名:${order.shippingInfo.recvName?html}</span>
    <span style="margin-left: 50px;">联系电话:${order.shippingInfo.recvPhone?html}</span>
    <span style="margin-left: 50px;">邮编:${order.shippingInfo.zipCode?html}</span>
</div>
<div style="margin-bottom: 20px;">
    <span>地址:${order.shippingInfo.province?html}${order.shippingInfo.city?html}${order.shippingInfo.country?html}${order.shippingInfo.address?html}</span>
</div>
<div>
    <form>
        <p><label for="nameInput">物流公司</label><input type="text" size="30" name="name" id="nameInput"></p>
        <p><label for="codeInput">物流单号</label><input type="text" size="30" name="name" id="codeInput"></p>
        <p><label for="infoInput">备注信息</label><textarea rows="3" cols="30" id="infoInput"></textarea></p>
    </form>
    <div style="margin-top: 20px; margin-left: 100px; margin-bottom: 20px;">
        <button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary" style="font-size:9pt;" id="addLogisticButton">
            <span class="ui-button-icon-primary ui-icon ui-icon-scissors"></span><span class="ui-button-text">发货</span>
        </button>
        <button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary" style="font-size:9pt;" id="markCancelButton">
            <span class="ui-button-icon-primary ui-icon ui-icon-scissors"></span><span class="ui-button-text">取消</span>
        </button>
        <button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary" style="font-size:9pt;" id="markCompButton">
            <span class="ui-button-icon-primary ui-icon ui-icon-scissors"></span><span class="ui-button-text">完成</span>
        </button>
    </div>
</div>
<h1>订单处理细节</h1>
<ul>
    <li>${order.getCreatedDate()?datetime} 用户提交订单</li>
    <#list orderStatuses as orderStatus>
        <li>${orderStatus.getCreateTime()?datetime} ${orderStatus.getOperator()} ${orderStatus.getInfo()}</li>
    </#list>
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

        $("#addLogisticButton").click(function () {
            var logisticParams = {};
            logisticParams["orderId"] = ${order.getId()};
            logisticParams["name"] = $("#nameInput").val();
            logisticParams["code"] = $("#codeInput").val();
            logisticParams["info"] = $("#infoInput").val();
            //alert(logisticParams);
            $.callOrderAction("POST", "/orderAction/adminAddOrderLogistic", logisticParams,
                    function (data) {
                        window.location.reload();
                    }
            );
        });

        $("#markCancelButton").click(function () {
            var params = {};
            params["orderId"] = ${order.getId()};
            $.callOrderAction("POST", "/orderAction/adminMarkOrderCancel", params,
                    function (data) {
                        window.location.reload();
                    }
            );
        });

        $("#markCompButton").click(function () {
            var params = {};
            params["orderId"] = ${order.getId()};
            $.callOrderAction("POST", "/orderAction/adminMarkOrderComp", params,
                    function (data) {
                        window.location.reload();
                    }
            );
        });
    });
</script>
</@override>
<@extends name="orderadminbase.ftl"/>