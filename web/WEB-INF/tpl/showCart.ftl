<@override name="title"><@super/>购物车</@override>
<@override name="head_css">
<style type="text/css">
</style>
</@override>
<@override name="body_content">
<div class="home_body">
    <div class="space clear"></div>
    <div class="space clear"></div>

    <div class="centered" style="width: 900px; height:50px;" align="center">
        <img src="/images/progress_bar_1.png" alt=""></div>
    <div class="space clear"></div>
    <div class="cart_list_block centered" align="center" id="cartData">
        <div class="cart-inner cart-loading">
            <div class="loading-style1"><b></b>加载中,请稍候...</div>
        </div>
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
<div id="cart-loading-dialog" class="dialog cart-tooltip" style="display:none; left:20px; width: 200px;">
    <div class="dialog-outer">
        <span class="dialog-bg dialog-bg-n"></span>
        <span class="dialog-bg dialog-bg-ne"></span>
        <span class="dialog-bg dialog-bg-e"></span>
        <span class="dialog-bg dialog-bg-se"></span>
        <span class="dialog-bg dialog-bg-s"></span>
        <span class="dialog-bg dialog-bg-sw"></span>
        <span class="dialog-bg dialog-bg-w"></span>
        <span class="dialog-bg dialog-bg-nw"></span>

        <div class="dialog-inner">
            <div class="loading-style1"><b></b>加载中,请稍候...</div>
        </div>
        <div class="dialog-bump"><span class="dialog-arrow"></span></div>
    </div>
