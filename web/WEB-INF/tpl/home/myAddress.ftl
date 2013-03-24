<@override name="address_form">
<div class="newAddress" id="newAddress">
    <p class="fb">新建收货人</p>
    <table summary="收货人信息">
        <tr>
            <td class="t_r" width="16%"><span>*</span><label for="recvNameInput">收货人姓名：</label></td>
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
</@override>
<@override name="body_footerjs">
    <@super/>
<script type="text/javascript">
    $(function () {
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

            $.callOrderAction("POST", "/orderAction/addUserAddress", addressParams,
                    function (data) {
                        window.location.href = "/orderAction/myAddress";
                    }
            );
        });
    });
</script>
</@override>
<@extends name="myAddressBase.ftl"/>