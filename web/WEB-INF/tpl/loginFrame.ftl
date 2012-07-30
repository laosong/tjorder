<!-- 弹出登录层 -->
<div class="login_pop popcon" id="login_pop">
    <div id="login_clearbox" class="popclose"><a href="javascript:void(0);"></a></div>
    <div class="popmain login_popmain">
        <h2 class="f16px fb">用户登录</h2>

        <div class="popmain_con ebCon clearfix">
            <div class="ebLog left">
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
                        <div class="info_input log_remb clearfix">
                            <div class="log_checkbox left">
                                <input id="rememberCheck" type="checkbox" checked="" name="remember" tabIndex="3"/>
                                <label for="rememberCheck">记住登录状态</label>
                            </div>
                            <p class="left"><a href="#" target="_blank">忘记密码？</a>
                            </p>
                        </div>
                        <div class="login_submit mart30">
                            <input class="btn ebsmbbtn" type="submit" name="submit" id="login_btn" value="登 录"/>
                        </div>
                    </form>
                </div>
            </div>
            <div class="right ebReg">
                <h2 class="f14px fb">还不是天酒商城用户？</h2>

                <p class="mart10">现在免费注册成为天酒商城用户，便能立刻享受便宜又放心的购物乐趣。</p>

                <div class="payOrderBtn"><a href="/main.html" class="ebregbtn btn">新用户注册</a></div>
            </div>
        </div>
    </div>
</div>
<!-- end 弹出登录层 -->