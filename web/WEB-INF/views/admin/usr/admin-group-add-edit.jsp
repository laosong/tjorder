<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>组添加/修改</title>
    <c:import charEncoding="utf-8"  url="../JsCss.jsp" />
    <link rel="stylesheet" type="text/css" href="/css/admin/form.css" />
    <script type="text/javascript">
        $(function(){
            // Tabs
            var tabObj = $('#tabs').tabs();
            <c:if test="${! empty param.tab}">tabObj.tabs( "select" , ${param.tab} ) ;</c:if>
        });
    </script>
</head>
<body>
<div id="floater"></div>
<div id="centered">
    <c:import charEncoding="utf-8"  url="../AdminHeader.jsp" />
    <c:import charEncoding="utf-8"  url="../AdminTopNav.jsp?t=usr" />
    <div id="bottom-main">
        <c:import charEncoding="utf-8"  url="../AdminMenu-User.jsp?m=grp" />
        <div id="content">
            <h1>组添加/修改</h1>
            <div  class="simpleForm">
                <form:form commandName="cmd" action="/admin/usr/admin-group-add-edit${cmd.id}.htm" method="post">
                    <h2 align="center" style="color: red"><form:errors path="*"/></h2>
                    <input type="hidden" name="id" value="${cmd.id}"/>
                    <label>组代码：<span class="small">输入英文字母，要唯一</span></label>
                    <form:input path="grp_code"/>
                    <div class="spacer"></div>
                    <label>组名：<span class="small">中文，组名称</span></label>
                    <form:input path="grp_name"/>
                    <div class="spacer"></div>
                    <div id="tabs">
                        <ul>
                            <c:forEach items="${permList}" var="perm" varStatus="num0">
                                <li><a href="#tabs-${num0.count}">
                                    <c:if test="${perm.name=='commodity'}">商品权限</c:if>
                                    <c:if test="${perm.name=='user'}">用户登录权限</c:if></a>
                                </li>
                            </c:forEach>
                        </ul>
                        <c:forEach items="${permList}" var="perm" varStatus="num">
                            <div id="tabs-${num.count}">
                                <ul>
                                    <c:forEach items="${perm.list}" var="permData" varStatus="ct">
                                        <c:if test="${not permData.indent}"><li style="margin:6px 2px;">${permData.label}</li></c:if>
                                        <c:if test="${not permData.blank}">
                                            <label for="id_${num.count}_${ct.count}"  style="width: 100px;">${permData.label}</label>
                                            <s:get-property bean="${checkMap}" var="checked" property="${permData.perm}"  />
                                            <input id="id_${num.count}_${ct.count}"  name="permCB"
                                                   type="checkbox" value="${permData.perm}"
                                                   style="float: none; width: 40px; margin:4px 2px; border: none;"
                                                   <c:if test="${checked}">checked="checked"</c:if>
                                            /><br/>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="spacer"></div>
                    <label>&nbsp;<span class="small"></span></label>
                    <tags:btn-common id="sumbit_${cmd.id}" iconClass="ui-icon-check" label="提交" />
                    <tags:btn-common id="cancel_${cmd.id}" iconClass="ui-icon-close" label="返回" actionScript="window.location.href='admin-list.htm'" />
                </form:form>
            </div>

        </div>
    </div>
    <c:import charEncoding="utf-8" url="../AdminFooter.jsp" />
</div>
<div id="bottom-space"></div>
</body>
</html>
