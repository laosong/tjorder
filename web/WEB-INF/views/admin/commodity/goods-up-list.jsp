<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<jsp:useBean id="goodsTypes" class="java.lang.String" /><jsp:useBean id="pageTitle" class="java.lang.String" />
<c:if test="${param.price==0}">
    <c:set var="goodsTypes" value="types=2"/>
    <c:set var="pageTitle" value="0元品鉴商品-已上架"/>
</c:if>
<c:if test="${empty param.price}">
    <c:set var="goodsTypes" value="types=1"/>
    <c:set var="pageTitle" value="商品-已上架"/>
</c:if>
<s:portlet url="/pl/goods-list.htm" var="goods" param="state=2&${goodsTypes}&pageNo=${param.pageNo}&id=${param.pId}"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>${pageTitle}</title>
    <c:import charEncoding="utf-8"  url="../JsCss.jsp" />
</head>
<body>
<div id="floater"></div>
<div id="centered">
    <c:import charEncoding="utf-8"  url="../AdminHeader.jsp" />
    <c:import charEncoding="utf-8"  url="../AdminTopNav.jsp?t=commodity" />
    <div id="bottom-main">
        <c:import charEncoding="utf-8"  url="../AdminMenu-Commodity.jsp?m=goods${param.price}-up" />
        <div id="content">
            <h1>${pageTitle}</h1>
            产品id: <input type="text" id="pId" value="${param.pId}">&nbsp;&nbsp;
            <tags:btn-search id="btn-search" actionScript="window.location.href = window.location.pathname+'?pId='+$('#pId').val()" />
            <jsp:useBean id="colInfo" class="java.util.ArrayList" scope="page"/>
            <jsp:useBean id="rowData" class="java.util.ArrayList" scope="page"/>
            <c:forEach var="obj" items="${goods.list}" varStatus="status">
                <tags:list-add list="${rowData}">${goods.pageItemNum*(goods.pageNo-1)+status.count}</tags:list-add>
                <tags:list-add list="${rowData}">${obj.id}</tags:list-add>
                <tags:list-add list="${rowData}"><s:portlet url="/pl/category.htm" var="ca" param="id=${obj.category_id}"/>
                    ${ca.category.full_name}
                </tags:list-add>
                <tags:list-add list="${rowData}">${obj.title}</tags:list-add>
                <tags:list-add list="${rowData}">
                    <tags:btn-common id="preview_${obj.id}" iconClass="ui-icon-circle-zoomin" label="预览" actionScript="window.open('/home/product/${obj.id}.htm','_blank');"/>
                    <tags:btn-del id="delBtn_${obj.id}" actionScript="window.location.href='goods-del${obj.id}.htm?toUrl='+window.location.href"/>
                    <tags:btn-common id="up_${obj.id}" iconClass="ui-icon-circle-triangle-s" label="下架" actionScript="window.location.href='goods-updown.htm?id=${obj.id}&state=1&toUrl='+window.location.href"/>
                </tags:list-add>
            </c:forEach>
            <tags:table-row list="${colInfo}"  title="" width="5%" cssClass="right"  />
            <tags:table-row list="${colInfo}"  title="ID" width="10%" cssClass="center" />
            <tags:table-row list="${colInfo}"  title="分类"  width="20%" cssClass="left" />
            <tags:table-row list="${colInfo}"  title="标题" width="30%"/>
            <tags:table-row list="${colInfo}"  title="操作"  width="35%" cssClass="center" />
            <tags:data-table id="zxl" data="${rowData}" colInfo="${colInfo}" maxPageNo="${goods.maxPageNo}" pageNo="${goods.pageNo}"   />
        </div>
    </div>
    <c:import charEncoding="utf-8" url="../AdminFooter.jsp" />
</div>
<div id="bottom-space"></div>
</body>
</html>
