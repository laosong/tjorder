<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<s:portlet url="/pl/user-list.htm" var="usr" param="types=2"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>后台首页</title>
    <c:import charEncoding="utf-8"  url="JsCss.jsp" />
</head>
<body>
<div id="floater"></div>
<div id="centered">
    <c:import charEncoding="utf-8"  url="AdminHeader.jsp" />
    <c:import charEncoding="utf-8"  url="AdminTopNav.jsp?t=usr" />
        <div id="bottom-main">
            <c:import charEncoding="utf-8"  url="AdminMenu-User.jsp" />
                <div id="content">

                </div>
        </div>
    <c:import charEncoding="utf-8" url="AdminFooter.jsp" />
</div>
<div id="bottom-space"></div>
</body>
</html>
