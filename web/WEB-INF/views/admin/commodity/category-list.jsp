<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<jsp:useBean id="currCategoryId" class="java.lang.String"/>
<c:set var="currCategoryId" value="${param.id}"/>
<s:portlet url="/pl/category.htm" var="ca" param="id=${currCategoryId}"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>分类管理</title>
    <c:import charEncoding="utf-8"  url="../JsCss.jsp" />
    <script type="text/javascript" src="/plugin/buk/common.js"></script>
</head>
<jsp:useBean id="navTab" class="java.lang.String"/><c:set var="navTab" value="commodity"/>
<jsp:useBean id="menu" class="java.lang.String"/><c:set var="menu" value="category"/>
<jsp:useBean id="newUrl" class="java.lang.String"/><c:set var="newUrl" value="category-add.htm"/>
<jsp:useBean id="delUrl" class="java.lang.String"/><c:set var="delUrl" value="category-del"/>
<body>
<div id="floater"></div>
<div id="centered">
    <c:import charEncoding="utf-8"  url="../AdminHeader.jsp" />
    <c:import charEncoding="utf-8"  url="../AdminTopNav.jsp?t=${navTab}" />
    <div id="bottom-main">
        <c:import charEncoding="utf-8"  url="../AdminMenu-Commodity.jsp?m=${menu}" />
        <div id="content">
            <h1>类目列表</h1>
            <div style="margin-bottom: 15px; font-size: 14pt;">
                位置：
                <c:forEach var="p" items="${ca.path}">
                    <c:if test="${p.id==0}"><a href="category-list.htm">根</a> » </c:if>
                    <c:if test="${p.id!=0&&p.id!=param.id}"><a href="category-list.htm?id=${p.id}">${p.full_name}(${p.short_name})</a> » </c:if>
                    <c:if test="${p.id==param.id}">${p.full_name}(${p.short_name})</c:if>
                </c:forEach>
            </div>
            <jsp:useBean id="colInfo" class="java.util.ArrayList"/>
            <jsp:useBean id="rowData" class="java.util.ArrayList"/>
            <c:forEach var="unit" items="${ca.currNode.children}" varStatus="status">
                <c:if test="${param.editingId==unit.data.id}">
                    <tags:list-add list="${rowData}">${status.count}</tags:list-add>
                    <tags:list-add list="${rowData}"><input type="text" name="short_name" size="10" value="${unit.data.short_name}"></tags:list-add>
                    <tags:list-add list="${rowData}"><input type="text" name="full_name" size="10" value="${unit.data.full_name}"></a></tags:list-add>
                    <tags:list-add list="${rowData}"><input type="text" name="description" size="12" value="${unit.data.description}"></tags:list-add>
                    <tags:list-add list="${rowData}">
                        <tags:btn-common id="okBtn_${unit.data.id}" iconClass="ui-icon-check" label="确定" actionScript="$('#id').val(${unit.data.id});$('#toUrl').val(buk_replaceQueryString(window.location.href, 'editingId', null));$('#form').submit()"/>
                        <tags:btn-common id="cancelBtn_${unit.data.id}"  iconClass="ui-icon-close" label="取消" actionScript="window.location.href=buk_replaceQueryString(window.location.href, 'editingId', null)"/>
                    </tags:list-add>
                </c:if>
                <c:if test="${param.editingId!=unit.data.id}">
                    <tags:list-add list="${rowData}">${status.count}</tags:list-add>
                    <tags:list-add list="${rowData}">${unit.data.short_name}</tags:list-add>
                    <tags:list-add list="${rowData}"><a href="category-list.htm?id=${unit.data.id}">${unit.data.full_name}</a></tags:list-add>
                    <tags:list-add list="${rowData}">${unit.data.description}</tags:list-add>
                    <tags:list-add list="${rowData}">
                        <c:if test="${empty param.editingId}">
                            <tags:btn-common id="editBtn_${unit.data.id}" iconClass="ui-icon-pencil" label="修改" actionScript="window.location.href =buk_replaceQueryString(window.location.href, 'editingId', ${unit.data.id})"/>
                            <c:if test="${fn:length(unit.children)==0}"><tags:btn-del id="delBtn_${unit.data.id}" actionScript="window.location.href='${delUrl}${unit.data.id}.htm?toUrl='+window.location.href"/></c:if>
                        </c:if>
                        <c:if test="${!empty param.editingId}"><span style="line-height: 2.2em;">　</span> </c:if>
                    </tags:list-add>
                </c:if>
            </c:forEach>
            <c:if test="${empty param.editingId}">
                <tags:list-add list="${rowData}">＋</tags:list-add>
                <tags:list-add list="${rowData}"><input type="text" name="short_name" size="10"></tags:list-add>
                <tags:list-add list="${rowData}"><input type="text" name="full_name"  size="10"></tags:list-add>
                <tags:list-add list="${rowData}"><input type="text" name="description"  size="12"></tags:list-add>
                <tags:list-add list="${rowData}"><tags:btn-new id="newBtn" actionScript="$('#id').val(0);$('#toUrl').val(buk_replaceQueryString(window.location.href, 'editingId', null));$('#form').submit()"/></tags:list-add>
            </c:if>
            <tags:table-row list="${colInfo}"  title="" width="5%" cssClass="right"  />
            <tags:table-row list="${colInfo}"  title="标识" width="15%" cssClass="center" />
            <tags:table-row list="${colInfo}"  title="名称" width="15%" cssClass="center" />
            <tags:table-row list="${colInfo}"  title="描述"  width="35%" />
            <tags:table-row list="${colInfo}"  title=""  width="30%" cssClass="left" />
            <form id="form" name="form" method="post" action="${newUrl}">
                <tags:data-table id="zxl" data="${rowData}" colInfo="${colInfo}" maxPageNo="1" pageNo="1"   />
                <input type="hidden" id="toUrl" name="toUrl">
                <input type="hidden" id="pId" name="pId" value="${param.id}">
                <input type="hidden" id="id" name="id">
            </form>
        </div>
    </div>
    <c:import charEncoding="utf-8" url="../AdminFooter.jsp" />
</div>
</body>
</html>