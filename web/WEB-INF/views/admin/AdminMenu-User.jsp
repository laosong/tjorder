<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="side">
    <ul id="menu">
        <li><a href="/admin/usr/admin-list.htm"  <c:if test="${param.m == 'admin' }">class="highlight"</c:if> >管理员</a></li>
        <li><a href="/admin/usr/admin-group-list.htm" <c:if test="${param.m == 'grp' }">class="highlight"</c:if> >组</a></li>
        <br>
        <li><a href="/admin/usr/reg-list.htm"  <c:if test="${param.m == 'reg' }">class="highlight"</c:if> >注册用户</a></li>
        <li><a href="/admin/usr/comments-list.htm"  <c:if test="${param.m == 'comments' }">class="highlight"</c:if> >用户评论</a></li>
    </ul>
</div>