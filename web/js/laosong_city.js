$(function () {

    var provinceO = {oName:"请选择省份", oValue:"0"};
    var cityO = {oName:"请选择城市", oValue:"0"};
    var countryO = {oName:"请选择区县", oValue:"0"};

    $("#provinceSelect").change(function (event) {
        provinceSelectChanged();
    });

    $("#citySelect").change(function (event) {
        citySelectChanged();
    });

    var preProvince = $("#preProvince").val();
    if (preProvince == undefined || preProvince == null || preProvince == "") {
        preProvince = provinceO.oValue;
    }
    var preCity = $("#preCity").val();
    if (preCity == undefined || preCity == null || preCity == "") {
        preCity = cityO.oValue;
    }
    var preCountry = $("#preCountry").val();
    if (preCountry == undefined || preCountry == null || preCountry == "") {
        preCountry = countryO.oValue;
    }

    var provinceOptStr = '<option value="' + provinceO.oValue + '">' + provinceO.oName + '</option>';
    provinceOptStr += $("#provinces").html();

    function provinceSelectChanged() {
        var province = $("#provinceSelect").val();
        if (province != provinceO.oValue) {
            $.callOrderAction("POST", "/orderAction/getProvinceCities", {respDataType:"json", provinceName:province},
                function (data) {
                    var cityOptions = ['<option value="', cityO.oValue, '">', cityO.oName, '</option>'];
                    //noinspection JSUnresolvedVariable
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
                    if (preCity != cityO.oValue) {
                        $("#citySelect").val(preCity);
                        preCity = cityO.oValue;
                    }
                    else if (x == 0) {
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
                    //noinspection JSUnresolvedVariable
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
                    if (preCountry != countryO.oValue) {
                        $("#countrySelect").val(preCountry);
                        preCountry = countryO.oValue;
                    }
                    else if (x == 0) {
                        $("#countrySelect").val(p);
                    }
                }
            )
        } else {
            var countryOptions = ['<option value="', countryO.oValue, '">', countryO.oName, '</option>'];
            $("#countrySelect").html(countryOptions.join(""));
        }
    }

    function resetCitySelect() {
        $("#provinceSelect").html(provinceOptStr);
        if (preProvince != provinceO.oValue) {
            $("#provinceSelect").val(preProvince);
            preProvince = provinceO.oValue;
        }
        provinceSelectChanged();
    }

    if (true) {
        resetCitySelect();
    }
});