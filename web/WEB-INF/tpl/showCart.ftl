<#assign cartItems = cart.getCartItems()>
<@override name="title"><@super/>购物车</@override>
<@override name="body_content">
<div class="home_body">
    <div class="space clear"></div>
    <div class="space clear"></div>

    <div class="centered" style="width: 900px; height:50px;" align="center">
        <img src="/images/progress_bar_1.png" alt=""></div>
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
            <#list cartItems as cartItem>
                <#assign productItem = cartItem.getProductItem()>
                <tr <#if cartItem_index%2==0> class="row_odd"</#if>>
                    <td align="center">${cartItem_index+1} - ${productItem.getId()}</td>
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
                    <td align="center"><a href="#">删除</a></td>
                </tr>
            </#list>
            <tr class="row_end">
                <td colspan="5" align="right">共计 ${cart.getItemSum()} 件商品 ${cart.getTotalPrice()} 元</td>
            </tr>
        </table>
    </div>
    <div class="centered" align="center">
        <table width="99%" border="0" cellspacing="2" cellpadding="2">
            <tr>
                <td height="10">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td width="25%" align="left">
                    <button id="shopping" style="font-size: 12pt;">继续购物</button>
                </td>
                <td width="50%" align="center">&nbsp;</td>
                <td width="25%" align="right">
                    <button id="order" style="font-size: 12pt;">去结账</button>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
</div>
</@override>
<@override name="body_footerjs">
<script type="text/javascript">
    $(function () {
        $("#shopping").button({ icons:{ primary:"ui-icon-triangle-1-w"}  });
        $("#order").button({ icons:{ primary:"ui-icon-script"}  });

        $("#shopping").click(function () {
            return false;
        });
        $("#order").click(function () {
            return false;
        });
    });
</script>
</@override>
<@extends name="base.ftl"/>