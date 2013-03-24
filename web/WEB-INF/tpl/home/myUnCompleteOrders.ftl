<#-- @ftlvariable name="orders" type="java.util.Collection<com.brains.prj.tianjiu.order.domain.Order>" -->
<#assign page_name = "uncomporders">

<@override name="title">未结束订单_<@super/></@override>
<@override name="head_css">
<style type="text/css">
</style>
</@override>
<@override name="my_body_content">
<h3 class="con_til">未结束订单</h3>
<div class="personal_del tablestyle mart10">
    <table summary="所有订单" class="personal_order">
        <tbody>
        <tr>
            <th width="12%">订单编号</th>
            <th width="12%">更新日期</th>
            <th>订单商品</th>
            <th width="12%">订单金额</th>
            <th width="10%">状态</th>
            <th width="15%">操作</th>
        </tr>
            <#list orders as order>
            <tr>
                <td>${order.getOrderCd()}</td>
                <td class="f999">${order.getCreatedDate()?datetime}</td>
                <td class="t_l">
                    <#list order.getOrderItems() as order_item>
                        <a href="<@ProductUrl order_item.getGoodsItem().getId()/>" target="_blank" title="${order_item.getGoodsItem().getName()}">
                            <img src="${product_img_root}${order_item.getGoodsItem().getImg()!("")}" width="42" height="42" border="0" align="middle">
                        </a>
                    </#list>
                </td>
                <td>${order.getSumPrice()?string.currency}</td>
                <td class="f999"><@OrderStateString order.getState()/></td>
                <td class="o_l"><a href="#">继续订单</a><a href="#">删除</a></td>
            </tr>
            </#list>
        </tbody>
    </table>
</div>
</@override>
<@override name="body_footerjs">
</@override>
<@extends name="mybase.ftl"/>