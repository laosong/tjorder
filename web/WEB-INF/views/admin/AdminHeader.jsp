<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<s:portlet var="u" url="/pl/curr-user.htm" param=""/>
<div id="header">
    <div style="float:left;margin: 5px;"><h1>管理后台</h1></div>
    <div style="float:right;margin: 5px;">您好，<span>${u.user.login_name}</span>！<a href="javascript:window.location.href='/home/user/logout.htm?toUrl=/admin/usr/login.htm';">退出</a></div>
</div>