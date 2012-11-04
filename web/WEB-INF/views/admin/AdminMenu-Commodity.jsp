<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="side">
    <ul id="menu">
        <li><a href="/admin/commodity/ad-list.htm"  <c:if test="${param.m == 'ad' }">class="highlight"</c:if> >广告管理</a></li>
        <li><a href="/admin/commodity/news-list.htm"  <c:if test="${param.m == 'news' }">class="highlight"</c:if> >天酒公告管理</a></li>
        <br>
        <li><a href="/admin/commodity/category-list.htm"  <c:if test="${param.m == 'category' }">class="highlight"</c:if> >分类管理</a></li>
        <li><a href="/admin/commodity/brand-list.htm"  <c:if test="${param.m == 'brand' }">class="highlight"</c:if> >品牌管理</a></li>
        <li><a href="/admin/commodity/goods-down-list.htm"  <c:if test="${param.m == 'goods-down' }">class="highlight"</c:if> >商品-未上架</a></li>
        <li><a href="/admin/commodity/goods-up-list.htm"  <c:if test="${param.m == 'goods-up' }">class="highlight"</c:if> >商品-已上架</a></li>
        <li><a href="/admin/commodity/goods0-down-list.htm"  <c:if test="${param.m == 'goods0-down' }">class="highlight"</c:if> >0元品鉴商品-未上架</a></li>
        <li><a href="/admin/commodity/goods0-up-list.htm"  <c:if test="${param.m == 'goods0-up' }">class="highlight"</c:if> >0元品鉴商品-已上架</a></li>
        <br>
        <li><a href="/admin/commodity/customize-special.htm"  <c:if test="${param.m == 'c-special' }">class="highlight"</c:if> >首页-活动管理</a></li>
        <li><a href="/admin/commodity/customize-recommend.htm"  <c:if test="${param.m == 'c-recommend' }">class="highlight"</c:if> >首页-人气管理</a></li>
        <li><a href="/admin/commodity/customize-new.htm"  <c:if test="${param.m == 'c-new' }">class="highlight"</c:if> >首页-新品管理</a></li>
        <li><a href="/admin/commodity/customize-hot.htm"  <c:if test="${param.m == 'c-hot' }">class="highlight"</c:if> >首页-婚庆管理</a></li>
    </ul>
</div>