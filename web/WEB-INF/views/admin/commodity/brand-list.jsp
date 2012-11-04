<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<jsp:useBean id="currCategoryId" class="java.lang.String"/>
<s:portlet url="/pl/category.htm" var="ca" param="id=0"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>品牌列表</title>
    <c:import charEncoding="utf-8"  url="../JsCss.jsp" />
    <script type="text/javascript" src="/plugin/buk/common.js"></script>
</head>
<jsp:useBean id="navTab" class="java.lang.String"/><c:set var="navTab" value="commodity"/>
<jsp:useBean id="menu" class="java.lang.String"/><c:set var="menu" value="brand"/>
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
            <h1>品牌</h1>
            <jsp:useBean id="colInfo" class="java.util.ArrayList"/>
            <jsp:useBean id="rowData" class="java.util.ArrayList"/>
            <c:forEach var="unit" items="${ca.currNode.children}" varStatus="status">
                <s:portlet url="/pl/brand-list.htm" var="brand" param="category_id=${unit.data.id}"/>
                <tags:list-add list="${rowData}">${status.count}</tags:list-add>
                <tags:list-add list="${rowData}">${unit.data.full_name}</tags:list-add>
                <tags:list-add list="${rowData}"><tags:date date="${brand.list[0].publish_date}"/></tags:list-add>
                <tags:list-add list="${rowData}">
                    <c:if test="${empty brand.list[0]}">
                        <tags:btn-new id="btn-new_${unit.data.id}" actionScript="window.location.href='brand-add-edit.htm?cateId=${unit.data.id}'" />
                    </c:if>
                    <c:if test="${not empty brand.list[0]}">
                        <tags:btn-common id="editBtn_${unit.data.id}" iconClass="ui-icon-pencil" label="修改" actionScript="window.location.href='brand-add-edit.htm?cateId=${unit.data.id}'" />
                        <tags:btn-del id="delBtn_${unit.data.id}" actionScript="window.location.href='brand-del${brand.list[0].id}.htm?toUrl='+window.location.href"/>
                    </c:if>
                </tags:list-add>
            </c:forEach>
            <tags:table-row list="${colInfo}"  title="" width="10%" cssClass="right"  />
            <tags:table-row list="${colInfo}"  title="品牌" width="30%" cssClass="center" />
            <tags:table-row list="${colInfo}"  title="发布时间" width="20%" cssClass="center" />
            <tags:table-row list="${colInfo}"  title=""  width="35%" cssClass="left" />
            <tags:data-table id="zxl" data="${rowData}" colInfo="${colInfo}" maxPageNo="1" pageNo="1"   />
        </div>
    </div>
    <c:import charEncoding="utf-8" url="../AdminFooter.jsp" />
</div>
</body>
</html>