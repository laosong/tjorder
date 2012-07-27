<#-- @ftlvariable name="page_name" type="String" -->
<#macro my_nav nav_name="allorders">
<div class="menu_side float_l">
    <ul class="menu">
        <li>
            <a href="/orderAction/showMyOrders" <#if nav_name=="allorders">class="highlight"</#if>>所有订单</a>
        </li>
        <li>
            <a href="/orderAction/showMyCompleteOrders" <#if nav_name=="complete_orders">class="highlight"</#if>>已结束订单</a>
        </li>
        <li><a href="">我的收藏</a></li>
        <li><a href="">我的评论</a></li>
        <li><a href="">修改密码</a></li>
    </ul>
</div>
</#macro>

<@override name="title"><@super/>用户中心-</@override>
<@override name="head_css">
<style type="text/css">
</style>
</@override>
<@override name="body_content">
<div class="home_body">
    <div class="space clear"></div>
    <div class="space clear"></div>
    <@my_nav page_name/>
    <div class="menu_main float_r">
        <@block name="my_body_content"></@block>
    </div>
</div>
</@override>
<@extends name="base.ftl"/>