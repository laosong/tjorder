<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<s:portlet url="/pl/grp-list.htm" var="grp" param=""/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>组列表</title>
    <c:import charEncoding="utf-8"  url="../JsCss.jsp" />
</head>
<jsp:useBean id="navTab" class="java.lang.String"/><c:set var="navTab" value="usr"/>
<jsp:useBean id="menu" class="java.lang.String"/><c:set var="menu" value="grp"/>
<jsp:useBean id="newUrl" class="java.lang.String"/><c:set var="newUrl" value="admin-group-add-edit.htm"/>
<jsp:useBean id="delUrl" class="java.lang.String"/><c:set var="delUrl" value="admin-group-del"/>
<body>
<div id="floater"></div>
<div id="centered">
    <c:import charEncoding="utf-8"  url="../AdminHeader.jsp" />
    <c:import charEncoding="utf-8"  url="../AdminTopNav.jsp?t=${navTab}" />
    <div id="bottom-main">
        <c:import charEncoding="utf-8"  url="../AdminMenu-User.jsp?m=${menu}" />
        <div id="content">
            <h1>组列表</h1>
            <tags:btn-new id="btn-new" actionScript="window.location.href='${newUrl}'" />
            <jsp:useBean id="colInfo" class="java.util.ArrayList" scope="page"/>
            <jsp:useBean id="rowData" class="java.util.ArrayList" scope="page"/>
            <c:forEach var="unit" items="${grp.list}" varStatus="status">
                <tags:list-add list="${rowData}">${grp.pageItemNum*(grp.pageNo-1)+status.count}</tags:list-add>
                <tags:list-add list="${rowData}">${unit.grp_code}</tags:list-add>
                <tags:list-add list="${rowData}"><a href="admin-group-add-edit${unit.id}.htm">${unit.grp_name}</a></tags:list-add>
                <tags:list-add list="${rowData}"><tags:btn-del id="delBtn_${unit.id}" actionScript="window.location.href='${delUrl}${unit.id}.htm?toUrl='+window.location.href"/></tags:list-add>
            </c:forEach>
            <tags:table-row list="${colInfo}"  title="" width="15%" cssClass="right"  />
            <tags:table-row list="${colInfo}"  title="组代码" width="15%"/>
            <tags:table-row list="${colInfo}"  title="组名称" width="45%"/>
            <tags:table-row list="${colInfo}"  title="操作"  width="25%" cssClass="center" />
            <tags:data-table id="zxl" data="${rowData}" colInfo="${colInfo}" maxPageNo="${grp.maxPageNo}" pageNo="${grp.pageNo}"   />
        </div>
    </div>
    <c:import charEncoding="utf-8" url="../AdminFooter.jsp" />
</div>
<div id="bottom-space"></div>
</body>
</html>