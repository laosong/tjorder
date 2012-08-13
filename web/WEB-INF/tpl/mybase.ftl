<#-- @ftlvariable name="page_name" type="String" -->
<#macro my_nav nav_name="allorders">
<div class="per_nav">
    <dl>
        <dt>订单中心</dt>
        <dd <#if nav_name=="allorders">class="curNav"</#if>><a href="/orderAction/showMyOrders">所有订单</a></dd>
        <dd <#if nav_name=="uncomporders">class="curNav"</#if>><a href="/orderAction/showMyUnCompleteOrders">未完成订单</a>
        </dd>
        <dd <#if nav_name=="comporders">class="curNav"</#if>><a href="/orderAction/showMyCompleteOrders">已结束订单</a></dd>
        <dd><a href="/orderAction/showMyOrders">我的评论</a></dd>
        <dd><a href="/orderAction/showMyOrders">我的藏酒阁</a></dd>
    </dl>
    <dl>
        <dt>账户中心</dt>
        <dd><a href="/orderAction/showMyOrders">个人资料</a></dd>
        <dd><a href="/orderAction/showMyOrders">密码修改</a></dd>
        <dd><a href="/orderAction/showMyOrders">地址管理</a></dd>
    </dl>
</div>
</#macro>
<@override name="include_css">
    <@super/>
<link rel="stylesheet" type="text/css" href="/css/personal.css"/>
</@override>
<@override name="body_content">
<div id="content" class="clearfix mart10">
    <div class="sbar190 left">
        <div class="sbar_personal sbar190_cul cul_border">
            <h4 class="s190_til s190_per_til link_white fb"><a href="/orderAction/showMyHome">我的天酒商城</a></h4>
            <@my_nav page_name/>
        </div>
        <div class="sbar190_cul cul_border mart10">
            <h4 class="s190_til fb">客户服务</h4>
            <div class="per_service">
                <dl>
                    <dt>免费客服电话：</dt>
                    <dd>400 60 36519</dd>
                    <dt>QQ：</dt>
                    <dd>
                        <a href="tencent://message/?uin=12931293120&Site=www.jiandan100.cn&Menu=yes" target="_blank">12931293120</a>
                    </dd>
                    <dt>客服邮箱：</dt>
                    <dd><a href="mailto:service@36519.com">service@36519.com</a></dd>
                </dl>
            </div>
        </div>
    </div>
    <div class="personal_con m790 right">
        <@block name="my_body_content"></@block>
    </div>
</div>
</@override>
<@extends name="base.ftl"/>