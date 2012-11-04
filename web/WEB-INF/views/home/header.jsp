<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<s:portlet url="/pl/category.htm" var="one" param="short_name=b1"/>
<s:portlet url="/pl/category.htm" var="two" param="short_name=b2"/>
<s:portlet url="/pl/category.htm" var="three" param="short_name=b3"/>
<s:portlet url="/pl/category.htm" var="four" param="short_name=b4"/>
<s:portlet url="/pl/category.htm" var="five" param="short_name=b5"/>
<s:portlet url="/pl/category.htm" var="six" param="short_name=b6"/>
<s:portlet url="/pl/category.htm" var="seven" param="short_name=b7"/>
<s:portlet url="/pl/ad-list.htm" var="search" param="area_cd=search"/>
<div id="header" class="clearfix">
    <h1 class="logo left"><a href="/index.htm"><img src="/images/logo.png" alt="天酒商城" /></a><span>天酒商城</span></h1>
    <p class="slogan commonBg">喝茅台好酒，上天酒商城！</p>
    <div class="header_tel commonBg right">全国免费客服电话：4006036519</div>
</div>
<div id="nav" class="pr">
    <div class="nav_brand"  id="brand">
        <h2 class="btn">天酒品牌<c:if test="${empty param.p}"><i class="icon">&nbsp;</i></c:if></h2>
        <ul class="nb_list link_white <c:if test='${empty param.p}'>hidden</c:if>" id="brandList">
            <li class="first slideTrigger">
                <div class="nb_list_slide"><a href="/home/list${one.category.id}.htm">${one.category.full_name}</a><em>&gt;</em>
                    <dl class="slideCon">
                        <dt>系列：</dt>
                        <dd><c:forEach var="unit" items="${one.currNode.children}">
                                <span><a href="/home/list${unit.data.id}.htm">${unit.data.full_name}</a></span></c:forEach>
                        </dd>
                    </dl>
                </div>
            </li>
            <li class="slideTrigger">
                <div class="nb_list_slide"><a href="/home/list${two.category.id}.htm">${two.category.full_name}</a><em>&gt;</em>
                    <dl class="slideCon">
                        <dt>系列：</dt>
                        <dd>
                            <c:forEach var="unit" items="${two.currNode.children}"><span><a href="/home/list${unit.data.id}.htm">${unit.data.full_name}</a></span></c:forEach>
                        </dd>
                    </dl>
                </div>
            </li>
            <li class="slideTrigger">
                <div class="nb_list_slide"><a href="/home/list${three.category.id}.htm">${three.category.full_name}</a><em>&gt;</em>
                    <dl class="slideCon">
                        <dt>系列：</dt>
                        <dd>
                            <c:forEach var="unit" items="${three.currNode.children}">
                                <span><a href="/home/list${unit.data.id}.htm">${unit.data.full_name}</a></span>
                            </c:forEach>
                        </dd>
                    </dl>
                </div>
            </li>
            <li class="slideTrigger">
                <div class="nb_list_slide"><a href="/home/list${four.category.id}.htm">${four.category.full_name}</a><em>&gt;</em>
                    <dl class="slideCon">
                        <dt>系列：</dt>
                        <dd>
                            <c:forEach var="unit" items="${four.currNode.children}">
                                <span><a href="/home/list${unit.data.id}.htm">${unit.data.full_name}</a></span>
                            </c:forEach>
                        </dd>
                    </dl>
                </div>
            </li>
            <li class="slideTrigger">
                <div class="nb_list_slide"><a href="/home/list${five.category.id}.htm">${five.category.full_name}</a><em>&gt;</em>
                    <dl class="slideCon">
                        <dt>系列：</dt>
                        <dd>
                            <c:forEach var="unit" items="${five.currNode.children}">
                                <span><a href="/home/list${unit.data.id}.htm">${unit.data.full_name}</a></span>
                            </c:forEach>
                        </dd>
                    </dl>
                </div>
            </li>
            <li class="slideTrigger">
                <div class="nb_list_slide"><a href="/home/list${six.category.id}.htm">${six.category.full_name}</a><em>&gt;</em>
                    <dl class="slideCon">
                        <dt>系列：</dt>
                        <dd>
                            <c:forEach var="unit" items="${six.currNode.children}">
                                <span><a href="/home/list${unit.data.id}.htm">${unit.data.full_name}</a></span>
                            </c:forEach>
                        </dd>
                    </dl>
                </div>
            </li>
            <li class="slideTrigger">
                <div class="nb_list_slide"><a href="/home/list${seven.category.id}.htm">${seven.category.full_name}</a><em>&gt;</em>
                    <dl class="slideCon">
                        <dt>系列：</dt>
                        <dd>
                            <c:forEach var="unit" items="${seven.currNode.children}">
                                <span><a href="/home/list${unit.data.id}.htm">${unit.data.full_name}</a></span>
                            </c:forEach>
                        </dd>
                    </dl>
                </div>
            </li>
            <li class="all"><a href="/home/list.htm">全部天酒品牌</a></li>
        </ul>
    </div>
    <div id="search" class="clearfix">
        <div class="hotwords link_white left">
            <c:forEach var="obj" items="${search.list}">
                <a href="${obj.href}" target="_blank">${obj.title}</a>
            </c:forEach>
        </div>
        <div class="i_search left">
            <form:form action="/home/search/list.htm" method="get">
                <input type="text" tabindex="1" name="keyword" value="${keyword}" class="s_input" />
                <input type="submit" tabindex="2" value="搜索" class="s_submit btn" />
            </form:form>
        </div>
        <div class="t_cart btn right">
            <ul class="clearfix">
                <li class="t_cart_num"><a href="#">购物车<span>10</span>件</a></li>
                <li class="t_cart_pay link_white fb"><a href="#">去结算</a></li>
            </ul>
        </div>
    </div>
</div><!-- end nav -->
<c:if test="${empty param.p}">
    <script type="text/javascript">
        slideMenus("#brand", "#brandList");
        slideMenus(".slideTrigger", ".slideCon");//二级菜单
    </script>
</c:if>
