<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<s:portlet var="c" url="/pl/comments-list.htm" param="pageNo=${param.pageNo}&owner_id=${param.pId}&login_name=${param.loginName}"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户评论列表</title>
    <c:import charEncoding="utf-8"  url="../JsCss.jsp" />
</head>
<body>
<div id="floater"></div>
<div id="centered">
    <c:import charEncoding="utf-8"  url="../AdminHeader.jsp" />
    <c:import charEncoding="utf-8"  url="../AdminTopNav.jsp?t=usr" />
        <div id="bottom-main">
            <c:import charEncoding="utf-8"  url="../AdminMenu-User.jsp?m=comments" />
                <div id="content">
                    <h1>用户评论列表</h1>
                    产品id: <input type="text" id="pId" value="${param.pId}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    用户登录名:<input type="text" id="loginName" value="${param.loginName}">
                    <tags:btn-search id="btn-search" actionScript="window.location.href = window.location.pathname+'?pId='+$('#pId').val()+'&loginName='+$('#loginName').val()" />
                    <jsp:useBean id="colInfo" class="java.util.ArrayList" scope="page"/>
                    <jsp:useBean id="rowData" class="java.util.ArrayList" scope="page"/>
                    <c:forEach var="unit" items="${c.list}" varStatus="status">
                        <tags:list-add list="${rowData}">${c.pageItemNum*(c.pageNo-1)+status.count}</tags:list-add>
                        <tags:list-add list="${rowData}">${unit.login_name}</tags:list-add>
                        <tags:list-add list="${rowData}"><fmt:formatDate value="${unit.created_date}" pattern="yyyy-MM-dd"/></tags:list-add>
                        <tags:list-add list="${rowData}">${unit.score}</tags:list-add>
                        <tags:list-add list="${rowData}"><a href="/home/product/${unit.owner_id}.htm" target="_blank">${unit.goods_title}</a></tags:list-add>
                        <tags:list-add list="${rowData}">${unit.msg}</tags:list-add>
                        <tags:list-add list="${rowData}"><tags:btn-del id="delBtn_${unit.id}" actionScript="window.location.href='comments-del${unit.id}.htm?toUrl='+window.location.href"/></tags:list-add>
                    </c:forEach>
                    <tags:table-row list="${colInfo}"  title="" width="4%" cssClass="right"  />
                    <tags:table-row list="${colInfo}"  title="用户" width="10%"/>
                    <tags:table-row list="${colInfo}"  title="日期"  width="13%" cssClass="center" />
                    <tags:table-row list="${colInfo}"  title="分" width="9%" cssClass="center"/>
                    <tags:table-row list="${colInfo}"  title="产品" width="18%"/>
                    <tags:table-row list="${colInfo}"  title="内容" width="30%"/>
                    <tags:table-row list="${colInfo}"  title="操作"  width="10%" cssClass="center" />
                    <tags:data-table id="zxl" data="${rowData}" colInfo="${colInfo}" maxPageNo="${c.maxPageNo}" pageNo="${c.pageNo}"   />
                </div>
        </div>
    <c:import charEncoding="utf-8" url="../AdminFooter.jsp" />
</div>
<div id="bottom-space"></div>
</body>
</html>
