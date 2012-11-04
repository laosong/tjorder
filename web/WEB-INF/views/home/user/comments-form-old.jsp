<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<s:portlet var="c" url="/pl/comments-list.htm" param=""/>
<html>
<head>
    <title></title>
</head>
<body>
<ul>
    <c:forEach var="unit" items="${c.list}">
        <li>score: ${unit.score}; goods id: [${unit.owner_id}] - [${unit.msg}]</li>
    </c:forEach>
</ul>
<form:form id="commentsForm" commandName="cmd" action="/home/user/add-comments.htm" method="post">
    <p><form:errors path="*" /></p>
    <label>Rate：<span class="small">Rate 1-5</span></label>
    <select name="score" style="font-size:18px;color:#e78f08;" id="score">
        <option value="5">★★★★★</option>
        <option value="4">★★★★</option>
        <option value="3">★★★</option>
        <option value="2">☆☆</option>
        <option value="1">☆</option>
    </select>
    <div class="space"></div>
    <label>Goods id：
        <input type="text" name="owner_id" value="1"/>
        <input type="text" name="creator" value="8"/>
    </label>
    <div class="space"></div>
    <label>Comments：
        <textarea id="msg" name="msg"  >${cmd.msg}</textarea>
    </label>
    <div class="space"></div>
    <button>Submit</button>
</form:form>
</body>
</html>