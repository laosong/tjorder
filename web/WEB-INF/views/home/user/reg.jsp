<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="买茅台酒、劲酒、汾酒、国酒等各种白酒，上天酒商城." />
    <meta name="description" content="茅台酒,劲酒,汾酒,国酒,五粮液,高端白酒,天酒商城,注册" />
    <title>注册_天酒商城</title>
    <link href="/css/base.css" rel="stylesheet" type="text/css"/>
    <link href="/css/common.css"	rel="stylesheet" type="text/css"/>
    <link href="/css/register.css"	rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
</head>
<body>
<div id="register">
    <c:import url="../header_sim.jsp" charEncoding="utf-8"/>
    <div class="reg_container">
        <div class="reg_main">
            <div class="reg_main_til">
                <h2 class="reg_til">新用户注册</h2>
                <p class="reg_tips fcor_gray txtright mart10">带<span class="fred">*</span>号为必填项</p>
            </div>
            <form:form id="regForm" commandName="cmd" method="post" action="/home/user/reg.htm">
                <div class="reg_area">
                <div id="easyIdFld" class="easyforminput clearfix">
                    <div style="padding-left: 190px;padding-bottom:30px;font-size: 14pt; color: red;"> <form:errors path="*"/> </div>
                    <div class="easyformlabel"><label for="login_name"><span>*</span>用户名：</label></div>
                    <div class="easyformfield">
                        <input type="text" name="login_name" id="login_name" maxlength="20" value="${cmd.login_name}" size="18"/>
                    </div>
                </div>
                <div id="emailFld" class="easyforminput clearfix">
                    <div class="easyformlabel"><label for="iemail"><span>*</span>邮箱：</label></div>
                    <div class="easyformfield">
                        <input type="text" name="email" id="iemail" maxlength="32" value="${cmd.email}" size="18" />
                    </div>
                </div>
                <div id="passwordFld" class="easyforminput clearfix">
                    <div class="easyformlabel"><label for="iuserPwd"><span>*</span>密码：</label></div>
                    <div class="easyformfield">
                        <input name="login_pass" type="password" maxlength="20" value="" size="18" id="iuserPwd" onpaste="return false" />
                    </div>
                </div>

                <div id="confPasswordFld" class="easyforminput clearfix">
                    <div class="easyformlabel"><label for="iuseragainPwd"><span>*</span>再次输入密码：</label></div>
                    <div class="easyformfield">
                        <input type="password" maxlength="20" value="" size="18" name="pwd_confirm" id="iuseragainPwd" onpaste="return false"  />
                    </div>
                </div>

                <div id="checkcodeFld" class="easyforminput clearfix">
                    <div class="easyformlabel"><label for="valid_code"><span>*</span>验证码：</label></div>
                    <div class="easyformfield codeInput">
                        <input type="text" size="4" class="left" name="verifyCd" id="valid_code" maxlength="4"/>
                        <img class="left"  src="/verify_code.jpg" alt="验证码" id="valid_code_img" />
                        <p class="f666"></p>
                    </div>
                    <div class="A_directions clearfix" id="checkCode_check_msg"></div>
                </div>

                <div id="treaty" class="treaty_form clearfix">
                    <div class="treaty_field">
                        <input type="checkbox" checked="checked" alt="请确认您已看过并同意《天酒商城用户注册协议》" name="treaty" id="iTreaty">&nbsp;我已经看过并同意“使用协议”<a href="/signupagreement.html" target="_blank">查看</a>
                    </div>
                    <div class="A_directions clearfix" id="iTreaty_check_msg">请确认您已看过并同意《天酒商城用户注册协议》</div>
                </div>
                <div class="reg_submit_btn"><a href="javascript:$('#regForm').submit();" id="registerAction" class="btn ebsmbbtn">提交</a></div>
            </div>
            </form:form>
        </div> <!-- end reg_main -->
    </div>
    <c:import url="../footer_sim.jsp" charEncoding="utf-8"/>
</div>
</body>
</html>