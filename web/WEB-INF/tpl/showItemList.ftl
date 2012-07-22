<#-- @ftlvariable name="productItems" type="java.util.Collection<com.brains.prj.tianjiu.order.domain.ProductItem>" -->
<@override name="title"><@super/>产品列表</@override>
<@override name="head_css">
<style type="text/css">
    #cartWrapper {
        position: absolute;
        right: 10px;
        width: 205px;
    }

    #scrollCart {
        top: 0;
        width: 205px;
        height: 29px;
        background: url("/images/bg_spirit.png") no-repeat scroll -774px -56px transparent;
    }

    #scrollCart.fixed {
        position: fixed;
        top: 0;
    }

    #scrollCart #miniCart {
        cursor: pointer;
        height: 21px;
        padding: 7px 0 0 30px;
        width: 112px;
        float: left;
    }
</style>
</@override>
<@override name="body_content">
<div class="home_body">
    <div class="space clear"></div>
    <div id="cartWrapper">
        <div id="scrollCart">
            <div id="miniCart"><span>购物车：<strong class="cartItemSum">0</strong>件</span></div>
            <a href="/orderAction/showCart"><span>去结算</span></a>
        </div>
    </div>
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
                    <td align="center"><a href="/orderAction/addCartItem?itemId=${productItem.getId()}&itemCount=1">加入购物车</a>
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
        var top = $('#scrollCart').offset().top - parseFloat($('#scrollCart').css('marginTop').replace(/auto/, 0));
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