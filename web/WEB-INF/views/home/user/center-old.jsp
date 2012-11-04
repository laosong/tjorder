<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<s:portlet var="u" url="/pl/curr-user.htm" param=""/>
<html>
<head>
    <title>用户-中心</title>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
    <style type="text/css">
        @import "/css/home/home.css";
        @import "/css/jquery/blitzer/jquery-ui-1.8.16.custom.css";
        @import "/css/home/form.css";
    </style>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery-ui.min.js"></script>
    <script type="text/javascript" charset="utf-8">
    </script>
</head>
<body>
<div id="top_container">
    <c:import url="../header.jsp" charEncoding="utf-8"/>
    <div class="home_body" align="center">
        <div class="space clear"></div>    <div class="space clear"></div>
        <c:import url="menu.jsp" charEncoding="utf-8"/>
        <div class="menu_main float_r">
            <h1>用户中心</h1>
            <div class="space"></div>
            <div  class="simpleForm" style="width: 480px;">
                <p>基本信息：</p>
                <label style="line-height: 24pt;">用户登录名：</label>
                <input type="text" name="login_name" value="${u.user.login_name}" readonly="readonly" style="border: none;font-size: 12pt;"/>
                <div class="spacer"></div>
                <label style="line-height: 22pt;">邮箱：</label>
                <input type="text" name="email" value="${u.user.email}"  readonly="readonly" style="border: none;"/>
                <div class="spacer"></div>
                <label style="line-height: 22pt;">注册日期：</label>
                <input type="text" name="date" value="<fmt:formatDate value="${u.user.created_date}" pattern='yyyy年MM月dd'/>"  readonly="readonly" style="border: none;"/>
                <div class="spacer"></div>
                <label>&nbsp;</label>
                <div class="spacer"></div>
            </div>
        </div>
    </div>
    <c:import url="../footer.jsp" charEncoding="utf-8"/>
</div>
</body>
</html>