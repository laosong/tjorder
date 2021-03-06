<#-- @ftlvariable name="provinces" type="java.util.Collection<java.lang.String>" -->
<#-- @ftlvariable name="cart" type="com.brains.prj.tianjiu.order.domain.ShoppingCart" -->
<#-- @ftlvariable name="orderFee" type="com.brains.prj.tianjiu.order.domain.OrderFee" -->
<@override name="title">填写订单细节_<@super/></@override>
<@override name="head_css">
<style type="text/css">
</style>
</@override>
<@override name="include_js">
    <@super/>
<script type="text/javascript" src="/js/laosong_city.js"></script>
</@override>
<@override name="body_content">
<div id="content">
    <div class="shopcarbread eb_step2 ebBg fb">
        <span>1.我的购物车</span><span class="stepCur">2.填写核对订单信息</span><span>3.支付订单</span><span>4.完成</span>
    </div>
    <div class="ebCon_wrap mart10">
        <div class="ebCon">
            <h2 class="ecartTitle f14px fb">填写核对订单信息</h2>

            <form name="prepareOrderForm" id="prepareOrderForm">
                <div class="eb_checkOrder">
                    <div class="eb_checkOrder_cul">
                        <h3 class="f14px fb" id="addressH3">收货人信息<span class="yellow_block_tip" style="display: none;">请填写收货人信息</span>
                        </h3>
                        <div class="usedAddress" id="userAddress">
                        </div>
                        <div class="newAddress" id="newAddress">
                            <p class="fb">新建收货人</p>
                            <table summary="收货人信息">
                                <tr>
                                    <td class="t_r" width="13%"><span>*</span><label for="recvNameInput">收货人姓名：</label>
                                    </td>
                                    <td>
                                        <input type="text" size="20" name="recvName" id="recvNameInput">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="t_r"><span>*</span><label for="addressInput">地址：</label></td>
                                    <td>
                                        <div class="province left">
                                            <select name="provinceSelect" id="provinceSelect"></select>
                                        </div>
                                        <div class="city left">
                                            <select name="citySelect" id="citySelect"></select>
                                        </div>
                                        <div class="district left">
                                            <select name="countrySelect" id="countrySelect"></select>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="t_r">&nbsp;</td>
                                    <td>
                                        <input type="text" size="60" name="address" id="addressInput">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="t_r"><label for="zipCodeInput">邮政编码：</label></td>
                                    <td>
                                        <input type="text" name="zipCode" id="zipCodeInput">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="t_r"><span>*</span><label for="recvPhoneInput">手机或固话：</label></td>
                                    <td>
                                        <input type="text" name="recvPhone" id="recvPhoneInput">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="t_r"><label for="recvEmailInput">电子邮箱：</label></td>
                                    <td>
                                        <input type="text" size="40" name="recvEmail" id="recvEmailInput">
                                    </td>
                                </tr>
                            </table>
                            <div class="saveAddress">
                                <a href="javascript:void(0);" class="btnCom btnCom_reb" id="saveAddressBtn"><span>保存收货人信息</span></a>
                            </div>
                        </div>
                    </div>
                    <div class="eb_checkOrder_cul mart20">
                        <h3 class="f14px fb" id="payDeliveryH3">支付及配送方式<span class="yellow_block_tip" style="display: none;">请选择支付及配送方式</span>
                        </h3>
                        <dl>
                            <dt>支付方式</dt>
                            <dd><input type="radio" name="payment" value="1"/>货到付款</dd>
                            <dd><input type="radio" name="payment" value="2"/>在线支付
                                <div class="payBank">
                                    <p>支持以下银行或机构在线支付：</p>
                                    <img src="/images/ecart/bank/bank.jpg" alt="支持在线支付银行"/>
                                </div>
                            </dd>
                        </dl>
                        <dl class="mart10">
                            <dt>配送方式</dt>
                            <dd>
                                <input type="radio" name="delivery" value="1" checked="checked"/>EMS（运费21元，满99元免运费）
                            </dd>
                        </dl>
                    </div>
                    <div class="eb_checkOrder_cul mart20">
                        <h3 class="f14px fb">商品清单</h3>
                        <table summary="购物清单" class="ebtable mart10">
                            <thead>
                            <tr>
                                <th width="15%"><span>商品编号</span></th>
                                <th><span>商品</span></th>
                                <th width="10%"><span>数量</span></th>
                                <th width="12%">价格</th>
                            </tr>
                            </thead>
                            <tbody>
                                <#assign cartItems = cart.getCartItems()>
                                <#list cartItems as cartItem>
                                    <#assign goodsItem = cartItem.getGoodsItem()>
                                <tr>
                                    <td>${cartItem.getItemId()}</td>
                                    <td>
                                        <a class="list02" href="javascript:void(0);" target="_blank">${goodsItem.getName()?html}</a>
                                    </td>
                                    <td align="right">${cartItem.getQuantity()?c}</td>
                                    <td align="right">${goodsItem.getPrice()}</td>
                                </tr>
                                </#list>
                            </tbody>
                        </table>
                    </div>
                    <div class="payOrderTotal txtright f14px fb mart20">
                        <span class="payOrderTotal_num">共<em>${cart.getItemSum()?c}</em>件商品</span>应付总额：
                        <span class="f16px fred">
                        ${orderFee.getTotalFee()?string.currency}(<#if (orderFee.getDeliveryFee() > 0)>含${orderFee.getDeliveryFee()}元<#else>免</#if>运费)
                        </span>
                    </div>
                    <div class="payOrderBtn mart20 f14px fb txtright">
                        <a href="javascript:void(0);" id="submitOrder" class="btnCom btnCom_reb"><span>确认无误，提交订单</span></a>

                        <div id="submitOrderHint" class="loading-style1" style="display: none;"><b></b>正在提交订单......
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</@override>
<@override name="body_footerjs">
<div id="provinces" style="display: none;">
    <#list provinces as province>
        <option value="${province?html}">${province?html}</option>
    </#list>
</div>
<script type="text/javascript">
    $(function () {
        function updateUserAddress(result) {
            $("#userAddress").empty();
            $("#userAddress").html(result);

            $("#userAddress a[name=delAddress]").click(function () {
                var addressId = $(this).find("input[name=addressId]").val();
                $.callOrderAction("POST", "/orderAction/delUserAddress", {addressId:addressId},
                        function (data) {
                            updateUserAddress(data);
                        }
                );
            });
        }

        $.callOrderAction("POST", "/orderAction/getUserAddress", null,
                function (data) {
                    updateUserAddress(data);
                }
        );

        function resetNewAddressForm() {
            //noinspection JSUnresolvedFunction
            //resetCitySelect();
            $("#recvNameInput").val("");
            $("#addressInput").val("");
            $("#zipCodeInput").val("");
            $("#recvPhoneInput").val("");
            $("#recvEmailInput").val("");
        }


        if (true) {
            resetNewAddressForm();
        }

        $("#saveAddressBtn").click(function () {
            var addressParams = {};
            addressParams["provinceName"] = $("#provinceSelect option:selected").val();
            addressParams["cityName"] = $("#citySelect option:selected").val();
            addressParams["countryName"] = $("#countrySelect option:selected").val();
            addressParams["recvName"] = $("#recvNameInput").val();
            addressParams["address"] = $("#addressInput").val();
            addressParams["zipCode"] = $("#zipCodeInput").val();
            addressParams["recvPhone"] = $("#recvPhoneInput").val();
            addressParams["recvEmail"] = $("#recvEmailInput").val();

            if (addressParams["recvName"].length <= 0) {
                $("#recvNameInput").focus();
                alert("需填写收货人姓名");
                return;
            }
            if (addressParams["address"].length <= 0) {
                $("#addressInput").focus();
                alert("需填写收货地址");
                return;
            }
            if (addressParams["recvPhone"].length <= 0) {
                $("#recvPhoneInput").focus();
                alert("需填写联系电话");
                return;
            }

            $.callOrderAction("POST", "/orderAction/addUserAddress", addressParams,
                    function (data) {
                        updateUserAddress(data);
                        resetNewAddressForm();
                        alert(getLocaleMessage("地址已保存并设置为当前订单的默认送货地址"));
                    }
            );
        });

        $("#adjustCart").click(function (event) {
            window.location.href = "/orderAction/showCart";
        });

        $("#submitOrder").click(function (event) {
            var orderPostRadioVal = $("#prepareOrderForm input[name=orderPost]:checked").val();
            if (orderPostRadioVal == null) {
                $("#addressH3 .yellow_block_tip").show();
                $("#addressH3").ScrollTo();
                return;
            }
            var paymentRadioVal = $("#prepareOrderForm input[name=payment]:checked").val();
            if (paymentRadioVal == null) {
                $("#payDeliveryH3 .yellow_block_tip").show();
                $("#payDeliveryH3").ScrollTo();
                return;
            }
            var deliveryRadioVal = $("#prepareOrderForm input[name=delivery]:checked").val();
            if (deliveryRadioVal == null) {
                $("#payDeliveryH3 .yellow_block_tip").show();
                $("#payDeliveryH3").ScrollTo();
                return;
            }
            var params = {respDataType:"json", orderPost:orderPostRadioVal, payment:paymentRadioVal, delivery:deliveryRadioVal};

            $("#submitOrder").hide();
            $("#submitOrderHint").show();
            $.callOrderAction("POST", "/orderAction/submitOrder", params,
                    function (data) {
                        window.location.href = "/orderAction/payAfterSubmit?orderCd=" + data["orderCd"];
                    }
            );
            return false;
        });
    });
</script>
</@override>
<@extends name="buybase.ftl"/>