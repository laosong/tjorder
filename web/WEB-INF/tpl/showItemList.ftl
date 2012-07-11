<@override name="title"><@super/>产品列表</@override>
<@override name="body_content">
<div class="home_body">
    <div class="space clear"></div>
    <div class="space clear"></div>

    <div class="cart_list_block centered" align="center">
        <table width="100%" border="0" cellspacing="2" cellpadding="4" bgcolor="#fefefe">
            <tr class="cart_list_header">
                <td width="15%" align="center"> 编号</td>
                <td width="45%" align="center"> 商品名称</td>
                <td width="12%" align="center">价格</td>
                <td width="20%" align="center"> 商品数量</td>
                <td width="10%" align="center">操作</td>
            </tr>
            <#list productItems as productItem>
                <tr <#if productItem_index%2==0> class="row_odd"</#if>>
                    <td align="center">${productItem_index+1} - ${productItem.getId()}</td>
                    <td>
                        <a href="#">
                            <img src="/upload/${productItem.getImg()}" border="0" width="100" height="100" align="middle"/>
                        </a> &nbsp;&nbsp;<a href="#">${productItem.getName()?html}</a>
                    </td>
                    <td align="right"><span><STRONG>${productItem.getPrice()}</STRONG></span></td>
                    <td align="center">
                        <button id="minus-3" class="ui-button ui-widget ui-state-default">
                            <span class="ui-icon ui-icon-minus"></span></button>
                        <input name="num" type="text" id="num3" value="1" class="ui-widget"/>
                        <button id="plus-3" class="ui-button ui-widget ui-state-default">
                            <span class="ui-icon ui-icon-plus"></span></button>
                    </td>
                    <td align="center"><a href="#">加入购物车</a></td>
                </tr>
            </#list>
            <tr class="row_end">
            </tr>
        </table>
    </div>
</div>
</@override>
<@override name="body_footerjs">
<script type="text/javascript">
    $(function () {
    });
</script>
</@override>
<@extends name="base.ftl"/>