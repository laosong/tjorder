<#-- @ftlvariable name="checkAddress" type="java.lang.Integer" -->
<#-- @ftlvariable name="userAddresses" type="java.util.Collection<com.brains.prj.tianjiu.order.domain.UserAddress>" -->
<p class="fb">常用地址</p>
<table summary="常用收货人信息">
<#list userAddresses as address>
    <tr>
        <td width="3%">
            <input type="radio" name="orderPost" value="${address.getId()}" <#if address.getId() == checkAddress> checked="checked" </#if>>
        </td>
        <td width="15%">收货人：${address.getRecvName()?html}</td>
        <td>地址：${address.getCityInfo()!("")?html}${address.getAddress()?html}</td>
        <td width="25%">联系电话：${address.getRecvPhone()?html}</td>
        <td width="10%">
            <a href="javascript:void(0);" name="delAddress">删除<input type="hidden" name="addressId" value="${address.getId()}"></a>
        </td>
    </tr>
</#list>
</table>