<#-- @ftlvariable name="provinces" type="java.util.Collection<java.lang.String>" -->
<#-- @ftlvariable name="userAddresses" type="java.util.Collection<com.brains.prj.tianjiu.order.domain.UserAddress>" -->
<#assign page_name = "address">

<@override name="title">地址管理_<@super/></@override>
<@override name="head_css">
<style type="text/css">
</style>
</@override>
<@override name="include_js">
    <@super/>
<script type="text/javascript" src="/js/laosong_city.js"></script>
</@override>
<@override name="my_body_content">
<h3 class="con_til">地址管理</h3>
<div class="personal_del mart10">
    <div class="usedAddress" id="userAddress">
        <p class="fb">常用地址</p>
        <#list userAddresses as address>
        <table summary="常用收货人信息">
        <tbody>
        <tr>
            <td width="3%">
            </td>
            <td width="15%">收货人：${address.getRecvName()!("")?html}</td>
            <td>地址：${address.getCityInfo()!("")?html}${address.getAddress()!("")?html}</td>
            <td width="25%">联系电话：${address.getRecvPhone()!("")?html}</td>
            <td width="15%">
                <a href="javascript:void(0);" name="modAddress">修改<input type="hidden" name="addressId" value="${address.getId()}"></a>
                <a href="javascript:void(0);" name="delAddress">删除<input type="hidden" name="addressId" value="${address.getId()}"></a>
            </td>
        </tr>
        </#list>
    </tbody>
    </table>
    </div>
    <@block name="address_form">
    </@block>
</div>
</@override>
<@override name="body_footerjs">
    <@super/>
<div id="provinces" style="display: none;">
    <#list provinces as province>
        <option value="${province?html}">${province?html}</option>
    </#list>
</div>
<script type="text/javascript">
    $(function () {
        $("#userAddress a[name=modAddress]").click(function () {
            var addressId = $(this).find("input[name=addressId]").val();
            window.location.href = "/orderAction/myAddressMod?addressId=" + addressId;
        });

        $("#userAddress a[name=delAddress]").click(function () {
            var addressId = $(this).find("input[name=addressId]").val();
            $.callOrderAction("POST", "/orderAction/delUserAddress", {addressId:addressId},
                    function (data) {
                        window.location.href = "/orderAction/myAddress";
                    }
            );
        });
    });
</script>
</@override>
<@extends name="mybase.ftl"/>