<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<s:portlet url="/pl/grp-list.htm" var="grp" param=""/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加/修改品牌</title>
    <c:import charEncoding="utf-8"  url="../JsCss.jsp" />
    <link rel="stylesheet" type="text/css" href="/css/admin/form.css" />
    <link rel="stylesheet" type="text/css" href="/plugin/cal/jscal2.css" />
    <script type="text/javascript" src="/plugin/cal/jscal2.js"></script>
    <script type="text/javascript" src="/plugin/cal/lang/cn.js"></script>
    <script type="text/javascript" src="/plugin/ckeditor/ckeditor.js"></script>
</head>
<jsp:useBean id="navTab" class="java.lang.String"/><c:set var="navTab" value="commodity"/>
<jsp:useBean id="menu" class="java.lang.String"/><c:set var="menu" value="brand"/>
<body>
<div id="floater"></div>
<div id="centered">
    <c:import charEncoding="utf-8"  url="../AdminHeader.jsp" />
    <c:import charEncoding="utf-8"  url="../AdminTopNav.jsp?t=${navTab}" />
    <div id="bottom-main">
        <c:import charEncoding="utf-8"  url="../AdminMenu-Commodity.jsp?m=${menu}" />
        <div id="content">
            <h1>品牌添加/修改</h1>
            <div  class="simpleForm">
                <form:form id="addEditForm" commandName="cmd" action="/admin/commodity/brand-add-edit${param.cateId}.htm" method="post"  enctype="multipart/form-data">
                    <input type="hidden" id="toUrl" name="toUrl" value=""/>
                    <h2 align="center" style="color: red"><form:errors path="*"/></h2>
                    <!--
                    <label>简称：<span class="small">用于显示在Logo下面</span></label>
                    <form:input path="title"/>
                    <div class="spacer"></div>
                    -->
                    <label>厂家全称：<span class="small"></span></label>
                    <input type="text" name="manufacturer" value="${cmd.manufacturer}"/>
                    <div class="spacer"></div>
                    <label>发布时间：<span class="small">发布时间</span></label>
                    <form:input  path="publish_date" />
                    <script type="text/javascript">
                        var cal = Calendar.setup({onSelect: function(cal) { cal.hide() } });
                        cal.manageFields("publish_date", "publish_date", "%Y/%m/%d");
                    </script>
                    <div class="spacer"></div>
                    <label>经度：<span class="small"></span></label>
                    <input type="text" name="longitude" value="${cmd.longitude}" style="width: 50px;"/>
                    <label>维度：<span class="small"></span></label>
                    <input type="text" name="latitude" value="${cmd.latitude}" style="width: 50px;"/>
                    <div class="spacer"></div>
                    <s:portlet var="upfilePl" url="/pl/upfile-2list.htm" param="ownerId=${cmd.id}&ownerType=10&orderbyIndex=2"/>
                    <label>已上传文件：<span class="small"></span></label><br/>
                    <div style="font-size: 10pt;">
                        <c:forEach var="uList" items="${upfilePl.list}">
                            <div style="width: 80px;height:1px;float: left;" class=""></div>
                            <c:if test="${uList[0].label=='l-default'}">Logo图片:</c:if>
                            <c:if test="${ fn:startsWith(uList[0].label,'o-')}">&nbsp;其他图片:</c:if>
                            <c:forEach var="upfile" items="${uList}">
                                <a href="${upfile.path}" target="_blank">${upfile.file_name}</a>
                                <c:if test="${ upfile.mark=='-'}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
                                <tags:btn-del id="del_${upfile.id}"  style="font-size:8pt;" actionScript="window.location.href='upload-file-del${upfile.id}.htm?toUrl='+window.location.href"/>
                            </c:forEach>
                            <div class="clear"></div>
                        </c:forEach>
                    </div>
                    <div class="spacer"></div>
                    <c:set var="tick" value="<%=(new java.util.Date()).getTime()%>"/>
                    <label>Logo：<span class="small">此品牌logo图片</span></label>
                    <input type="hidden" name="upload-l.label" value="l-default">
                    <input type="hidden" name="upload-l.mark" value="-">
                    <input type="file" id="file-l" name="upload-l" />
                    <div class="spacer"></div>
                    <label>其他图片：<span class="small">可用于品牌介绍内容</span></label>
                    <input type="hidden" name="upload-o.label" value="o-${tick}">
                    <input type="hidden" name="upload-o.mark" value="-">
                    <input type="file" id="file-o" name="upload-o" />
                    <div class="spacer"></div>
                    <label>&nbsp;<span class="small"></span></label>
                    <tags:btn-common id="upload_${cmd.id}" actionScript="uploadFile();" iconClass="ui-icon-arrowthick-1-n" label="上传" />
                    <div class="spacer"></div>
                    <label>正文：<span class="small">此品牌介绍内容</span></label>
                    <div class="spacer"></div>
                    <textarea id="text" name="text"  >${cmd.text}</textarea>
                    <tags:editor field="text"/>
                    <div class="spacer"></div><br/>
                    <label>&nbsp;<span class="small"></span></label>
                    <tags:btn-common id="sumbit_${cmd.id}" iconClass="ui-icon-check" label="提交" />
                    <tags:btn-common id="cancel_${cmd.id}" iconClass="ui-icon-close" label="返回" actionScript="window.location.href='brand-list.htm'" />
                </form:form>
            </div>
        </div>
        <script>
            function uploadFile()
            {
                if($("#file-l").val()!=""||$("#file-o").val()!="")
                {
                    $( "#toUrl" ).val(window.location.href);
                    $("#addEditForm").submit();
                }
            }
        </script>
    </div>
    <c:import charEncoding="utf-8" url="../AdminFooter.jsp" />
</div>
<div id="bottom-space"></div>
</body>
</html>