<#-- @ftlvariable name="product_img_root" type="java.lang.String" -->
<#-- @ftlvariable name="goodsItems" type="java.util.Collection<com.brains.prj.tianjiu.order.domain.GoodsItem>" -->
<@override name="title">产品列表_<@super/></@override>
<@override name="head_css">
<style type="text/css">
    #scrollCart.fixed {
        position: fixed;
        top: 0;
        right: 10px;
    }
</style>
</@override>
<@override name="body_content">
<div class="home_body">
    <div class="cart_list_block centered" align="center">
        <table width="100%" border="0" cellspacing="2" cellpadding="4" bgcolor="#fefefe">
            <tr class="cart_list_header">
                <td width="15%" align="center"> 编号</td>
                <td width="45%" align="center"> 商品名称</td>
                <td width="12%" align="center">价格</td>
                <td width="20%" align="center"> 商品数量</td>
                <td width="10%" align="center">操作</td>
            </tr>
            <#list goodsItems as goodsItem>
                <tr <#if goodsItem_index%2==0> class="row_odd"</#if>>
                    <td align="center">${goodsItem_index+1} - ${goodsItem.getId()}</td>
                    <td>
                        <a href="#">
                            <img src="${product_img_root}${goodsItem.getImg()}" border="0" width="100" height="100" align="middle"/>
                        </a> &nbsp;&nbsp;<a href="#">${goodsItem.getName()?html}</a>
                    </td>
                    <td align="right"><span><STRONG>${goodsItem.getPrice()?string.currency}</STRONG></span></td>
                    <td align="center">
                        <input type="text" name="quantityInput" size="5" value="1">
                    </td>
                    <td align="center">
                        <a href="/orderAction/addCartItem?itemId=${goodsItem.getId()}&itemCount=1">加入购物车</a>
                    </td>
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
        //var top = $('#scrollCart').offset().top - parseFloat($('#scrollCart').css('marginTop').replace(/auto/, 0));
        var top = 150;
        $(window).scroll(function (event) {
            // what the y position of the scroll is
            var y = $(this).scrollTop();

            // whether that's below the form
            if (y >= top) {
                // if so, ad the fixed class
                $('#scrollCart').addClass('fixed');
            } else {
                // otherwise remove it
                $('#scrollCart').removeClass('fixed');
            }
        });
    });
</script>
</@override>
<@extends name="base.ftl"/>