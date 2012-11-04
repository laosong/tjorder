<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<s:portlet url="/pl/grp-list.htm" var="grp" param=""/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>注册用户信息</title>
    <c:import charEncoding="utf-8"  url="../JsCss.jsp" />
    <link rel="stylesheet" type="text/css" href="/css/admin/form.css" />
</head>
<jsp:useBean id="navTab" class="java.lang.String"/><c:set var="navTab" value="usr"/>
<jsp:useBean id="menu" class="java.lang.String"/><c:set var="menu" value="reg"/>
<body>
<div id="floater"></div>
<div id="centered">
    <c:import charEncoding="utf-8"  url="../AdminHeader.jsp" />
    <c:import charEncoding="utf-8"  url="../AdminTopNav.jsp?t=${navTab}" />
    <div id="bottom-main">
        <c:import charEncoding="utf-8"  url="../AdminMenu-User.jsp?m=${menu}" />
        <div id="content">
            <h1>注册用户信息</h1>
            <div  class="simpleForm">
                <form:form id="userForm" commandName="cmd" action="/admin/usr/reg-add-edit${cmd.id}.htm" method="post">
                    <h2 align="center" style="color: red"><form:errors path="*"/></h2>
                    <input type="hidden" name="id" value="${cmd.id}"/>
                    <!-- <input type="hidden" name="stay" value="1"/> -->
                    <label>登录名：<span class="small"></span></label>
                    <input type="text" value="${cmd.login_name}" readonly="readonly" style="border: none;">
                    <div class="spacer"></div>
                    <label>邮件：<span class="small"></span></label>
                    <input type="text" value="${cmd.email}" readonly="readonly" style="border: none;">
                    <div class="spacer"></div>
                    <label>密码：<span class="small">管理员登录用密码</span></label>
                    <input type="password" name="login_pass" value="${cmd.login_pass}"/>
                    <div class="spacer"></div>
                    <label>密码确认：<span class="small">与密码同</span></label>
                    <input type="password" name="pwd_confirm" value="${cmd.login_pass}"/>
                    <div class="spacer"></div>
                    <label>用户组：<span class="small">组决定用户权限</span></label>
                    <form:select  path="group_cd">
                        <option value="0">请选择组...</option>
                        <form:options items="${grp.list}" itemValue="grp_code" itemLabel="grp_name" htmlEscape="false"/>
                    </form:select>
                    <div class="spacer"></div>
                    <div class="spacer"></div>
                    <label>&nbsp;<span class="small"></span></label>
                    <tags:btn-common id="sumbit_${cmd.id}" iconClass="ui-icon-check" label="提交" />
                    <tags:btn-common id="cancel_${cmd.id}" iconClass="ui-icon-close" label="返回" actionScript="window.location.href='reg-list.htm'" />
                </form:form>
            </div>
        </div>
    </div>
    <c:import charEncoding="utf-8" url="../AdminFooter.jsp" />
</div>
<div id="bottom-space"></div>
</body>
</html>