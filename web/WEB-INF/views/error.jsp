<%@ page import="org.springframework.dao.DuplicateKeyException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>门户_首页</title>
</head>

<body>
<div id="container">
    <div id="main">
        <div class="err">
            <div class="err_img"></div>
            <div class="err_rg">
                <p>对不起！<br />调用后台应用接口失败！</p>
                <c:set var="exceptionObj" value="${exception}" />
                <%
                    Exception e = (Exception)pageContext.getAttribute("exceptionObj");
                    if(e instanceof DuplicateKeyException)
                    {
                %>
                     <p>数据内容冲突</p>
                <%
                    } else {
                %>
                <p><b>Exception:</b> ${exception}</p>
                <p><pre>${trace}</pre></p>
                <%
                    }
                %>
                <a class="back" href="javascript:history.back();">返回</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
