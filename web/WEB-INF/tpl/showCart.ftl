<@override name="title"><@super/>购物车</@override>
<@override name="head_css">
<style type="text/css">
    @import "/css/home/laosong.css";
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

        var cart_loading_dialog = $("#cart-loading-dialog");
        var cart_delete_dialog = $("#cart-delete-dialog");

        function popupLoadingDialog(cart_row_obj) {
            var o = cart_row_obj.find("input[name=edit_num]").offset();
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
            $("#cart-loading-dialog").fadeOut();
        }

        function updateCartData(result) {
            closeLoadingDialog();

            $("#cartData").html(result);
            $("#cartData tr.cart_row").each(function () {
                var this_obj = $(this);

                var id = this_obj.find("input[name=id]").val();
                var itemId = this_obj.find("input[name=itemId]").val();

                this_obj.find("a[name=decrease_num]").click(function (event) {
                    popupLoadingDialog(this_obj);
                    decreaseNum(id, itemId);
                });
                this_obj.find("a[name=increase_num]").click(function (event) {
                    popupLoadingDialog(this_obj);
                    increaseNum(id, itemId);
                });
                this_obj.find("a[name=delete_item]").click(function (event) {
                    event.preventDefault();

                    cart_delete_dialog.find("input[name=id]").val(id);
                    cart_delete_dialog.find("input[name=itemId]").val(itemId);
                    var o = $(this).offset();
                    var t = o.top + $(this).outerHeight() + 3;
                    var l = o.left + $(this).width() - cart_delete_dialog.width();
                    cart_delete_dialog.css({
                        "display":"block",
                        "top":t,
                        "left":l,
                        "z-index":1000
                    });
                })
            });
        }

        function decreaseNum(id, itemId) {
            var req_data = {id:id, itemId:itemId};
            $.ajax({
                type:"POST",
                url:"/orderAction/decCartItem",
                data:req_data,
                success:function (result) {
                    updateCartData(result);
                }
            });
        }

        function increaseNum(id, itemId) {
            var req_data = {id:id, itemId:itemId};
            $.ajax({
                type:"POST",
                url:"/orderAction/incCartItem",
                data:req_data,
                success:function (result) {
                    updateCartData(result);
                }
            });
        }

        $.ajax({
            type:"POST",
            url:"/orderAction/showCartData",
            data:null,
            success:function (result) {
                updateCartData(result);
            }
        });

        $("#cart-delete-dialog .dialog-close").click(function (event) {
            $("#cart-delete-dialog").hide();
        });
        $("#cart-delete-dialog .btn-ok").click(function (event) {
            var cart_delete_form = cart_delete_dialog.find("form[name=cart_delete_form]")[0];
            cart_delete_form.action = "/orderAction/delCartItem";
            cart_delete_form.submit();
        });
    });
</script>
</@override>
<@extends name="base.ftl"/>