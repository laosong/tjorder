var laosong_login =
    '<!-- 弹出登录层 -->' +
        '<div class="login_pop popcon" id="login_pop">' +
        '    <div id="login_clearbox" class="popclose">' +
        '       <a href="javascript:void(0);" id="close_btn"></a>' +
        '    </div>' +
        '    <div class="popmain login_popmain">' +
        '        <h2 class="f16px fb">用户登录</h2>' +
        '' +
        '        <div class="popmain_con clearfix">' +
        '            <div class="ebLog left">' +
        '                <div class="log_field ebLog_form">' +
        '                    <form onsubmit="return false">' +
        '                        <div class="info_input clearfix">' +
        '                            <label for="usernameInput">用户名</label>' +
        '                            <input class="log_input_box" id="usernameInput" name="username" type="text" value="" maxlength="50" tabIndex="1"/>' +
        '                        </div>' +
        '                        <div class="info_input clearfix">' +
        '                            <label for="userpwdInput"><span>密</span>码</label>' +
        '                            <input class="log_input_box" id="userpwdInput" type="password" value="" maxlength="50" tabIndex="2"/>' +
        '                        </div>' +
        '                        <div class="info_input log_remb clearfix">' +
        '                            <div class="log_checkbox left">' +
        '                                <input id="rememberCheck" type="checkbox" checked="" name="remember" tabIndex="3"/>' +
        '                                <label for="rememberCheck">记住登录状态</label>' +
        '                            </div>' +
        '                            <p class="left">' +
        '                                <a href="#" target="_blank">忘记密码？</a>' +
        '                            </p>' +
        '                        </div>' +
        '                        <div class="login_submit mart30">' +
        '                            <input class="btn ebsmbbtn" type="submit" name="submit" id="login_btn" value="登 录"/>' +
        '                        </div>' +
        '                    </form>' +
        '                </div>' +
        '            </div>' +
        '            <div class="right ebReg">' +
        '                <h2 class="f14px fb">还不是天酒商城用户？</h2>' +
        '' +
        '                <p class="mart10">现在免费注册成为天酒商城用户，便能立刻享受便宜又放心的购物乐趣。</p>' +
        '' +
        '                <div class="payOrderBtn">' +
        '                    <a href="/reg.html" class="ebregbtn btn">新用户注册</a>' +
        '                </div>' +
        '            </div>' +
        '        </div>' +
        '    </div>' +
        '</div>' +
        '< !--end弹出登录层-- >';

function bindLoginFrameEvent() {
    $("#close_btn").click(function () {
        popwindow_close();
    })

    $("#login_btn").click(function () {
        var username = $("#usernameInput").val();
        var userpwd = $("#userpwdInput").val();

        $.callOrderAction("POST", "/orderAction/login", {respDataType:"json", username:username, userpwd:userpwd},
            function (data) {
                popwindow_close();
                submitAfterLogin();
            },
            function (data) {
                alert("error login");
            }
        );
    })
}

var pending_type = null;
var pending_url = null;
var pending_params = null;
var pending_successCallback = null;
var pending_failCallback = null;

function submitAfterLogin() {
    if (pending_type != null && pending_url != null && pending_successCallback != null) {
        var options = {
            type:pending_type,
            data:pending_params,
            success:function (data, textStatus, jqXHR) {
                var respCT = jqXHR.getResponseHeader("content-type");
                if (respCT != null && respCT.indexOf("text/json") >= 0) {
                    if (data.success == false) {
                        if (pending_failCallback) {
                            pending_failCallback(data);
                        } else {
                            alert(data.message);
                        }
                    } else {
                        pending_successCallback(data);
                    }
                } else {
                    pending_successCallback(data);
                }
            },
            error:function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        };
        return $.ajax(pending_url, options);
    }
}

jQuery.extend({
    callOrderAction:function (type, url, params, successCallback, failCallback) {
        url += "?reqDataType=json";
        var options = {
            type:type,
            data:params,
            success:function (data, textStatus, jqXHR) {
                var respCT = jqXHR.getResponseHeader("content-type");
                if (respCT != null && respCT.indexOf("text/json") >= 0) {
                    if (data.success == false) {
                        //noinspection JSUnresolvedVariable
                        if (data.loginFrame != null) {
                            pending_type = type;
                            pending_url = url;
                            pending_params = params;
                            pending_successCallback = successCallback;
                            pending_failCallback = failCallback;

                            popwindow_show(null, 800, 300, laosong_login);
                            bindLoginFrameEvent();
                        } else if (failCallback) {
                            failCallback(data);
                        } else {
                            alert(data.message);
                        }
                    } else {
                        successCallback(data);
                    }
                } else {
                    successCallback(data);
                }
            },
            error:function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        };
        return $.ajax(url, options);
    }
})