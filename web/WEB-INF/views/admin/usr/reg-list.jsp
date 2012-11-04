<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<s:portlet url="/pl/user-list.htm" var="usr" param="types=1&pageNo=${param.pageNo}&login_name=${param.loginName}"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>注册用户列表</title>
    <c:import charEncoding="utf-8"  url="../JsCss.jsp" />
</head>
<body>
<div id="floater"></div>
<div id="centered">
    <c:import charEncoding="utf-8"  url="../AdminHeader.jsp" />
    <c:import charEncoding="utf-8"  url="../AdminTopNav.jsp?t=usr" />
        <div id="bottom-main">
            <c:import charEncoding="utf-8"  url="../AdminMenu-User.jsp?m=reg" />
                <div id="content">
                    <h1>注册用户列表</h1>
                    用户登录名: <input type="text" id="loginName" value="${param.loginName}">
                    <tags:btn-search id="btn-search" actionScript="window.location.href = window.location.pathname+'?loginName='+$('#loginName').val();" />
                    <jsp:useBean id="colInfo" class="java.util.ArrayList" scope="page"/>
                    <jsp:useBean id="rowData" class="java.util.ArrayList" scope="page"/>
                    <c:forEach var="unit" items="${usr.list}" varStatus="status">
                        <s:portlet url="/pl/grp-list.htm" var="grp" param="grp_code=${unit.group_cd}"/>
                        <tags:list-add list="${rowData}">${usr.pageItemNum*(usr.pageNo-1)+status.count}</tags:list-add>
                        <tags:list-add list="${rowData}"><a href="reg-add-edit${unit.id}.htm">${unit.login_name}</a></tags:list-add>
                        <tags:list-add list="${rowData}">${grp.list[0].grp_name}</tags:list-add>
                        <tags:list-add list="${rowData}">${unit.email}</tags:list-add>
                        <tags:list-add list="${rowData}"><fmt:formatDate value="${unit.created_date}" pattern="yyyy/MM/dd"/></tags:list-add>
                        <tags:list-add list="${rowData}"><tags:btn-del id="delBtn_${unit.id}" actionScript="window.location.href='reg-del${unit.id}.htm?toUrl='+window.location.href"/></tags:list-add>
                    </c:forEach>
                    <tags:table-row list="${colInfo}"  title="" width="8%" cssClass="right"  />
                    <tags:table-row list="${colInfo}"  title="登录名" width="15%"/>
                    <tags:table-row list="${colInfo}"  title="组"  width="20%" cssClass="center" />
                    <tags:table-row list="${colInfo}"  title="邮箱" width="20%"/>
                    <tags:table-row list="${colInfo}"  title="注册时间" width="15%" cssClass="center"/>
                    <tags:table-row list="${colInfo}"  title="操作"  width="15%" cssClass="center" />
                    <tags:data-table id="zxl" data="${rowData}" colInfo="${colInfo}" maxPageNo="${usr.maxPageNo}" pageNo="${usr.pageNo}"   />
                </div>
        </div>
    <c:import charEncoding="utf-8" url="../AdminFooter.jsp" />
</div>
<div id="bottom-space"></div>
</body>
</html>