</div>
<div id="cart-delete-dialog" class="dialog" style="display:none; left:20px; width: 252px;">
    <form method="POST" name="cart_delete_form">
        <input type="hidden" name="id"/>
        <input type="hidden" name="itemId"/>
    </form>

    <div class="dialog-outer">
        <span class="dialog-bg dialog-bg-n"></span>
        <span class="dialog-bg dialog-bg-ne"></span>
        <span class="dialog-bg dialog-bg-e"></span>
        <span class="dialog-bg dialog-bg-se"></span>
        <span class="dialog-bg dialog-bg-s"></span>
        <span class="dialog-bg dialog-bg-sw"></span>
        <span class="dialog-bg dialog-bg-w"></span>
        <span class="dialog-bg dialog-bg-nw"></span>

        <div class="dialog-inner">
            <div class="dialog-toolbar clearfix">
                <a title="关闭" href="javascript:void(0);" class="dialog-close">关闭</a>

                <h3 class="dialog-title">删除商品</h3>
            </div>
            <div class="dialog-content">
                <div class="cart-delete">确定从购物车中删除此商品？</div>
                <div class="btns clearfix">
                    <a class="btn btn-ok" href="javascript:void(0);"><span class="btn-text">确定</span></a>
                    <a class="btn btn-cancel" href="javascript:void(0);"><span class="btn-text">取消</span></a>

                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $("#shopping").button({ icons:{ primary:"ui-icon-triangle-1-w"}  });
        $("#order").button({ icons:{ primary:"ui-icon-script"}  });

        $("#shopping").click(function (event) {
            window.location.href = "/orderAction/showItemList";
        });
        $("#order").click(function (event) {
            window.location.href = "/orderAction/submitCart";
        });

        var cart_loading_dialog = $("#cart-loading-dialog");
        var cart_delete_dialog = $("#cart-delete-dialog");

        function popupLoadingDialog(itemRowObj) {
            var o = itemRowObj.find("input[name=edit_num]").offset();
            var t = o.top - 80;
            var l = o.left - cart_loading_dialog.width() / 2 + 18;
            cart_loading_dialog.css({
                "display":"block",
                "top":t,
                "left":l,
                "z-index":1000
            });
        }

        function closeLoadingDialog() {
            cart_loading_dialog.fadeOut();
        }

        function showDeleteConfirmDialog(itemRowObj) {
            var o = itemRowObj.find("a[name=delete_item]").offset();
            var t = o.top + 20;
            var l = o.left + 25 - cart_delete_dialog.width();
            cart_delete_dialog.css({
                "display":"block",
                "top":t,
                "left":l,
                "z-index":1000
            });
        }

        function closeDeleteConfirmDialog() {
            cart_delete_dialog.fadeOut();
        }

        var toDeleteRowObj = null;

        function updateCartData(result) {
            $("#cartData").html(result);
            $("#cartData tr.cart_row").each(function () {
                var itemRowObj = $(this);

                itemRowObj.find("a[name=decrease_num]").click(function (event) {
                    decreaseNumClicked(itemRowObj);
                });
                itemRowObj.find("a[name=increase_num]").click(function (event) {
                    increaseNumClicked(itemRowObj);
                });
                itemRowObj.find("input[name=edit_num]").change(function (event) {
                    editNumChanged(itemRowObj);
                    return false;
                })
                itemRowObj.find("a[name=delete_item]").click(function (event) {
                    event.preventDefault();
                    toDeleteRowObj = itemRowObj;
                    showDeleteConfirmDialog(itemRowObj);
                })
            });
        }

        function decreaseNumClicked(itemRowObj) {
            var id = itemRowObj.find("input[name=id]").val();
            var itemId = itemRowObj.find("input[name=itemId]").val();
            var num = itemRowObj.find("input[name=edit_num]").val();
            if (num < 2) {
                return;
            }
            popupLoadingDialog(itemRowObj);

            var req_data = {id:id, itemId:itemId};
            $.callOrderAction("POST", "/orderAction/decCartItem", req_data,
                    function (data) {
                        updateCartData(data);
                    }
            ).always(function () {
                        closeLoadingDialog();
                    });
        }

        function increaseNumClicked(itemRowObj) {
            var id = itemRowObj.find("input[name=id]").val();
            var itemId = itemRowObj.find("input[name=itemId]").val();
            var req_data = {id:id, itemId:itemId};

            popupLoadingDialog(itemRowObj);
            $.callOrderAction("POST", "/orderAction/incCartItem", req_data,
                    function (data) {
                        updateCartData(data);
                    }
            ).always(function () {
                        closeLoadingDialog();
                    });
        }

        function editNumChanged(itemRowObj) {
            var id = itemRowObj.find("input[name=id]").val();
            var itemId = itemRowObj.find("input[name=itemId]").val();
            var itemCount = itemRowObj.find("input[name=edit_num]").val();
            if (itemCount <= 0) {
                noty({text:"itemCount invalid.",
                            layout:"center",
                            type:"error",
                            animateOpen:{"height":"toggle"},
                            animateClose:{"height":"toggle"},
                            speed:500,
                            timeout:5000,
                            closeButton:true,
                            closeOnSelfClick:true,
                            closeOnSelfOver:false,
                            modal:false,
                            onClose:function () {
                                $.callOrderAction("POST", "/orderAction/showCartData", null,
                                        function (data) {
                                            updateCartData(data);
                                        });
                            }
                        }

                )
                ;
                return;
            }
            popupLoadingDialog(itemRowObj);

            var req_data = {id:id, itemId:itemId, itemCount:itemCount};
            $.callOrderAction("POST", "/orderAction/setCartItemCount", req_data,
                    function (data) {
                        updateCartData(data);
                    }
            ).always(function () {
                        closeLoadingDialog();
                    });
        }

        $.callOrderAction("POST", "/orderAction/showCartData", null,
                function (data) {
                    updateCartData(data);
                }
        );

        $("#cart-delete-dialog .dialog-close").click(function (event) {
            closeDeleteConfirmDialog();
        });
        $("#cart-delete-dialog .btn-ok").click(function (event) {
            closeDeleteConfirmDialog();
            if (toDeleteRowObj != null) {
                var itemRowObj = toDeleteRowObj;
                var id = itemRowObj.find("input[name=id]").val();
                var itemId = itemRowObj.find("input[name=itemId]").val();
                var req_data = {id:id, itemId:itemId};

                $.callOrderAction("POST", "/orderAction/delCartItem", req_data,
                        function (data) {
                            updateCartData(data);
                        }
                );
            }
        });
    });
</script>
</@override>
<@extends name="base.ftl"/>