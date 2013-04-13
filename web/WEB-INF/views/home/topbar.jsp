<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<s:portlet var="u" url="/pl/curr-user.htm" param=""/>
<div id="toptip">
    <div class="toptip_wrap">
        <div class="toptip_logon left">
            <ul class="clearfix">
                <c:if test="${empty u.user}">
                    <li>您好，欢迎来到天酒商城！<a href="/home/user/login.htm">请登录</a><a href="/home/user/reg.htm">免费注册</a><span>|</span></li>
                </c:if>
                <c:if test="${!empty u.user}">
                    <li class="">您好，<span><a href="/home/user/center.htm">${u.user.login_name}</a></span>！<a href="javascript:window.location.href='/home/user/logout.htm?toUrl=/index.htm';">退出</a><span>|</span></li>
                    <li><a href="/home/user/favor.htm">我的收藏夹</a></li>
                </c:if>
            </ul>
        </div>
        <div class="toptip_tool right">
            <ul class="clearfix">
                <li class="t_collect icon"><a href="javascript:void(0);" onclick="addfavorite()">收藏天酒商城</a><span>|</span></li>
                <li><a href="/home/news-list.htm" target="_blank">网站公告</a><span>|</span></li>
                <li><a href="/help/aboutus.htm" target="_blank">关于我们</a></li>
            </ul>
        </div>
    </div>
</div>
