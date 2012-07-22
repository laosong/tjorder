<@override name="title"><@super/>填写订单细节</@override>
<@override name="head_css">
<style type="text/css">
</style>
</@override>
<@override name="body_content">
<div class="home_body">
<div class="space clear"></div>
<div class="space clear"></div>

<div class="centered" style="width: 900px; height:30px;"><img src="/images/progress_bar_2.png" alt=""></div>
<div class="space clear"></div>
<div style="width: 900px; height:30px;background-color: #c5081c;" class="centered"></div>
<div class="order_block centered" align="center">
<form name="prepareOrderForm" id="prepareOrderForm">
    <div class="space clear"></div>
    <div class="space clear"></div>
    <div class="space clear"></div>
    <table width="95%" border="0" cellspacing="0" cellpadding="0" class="order_inner_block">
        <tbody>
        <tr bgcolor="#eeeeee">
            <td height="260" align="center" valign="top">
                <table width="98%" border="0" cellspacing="0" cellpadding="0">
                    <tbody>
                    <tr>
                        <td height="50" align="center"><strong>收货人信息</strong></td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="4">
                                <tbody>
                                <tr>
                                    <td colspan="2" align="left">常用地址：</td>
                                </tr>
                                    <#list userAddresses as address>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td align="left">
                                            <input type="radio" name="orderPost" value="${address.getId()}">
                                        ${address.getRecvName()!("")?html}
                                        ${address.getAddress()!("")?html}
                                        ${address.getZipCode()!("")?html}
                                        ${address.getRecvPhone()!("")?html}
                                        </td>
                                    </tr>
                                    </#list>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tbody>
                                            <tr>
                                                <td width="10" align="left">
                                                    <input type="radio" name="orderPost" value="0">
                                                </td>
                                                <td width="80" align="right">收件人：</td>
                                                <td width="665" align="left">
                                                    <input type="text" name="recvName" id="recvNameInput">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="right">地址：</td>
                                                <td align="left">
                                                    <select name="provinceSelect" id="provinceSelect"></select>
                                                    <select name="citySelect" id="citySelect"></select>
                                                    <select name="countrySelect" id="countrySelect"></select>
                                                    <input type="text" name="address" id="addressInput">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="right">邮编：</td>
                                                <td align="left">
                                                    <input type="text" name="zipCode" id="zipCodeInput">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="right">电话：</td>
                                                <td align="left">
                                                    <input type="text" name="recvPhone" id="recvPhoneInput">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="right">
                                                    <input type="checkbox" checked="checked" name="saveAddress" value="1">
                                                </td>
                                                <td align="left">保存为常用联系地址</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <br></td>
                                </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="space"></div>
    <div class="space"></div>
    <table width="95%" border="0" cellspacing="0" cellpadding="0" class="order_inner_block">
        <tbody>
        <tr bgcolor="#eeeeee">
            <td height="200" align="center" valign="top">
                <table width="98%" border="0" cellspacing="0" cellpadding="4">
                    <tbody>
                    <tr>
                        <td height="50" align="center"><strong>支付和配送方式</strong></td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="4">
                                <tbody>
                                <tr>
                                    <td colspan="2" align="left">支付：</td>
                                </tr>
                                <tr>
                                    <td align="left">&nbsp;</td>
                                    <td align="left"><input type="radio" name="payment" value="1"> 货到付款</td>
                                </tr>
                                <tr>
                                    <td width="40" align="left">&nbsp;</td>
                                    <td align="left"><input type="radio" name="payment" value="2"> 在线支付<br>
                                        <img src="/images/banks.jpg" width="577" height="236">
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <table width="100%" border="0" cellspacing="4" cellpadding="4">
                                <tbody>
                                <tr>
                                    <td colspan="2" align="left">配送：</td>
                                </tr>
                                <tr>
                                    <td align="left">&nbsp;</td>
                                    <td align="left"><input type="radio" name="delivery" value="1"> 普通快递（免费）</td>
                                </tr>
                                <tr>
                                    <td width="40" align="left">&nbsp;</td>
                                    <td align="left"><input type="radio" name="delivery" value="2"> 加急快递（15元）</td>
                                </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="space"></div>
    <div class="space"></div>
    <table width="95%" border="0" cellspacing="0" cellpadding="0" class="order_inner_block">
        <tbody>
        <tr bgcolor="#eeeeee">
            <td height="180" align="center" valign="top">
                <table width="98%" border="0" cellspacing="4" cellpadding="4">
                    <tbody>
                    <tr>
                        <td height="50"><strong>商品清单</strong></td>
                    </tr>
                    <tr>
                        <td align="center">
                            <table width="80%" border="0" cellspacing="2" cellpadding="2">
                                <tbody>
                                <tr>
                                    <th height="25" align="center" bgcolor="#FF9900"><strong>商品编号</strong></th>
                                    <th align="center" bgcolor="#FF9900"><strong>商品名称</strong></th>
                                    <th align="center" bgcolor="#FF9900"><strong>数量</strong></th>
                                    <th align="center" bgcolor="#FF9900"><strong>价格</strong></th>
                                </tr>
                                    <#assign cartItems = cart.getCartItems()>
                                    <#list cartItems as cartItem>
                                        <#assign productItem = cartItem.getProductItem()>
                                    <tr>
                                        <td>${cartItem.getItemId()}</td>
                                        <td><a class="list02" href="#">${productItem.getName()?html}</a></td>
                                        <td align="right">${cartItem.getQuantity()?c}</td>
                                        <td align="right">${productItem.getPrice()?c}</td>
                                    </tr>
                                    </#list>
                                <tr>
                                    <td style="font-size:16pt; border-top: 2px double black;" height="35" colspan="4" align="right">
                                        共${cart.getItemSum()?c}件商品，总价：${cart.getTotalPrice()?c}元&nbsp;
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="space"></div>
    <div class="space"></div>
