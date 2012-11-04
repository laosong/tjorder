<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<s:portlet url="/pl/news-list.htm" var="news" param=""/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>公告列表</title>
    <c:import charEncoding="utf-8"  url="../JsCss.jsp" />
</head>
<body>
<div id="floater"></div>
<div id="centered">
    <c:import charEncoding="utf-8"  url="../AdminHeader.jsp" />
    <c:import charEncoding="utf-8"  url="../AdminTopNav.jsp?t=commodity" />
        <div id="bottom-main">
            <c:import charEncoding="utf-8"  url="../AdminMenu-Commodity.jsp?m=news" />
                <div id="content">
                    <h1>公告列表</h1>
                    <tags:btn-new id="btn-new" actionScript="window.location.href='news-add-edit.htm'" />
                    <jsp:useBean id="colInfo" class="java.util.ArrayList" scope="page"/>
                    <jsp:useBean id="rowData" class="java.util.ArrayList" scope="page"/>
                    <c:forEach var="obj" items="${news.list}" varStatus="status">
                        <tags:list-add list="${rowData}">${news.pageItemNum*(news.pageNo-1)+status.count}</tags:list-add>
                        <tags:list-add list="${rowData}"><a href="news-add-edit${obj.id}.htm">${obj.title}</a></tags:list-add>
                        <tags:list-add list="${rowData}"><tags:date date="${obj.publish_date}"/></tags:list-add>
                        <tags:list-add list="${rowData}"><tags:btn-del id="delBtn_${obj.id}" actionScript="window.location.href='news-del${obj.id}.htm?toUrl='+window.location.href"/></tags:list-add>
                    </c:forEach>
                    <tags:table-row list="${colInfo}"  title="" width="10%" cssClass="right"  />
                    <tags:table-row list="${colInfo}"  title="标题" width="45%"/>
                    <tags:table-row list="${colInfo}"  title="发布时间"  width="30%" cssClass="center" />
                    <tags:table-row list="${colInfo}"  title="操作"  width="15%" cssClass="center" />
                    <tags:data-table id="zxl" data="${rowData}" colInfo="${colInfo}" maxPageNo="${news.maxPageNo}" pageNo="${news.pageNo}"   />
                </div>
        </div>
    <c:import charEncoding="utf-8" url="../AdminFooter.jsp" />
</div>
<div id="bottom-space"></div>
</body>
</html>
