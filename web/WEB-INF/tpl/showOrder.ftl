<#-- @ftlvariable name="order" type="com.brains.prj.tianjiu.order.domain.Order" -->
<@override name="title"><@super/>订单细节</@override>
<@override name="head_css">
<style type="text/css">
</style>
</@override>
<@override name="body_content">
<div class="home_body">
    <div class="space clear"></div>
    <div class="space clear"></div>

    <div class="order_block centered" align="center">
        <table width="95%" border="0" cellspacing="0" cellpadding="0" class="order_inner_block">
            <tbody>
            <tr bgcolor="#eeeeee">
                <td height="180" align="center" valign="top">
                    <table width="98%" border="0" cellspacing="4" cellpadding="4">
                        <tbody>
                        <tr>
                            <td height="50"><strong>商品清单</strong></td>
                        </tr>
                        <tr>
                            <td align="center">
                                <table width="80%" border="0" cellspacing="2" cellpadding="2">
                                    <tbody>
                                    <tr>
                                        <th height="25" align="center" bgcolor="#FF9900"><strong>商品编号</strong></th>
                                        <th align="center" bgcolor="#FF9900"><strong>商品名称</strong></th>
                                        <th align="center" bgcolor="#FF9900"><strong>数量</strong></th>
                                        <th align="center" bgcolor="#FF9900"><strong>价格</strong></th>
                                    </tr>
                                        <#assign orderItems = order.getOrderItems()>
                                        <#list orderItems as orderItem>
                                            <#assign productItem = orderItem.getProductItem()>
                                        <tr>
                                            <td>${orderItem.getItemId()}</td>
                                            <td><a class="list02" href="#">${productItem.getName()?html}</a></td>
                                            <td align="right">${orderItem.getQuantity()?c}</td>
                                            <td align="right">${productItem.getPrice()}</td>
                                        </tr>
                                        </#list>
                                    <tr>
                                        <td style="font-size:16pt; border-top: 2px double black;" height="35" colspan="4" align="right">
                                            共件商品，总价：${order.getSumPrice()}元&nbsp;
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            </tbody>
        </table>
        <div><span>支付方式：</span><span>${order.getPaymentInfo().getPayDesc()?html}</span></div>
        <div><span>快递方式：</span><span>${order.getDeliveryInfo().getDeliverDesc()?html}</span></div>
        <div><span>送货地址：</span><span>${order.getShippingInfo()!("")?html}</span></div>
    </div>

    <div class="space"></div>
    <div class="space"></div>
</div>
</@override>
<@override name="body_footerjs">
<script type="text/javascript">
    $(function () {
    });
</script>
</@override>
<@extends name="base.ftl"/>