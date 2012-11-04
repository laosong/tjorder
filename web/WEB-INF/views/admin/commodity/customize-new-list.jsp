<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<s:portlet url="/pl/goods-list.htm" var="goods" param="flag_new=0&orderbyIndex=2"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>首页新品列表</title>
    <c:import charEncoding="utf-8"  url="../JsCss.jsp" />
    <script type="text/javascript" src="/plugin/buk/common.js"></script>
</head>
<jsp:useBean id="navTab" class="java.lang.String"/><c:set var="navTab" value="commodity"/>
<jsp:useBean id="menu" class="java.lang.String"/><c:set var="menu" value="c-new"/>
<jsp:useBean id="newUrl" class="java.lang.String"/><c:set var="newUrl" value="customize-add-edit.htm"/>
<body>
<div id="floater"></div>
<div id="centered">
    <c:import charEncoding="utf-8"  url="../AdminHeader.jsp" />
    <c:import charEncoding="utf-8"  url="../AdminTopNav.jsp?t=${navTab}" />
    <div id="bottom-main">
        <c:import charEncoding="utf-8"  url="../AdminMenu-Commodity.jsp?m=${menu}" />
        <div id="content">
            <h1>首页新品列表</h1>
            <jsp:useBean id="colInfo" class="java.util.ArrayList"/>
            <jsp:useBean id="rowData" class="java.util.ArrayList"/>
            <c:forEach var="unit" items="${goods.list}" varStatus="status">
                <c:if test="${param.editingId==unit.id}">
                    <tags:list-add list="${rowData}">${status.count}</tags:list-add>
                    <tags:list-add list="${rowData}">${unit.id}</tags:list-add>
                    <tags:list-add list="${rowData}">${unit.title}</tags:list-add>
                    <tags:list-add list="${rowData}"><input type="text" name="flag_new" size="3" value="${unit.flag_new}"></tags:list-add>
                    <tags:list-add list="${rowData}">
                        <tags:btn-common id="okBtn_${unit.data.id}" iconClass="ui-icon-check" label="确定" actionScript="$('#id').val(${unit.id});$('#toUrl').val(buk_replaceQueryString(window.location.href, 'editingId', null));$('#form').submit()"/>
                        <tags:btn-common id="cancelBtn_${unit.data.id}"  iconClass="ui-icon-close" label="取消" actionScript="window.location.href=buk_replaceQueryString(window.location.href, 'editingId', null)"/>
                    </tags:list-add>
                </c:if>
                <c:if test="${param.editingId!=unit.id}">
                    <tags:list-add list="${rowData}">${status.count}</tags:list-add>
                    <tags:list-add list="${rowData}">${unit.id}</tags:list-add>
                    <tags:list-add list="${rowData}">${unit.title}</tags:list-add>
                    <tags:list-add list="${rowData}">${unit.flag_new}</tags:list-add>
                    <tags:list-add list="${rowData}">
                        <c:if test="${empty param.editingId}">
                            <tags:btn-common id="editBtn_${unit.id}" iconClass="ui-icon-pencil" label="修改" actionScript="window.location.href =buk_replaceQueryString(window.location.href, 'editingId', ${unit.id})"/>
                        </c:if>
                        <c:if test="${!empty param.editingId}"><span style="line-height: 2.2em;">　</span> </c:if>
                    </tags:list-add>
                </c:if>
            </c:forEach>
            <c:if test="${empty param.editingId}">
                <tags:list-add list="${rowData}">＋</tags:list-add>
                <tags:list-add list="${rowData}"><input type="text" name="id"  id="id" size="8"></tags:list-add>
                <tags:list-add list="${rowData}"> - </tags:list-add>
                <tags:list-add list="${rowData}"><input type="text" name="flag_new"  size="3"></tags:list-add>
                <tags:list-add list="${rowData}"><tags:btn-new id="newBtn" actionScript="submitNew()"/></tags:list-add>
            </c:if>
            <tags:table-row list="${colInfo}"  title="" width="5%" cssClass="right"  />
            <tags:table-row list="${colInfo}"  title="ID" width="15%" cssClass="center" />
            <tags:table-row list="${colInfo}"  title="名称" width="30%" cssClass="left" />
            <tags:table-row list="${colInfo}"  title="权重"  width="15%" cssClass="right"/>
            <tags:table-row list="${colInfo}"  title=""  width="30%" cssClass="right" />
            <form id="form" name="form" method="post" action="${newUrl}">
                <tags:data-table id="zxl" data="${rowData}" colInfo="${colInfo}" maxPageNo="1" pageNo="1"   />
                <input type="hidden" id="toUrl" name="toUrl">
                <c:if test="${not empty param.editingId}"><input type="hidden" id="id" name="id"></c:if>
            </form>
            <div>注：权重设为0时，从列表中去除。</div>
        </div>
    </div>
    <c:import charEncoding="utf-8" url="../AdminFooter.jsp" />
</div>
<script>
    function submitNew()
    {
        $('#toUrl').val(buk_replaceQueryString(window.location.href, 'editingId', null));
        if($("#id").val()!="")
        {
            $('#form').submit();
        }
    }
</script>
</body>
</html>