</form>
<table width="95%" border="0" cellspacing="0" cellpadding="0">
    <tbody>
    <tr>
        <td height="30" align="left">
            <button id="adjustCart" style="font-size: 12pt;">调整购物车</button>
        </td>
        <td align="right">
            <button id="submitOrder" style="font-size: 12pt;">提交订单</button>
        </td>
    </tr>
    </tbody>
</table>
<div class="space"></div>
<div class="space"></div>
</div>

</div>

</@override>
<@override name="body_footerjs">
<div id="provinces">
    <#list provinces as province>
        <option value="${province?html}">${province?html}</option>
    </#list>
</div>
<script type="text/javascript">
    $(function () {
        $("#adjustCart").button({ icons:{ primary:"ui-icon-cart"}  });
        $("#submitOrder").button({ icons:{ primary:"ui-icon-circle-check"}  });

        var provinceO = {oName:"请选择省份", oValue:"0"};
        var cityO = {oName:"请选择城市", oValue:"0"};
        var countryO = {oName:"请选择区县", oValue:"0"};

        var provinceOptStr = $("#provinces").html();
        if (true) {
            var provinceOptions = ['<option value="', provinceO.oValue, '">', provinceO.oName, '</option>'];
            $("#provinceSelect").html(provinceOptions.join("") + provinceOptStr);
            provinceSelectChanged();
        }

        $("#provinceSelect").change(function (event) {
            provinceSelectChanged();
        });

        $("#citySelect").change(function (event) {
            citySelectChanged();
        });

        function provinceSelectChanged() {
            var province = $("#provinceSelect").val();
            if (province != provinceO.oValue) {
                $.callOrderAction("POST", "/orderAction/getProvinceCities", {respDataType:"json", provinceName:province},
                        function (data) {
                            var cityOptions = ['<option value="', cityO.oValue, '">', cityO.oName, '</option>'];
                            var cities = data.provinceCities;
                            var x = -1;
                            var p = "";
                            if (cities) {
                                for (x in cities) {
                                    p = cities[x];
                                    cityOptions.push('<option value="');
                                    cityOptions.push(p);
                                    cityOptions.push('">');
                                    cityOptions.push(p);
                                    cityOptions.push('</option>');
                                }
                            }
                            $("#citySelect").html(cityOptions.join(""));
                            if (x == 0) {
                                $("#citySelect").val(p);
                            }
                            citySelectChanged();
                        }
                )
            } else {
                var cityOptions = ['<option value="', cityO.oValue, '">', cityO.oName, '</option>'];
                $("#citySelect").html(cityOptions.join(""));

                var countryOptions = ['<option value="', countryO.oValue, '">', countryO.oName, '</option>'];
                $("#countrySelect").html(countryOptions.join(""));
            }
        }

        function citySelectChanged() {
            var province = $("#provinceSelect").val();
            var city = $("#citySelect").val();
            if (city != cityO.oValue) {
                $.callOrderAction("POST", "/orderAction/getCityCountries", {respDataType:"json", provinceName:province, cityName:city},
                        function (data) {
                            var countryOptions = ['<option value="', countryO.oValue, '">', countryO.oName, '</option>'];
                            var counties = data.cityCountries;
                            var x = -1;
                            var p = "";
                            if (counties) {
                                for (x in counties) {
                                    p = counties[x];
                                    countryOptions.push('<option value="');
                                    countryOptions.push(p);
                                    countryOptions.push('">');
                                    countryOptions.push(p);
                                    countryOptions.push('</option>');
                                }
                            }
                            $("#countrySelect").html(countryOptions.join(""));
                            if (x == 0) {
                                $("#countrySelect").val(p);
                            }
                        }
                )
            } else {
                var countryOptions = ['<option value="', countryO.oValue, '">', countryO.oName, '</option>'];
                $("#countrySelect").html(countryOptions.join(""));
            }
        }

        $("#adjustCart").click(function (event) {
            window.location.href = "/orderAction/showCart";
        });

        $("#submitOrder").click(function (event) {
            var orderPostRadioVal = $("#prepareOrderForm input[name=orderPost]:checked").val();
            if (orderPostRadioVal == null) {
                return;
            }
            var addressParams = {};
            if (orderPostRadioVal == "0") {
                addressParams["provinceName"] = $("#provinceSelect option:selected").val();
                addressParams["cityName"] = $("#citySelect option:selected").val();
                addressParams["countryName"] = $("#countrySelect option:selected").val();
                addressParams["recvName"] = $("#recvNameInput").val();
                addressParams["address"] = $("#addressInput").val();
                addressParams["zipCode"] = $("#zipCodeInput").val();
                addressParams["recvPhone"] = $("#recvPhoneInput").val();
            }
            var paymentRadioVal = $("#prepareOrderForm input[name=payment]:checked").val();
            if (paymentRadioVal == null) {
                return;
            }
            var deliveryRadioVal = $("#prepareOrderForm input[name=delivery]:checked").val();
            if (deliveryRadioVal == null) {
                return;
            }
            var params = {respDataType:"json", orderPost:orderPostRadioVal, payment:paymentRadioVal, delivery:deliveryRadioVal};
            if (orderPostRadioVal == "0") {
                for (var key in addressParams) {
                    params[key] = addressParams[key];
                }
            }
            $.callOrderAction("POST", "/orderAction/submitOrder", params,
                    function (data) {
                        alert(data);
                    }
            );
            return false;
        });
    });
</script>
</@override>
<@extends name="base.ftl"/>