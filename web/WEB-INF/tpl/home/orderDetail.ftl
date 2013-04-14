<#-- @ftlvariable name="order" type="com.brains.prj.tianjiu.order.domain.Order" -->
<#-- @ftlvariable name="orderStatuses" type="java.util.Collection<com.brains.prj.tianjiu.order.domain.OrderStatus>" -->
<#assign page_name = "order">

<@override name="title">订单详情_<@super/></@override>
<@override name="head_css">
<style type="text/css">
</style>
</@override>
<@override name="my_body_content">
<h3 class="con_til">订单详情</h3>
<div class="personal_del personal_del_order tablestyle mart10">
    <div class="personal_del_order_t f14px fb link_underl">
        <span>订单编号：${order.orderCd}</span><span>下单时间：${order.createdDate?datetime}</span><br/><span>当前状态：<strong><@OrderStateString order.state/></strong></span>
    </div>
    <dl>
        <dt>收货人信息</dt>
        <dd>收货人：${order.shippingInfo.recvName!("")?html}</dd>
        <dd>地址：${order.shippingInfo.getCityInfo()}</dd>
        <dd>联系电话：${order.shippingInfo.recvPhone!("")?html}</dd>
        <dd>邮编：${order.shippingInfo.zipCode!("")?html}</dd>
        <dd>电子邮件：${order.shippingInfo.recvEmail!("")?html}</dd>
    </dl>
    <dl>
        <dt>支付及配送方式</dt>
        <dd>支付方式：${order.paymentInfo.payDesc}</dd>
        <dd>运费：21.00元</dd>
        <dd>配送方式：${order.deliveryInfo.deliverDesc}</dd>
    </dl>
    <dl>
        <dt>商品清单</dt>
        <dd>
            <table summary="订单详情" class="personal_order">
                <tr>
                    <th width="12%">商品编号</th>
                    <th>商品名称</th>
                    <th width="12%">天酒价</th>
                    <th width="10%">商品数量</th>
                </tr>
                <#list order.getOrderItems() as orderItem>
                    <#assign goodsItem = orderItem.getGoodsItem()>
                    <tr>
                        <td>${goodsItem.getId()}</td>
                        <td class="t_l">
                            <a href="<@ProductUrl goodsItem.getId()/>" target="_blank" title="${goodsItem.getName()?html}">${goodsItem.getName()?html}</a>
                        </td>
                        <td>${orderItem.getPrice()}</td>
                        <td>${orderItem.getQuantity()}</td>
                    </tr>
                </#list>
            </table>
        </dd>
    </dl>
    <div class="personal_del_order_b">商品金额:${order.sumPrice}元 + 运费:0.00元 =
        <span class="fb">订单总金额：<strong class="fred">${order.sumPrice}</strong> 元</span>
    </div>
    <dl>
        <dt>处理详情</dt>
        <dd>
            <table summary="处理详情" class="personal_order">
                <tr>
                    <th width="12%">编号</th>
                    <th>内容</th>
                    <th width="22%">时间</th>
                </tr>
                <#list orderStatuses as orderStatus>
                    <tr>
                        <td></td>
                        <td class="t_l">${orderStatus.info?html}</td>
                        <td>${orderStatus.createTime?datetime}</td>
                    </tr>
                </#list>
            </table>
        </dd>
    </dl>
</div>
</@override>
<@override name="body_footerjs">
    <@super/>
</@override>
<@extends name="mybase.ftl"/>