<@override name="title">购物车_<@super/></@override>
<@override name="head_css">
<style type="text/css">
</style>
</@override>
<@override name="body_content">
<div id="content">
    <div class="shopcarbread eb_step1 ebBg fb">
        <span class="stepCur">1.我的购物车</span><span>2.填写核对订单信息</span><span>3.支付订单</span><span>4.完成</span>
    </div>
    <div class="ebCon_wrap mart10">
        <div class="ebCon">
            <h2 class="ecartTitle f14px fb">您的购物车中已有物品：</h2>

            <div id="cartData">
                <div class="cart-inner cart-loading">
                    <div class="loading-style1">加载中,请稍候...</div>
                </div>
            </div>

            <div class="eb_cart mart10">
                <ul class="ecart_pro payOrderBtn f14px fb mart20 clearfix">
                    <li class="left">
                        <a href="javascript:void(0);" id="shopping" class="btnCom btnCom_gray"><span>继续购物</span></a>
                    </li>
                    <li id="payMethod_enter" class="right">
                        <a href="javascript:void(0);" id="order" class="btnCom btnCom_reb"><span>去结算</span></a>
                    </li>
                </ul>
            </div>
        </div>
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
                    }
            );
        }

        function editNumChanged(itemRowObj) {
            var id = itemRowObj.find("input[name=id]").val();
            var itemId = itemRowObj.find("input[name=itemId]").val();
            var itemCount = itemRowObj.find("input[name=edit_num]").val();
            if (itemCount <= 0) {
                alert(getLocaleMessage("client.cart.InputGoodNum"));
                $.callOrderAction("POST", "/orderAction/showCartData", null,
                        function (data) {
                            updateCartData(data);
                        }
                );
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
                    }
            );
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
<@extends name="buybase.ftl"/>