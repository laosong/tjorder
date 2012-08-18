<#-- @ftlvariable name="page_name" type="String" -->
<#macro my_nav nav_name="allorders">
<div class="per_nav">
    <dl>
        <dt>订单中心</dt>
        <dd <#if nav_name=="allorders">class="curNav"</#if>><a href="/orderAction/myOrders">所有订单</a></dd>
        <dd <#if nav_name=="uncomporders">class="curNav"</#if>><a href="/orderAction/myUnCompleteOrders">未完成订单</a></dd>
        <dd <#if nav_name=="comporders">class="curNav"</#if>><a href="/orderAction/myCompleteOrders">已结束订单</a></dd>
        <dd><a href="/home/user/comments.htm">我的评论</a></dd>
        <dd><a href="/home/user/favor.htm">我的藏酒阁</a></dd>
    </dl>
    <dl>
        <dt>账户中心</dt>
        <dd><a href="/home/user/info.htm">个人资料</a></dd>
        <dd><a href="/home/user/ch-pwd.htm">密码修改</a></dd>
        <dd><a href="/orderAction/myAddress">地址管理</a></dd>
    </dl>
</div>
</#macro>
<#macro order_status os=0>
    <#if os==0>刚创建
    <#elseif os==1>已提交
    <#elseif os==2>已付款
    <#elseif os==3>已发货
    <#elseif os==4>已完成
    <#elseif os==5>已取消
    </#if>
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
<@extends name="../base.ftl"/>