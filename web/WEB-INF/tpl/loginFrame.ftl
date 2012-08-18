<#-- @ftlvariable name="redirect" type="java.lang.String" -->
<@override name="title">登录_<@super/></@override>
<@override name="head_css">
<style type="text/css">
</style>
</@override>
<@override name="body_content">
<div id="content">
    <div id="login">
        <div class="log_container">
            <div class="log_con clearfix">
                <div class="ebLog left">
                    <h2 class="reg_til">用户登录</h2>
                    <div class="log_field ebLog_form">
                        <form onsubmit="return false">
                            <div class="info_input clearfix">
                                <label for="usernameInput">用户名</label>
                                <input class="log_input_box" id="usernameInput" name="username" type="text" value="" maxlength="50" tabIndex="1"/>
                            </div>
                            <div class="info_input clearfix">
                                <label for="userpwdInput"><span>密</span>码</label>
                                <input class="log_input_box" id="userpwdInput" type="password" value="" maxlength="50" tabIndex="2"/>
                            </div>
                            <div id="checkCode" class="info_input clearfix">
                                <label for="checkcode">验证码</label>
                                <div class="easyformfield codeInput">
                                    <input type="text" size="4" class="left" name="vc" id="valid_code" maxlength="4" tabindex="3"/>
                                    <img class="left" <img src="/verify_code.jpg" alt="验证码" id="valid_code_img"/>
                                    <p class="f666">看不清？点击图片换一张！</p>
                                </div>
                                <div class="A_directions clearfix" id="checkCode_check_msg"></div>
                            </div>
                            <div class="info_input log_remb clearfix">
                                <div class="log_checkbox left">
                                    <input id="rememberCheck" type="checkbox" checked="" name="remember" tabIndex="4"/>
                                    <label for="rememberCheck">记住登录状态</label>
                                </div>
                                <p class="left">
                                    <a href="#" target="_blank">忘记密码？</a>
                                </p>
                            </div>
                            <div class="login_submit mart20">
                                <input class="btn ebsmbbtn" type="submit" name="submit" id="login_btn" value="登 录" onMouseOver="this.className='btn ebsmbbtn ebbtnhv'" onMouseOut="this.className='btn ebsmbbtn'" tabIndex="5"/>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="ebReg right">
                    <h2 class="f14px fb">还不是天酒商城用户？</h2>
                    <p class="mart10">现在免费注册成为天酒商城用户，便能立刻享受便宜又放心的购物乐趣。</p>
                    <div class="payOrderBtn"><a href="#" class="ebregbtn btn">新用户注册</a></div>
                </div>
            </div>
        </div>
    </div>
</div>
</@override>
<@override name="body_footerjs">
<input name="redirect" id="redirectInput" value="${redirect?html}">
<script type="text/javascript">
    $(function () {
        $("#login_btn").click(function () {
            var username = $("#usernameInput").val();
            var userpwd = $("#userpwdInput").val();
            var redirect = $("#redirectInput").val();

            $.callOrderAction("POST", "/orderAction/login", {respDataType:"json", username:username, userpwd:userpwd, redirect:redirect},
                    function (data) {
                        var redirect_url = "/";
                        if (data.redirect != null) {
                            redirect_url = data.redirect;
                        }
                        window.location.href = redirect_url;
                    },
                    function (data) {
                        alert("error login");
                    }
            );
        })
    });
</script>
</@override>
<@extends name="base.ftl"/>