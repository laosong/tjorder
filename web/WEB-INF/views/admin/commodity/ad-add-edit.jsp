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
    <title>添加/修改广告</title>
    <c:import charEncoding="utf-8"  url="../JsCss.jsp" />
    <link rel="stylesheet" type="text/css" href="/css/admin/form.css" />
    <link rel="stylesheet" type="text/css" href="/plugin/cal/jscal2.css" />
    <script type="text/javascript" src="/plugin/cal/jscal2.js"></script>
    <script type="text/javascript" src="/plugin/cal/lang/cn.js"></script>

</head>
<jsp:useBean id="navTab" class="java.lang.String"/><c:set var="navTab" value="commodity"/>
<jsp:useBean id="menu" class="java.lang.String"/><c:set var="menu" value="ad"/>
<body>
<div id="floater"></div>
<div id="centered">
    <c:import charEncoding="utf-8"  url="../AdminHeader.jsp" />
    <c:import charEncoding="utf-8"  url="../AdminTopNav.jsp?t=${navTab}" />
    <div id="bottom-main">
        <c:import charEncoding="utf-8"  url="../AdminMenu-Commodity.jsp?m=${menu}" />
        <div id="content">
            <h1>广告添加/修改</h1>
            <div  class="simpleForm">
                <form:form id="adForm" commandName="cmd" action="/admin/commodity/ad-add-edit${cmd.id}.htm" method="post" enctype="multipart/form-data">
                    <h2 align="center" style="color: red"><form:errors path="*"/></h2>
                    <input type="hidden" id="id" name="id" value="${cmd.id}"/>
                    <input type="hidden" id="stay" name="stay"/>
                    <label>位置代码：<span class="small">此广告项目标识（唯一）</span></label>
                    <form:input path="pos_cd"/>
                    <div class="spacer"></div>
                    <label>区域代码：<span class="small">此广告项目所在的区域标识</span></label>
                    <form:input path="area_cd"/>
                    <div class="spacer"></div>
                    <label>标题：<span class="small">此广告项目标题</span></label>
                    <form:input path="title"/>
                    <div class="spacer"></div>
                    <label>链接：<span class="small">此广告项目链接</span></label>
                    <form:input path="href"/>
                    <div class="spacer"></div>
                    <label>发布时间：<span class="small">发布时间</span></label>
                    <form:input  path="publish_date" />
                    <script type="text/javascript">
                        var cal = Calendar.setup({onSelect: function(cal) { cal.hide() } });
                        cal.manageFields("publish_date", "publish_date", "%Y/%m/%d");
                    </script>
                    <div class="spacer"></div>
                    <label>正文：<span class="small">此广告项目正文</span></label>
                    <textarea id="summary" name="text" cols="46" rows="6">${cmd.text}</textarea>
                    <div class="spacer"></div>
                    <s:portlet var="upfilePl" url="/pl/upfile-list.htm" param="ownerId=${cmd.id}&ownerType=4">
                        <c:forEach var="upfile" items="${upfilePl.list}">
                            <label>已上传文件：<span class="small"></span></label> <a href="${upfile.path}" target="_blank">${upfile.file_name}</a>
                            <c:if test="${not empty upfile.href}"><a href="${upfile.href}" target="_blank">指向的地址</a></c:if>
                            <tags:btn-del id="del_${upfile.id}" actionScript="window.location.href='/admin/commodity/upload-file-del${upfile.id}.htm?toUrl='+window.location.href"/>
                            <div class="spacer"></div><br/>
                        </c:forEach>
                    </s:portlet>
                    <!--
                    <label>文件链接：<span class="small">上传文件指向的地址</span></label>
                    <input type="text" name="upload.href">
                    <div class="spacer"></div>  -->
                    <label>上传：<span class="small">图片上传</span></label>
                    <input type="hidden" name="upload.label" value="l_${cmd.id}">
                    <input type="file" id="file" name="upload" /><tags:btn-common id="upload_${cmd.id}" actionScript="uploadFile();" iconClass="ui-icon-arrowthick-1-n" label="上传" />
                    <div class="spacer"></div>
                    <label>&nbsp;<span class="small"></span></label>
                    <tags:btn-common id="sumbit_${cmd.id}" iconClass="ui-icon-check" label="提交" />
                    <tags:btn-common id="cancel_${cmd.id}" iconClass="ui-icon-close" label="返回" actionScript="window.location.href='admin-list.htm'" />
                </form:form>
            </div>
        </div>
        <script>
            function uploadFile()
            {
                var fname = $("#file").val();
                var id = $("#id").val();
                if(fname!="")
                {
                    $( "#stay" ).val("1");
                    $("#adForm").submit();
                }
            }
        </script>
    </div>
    <c:import charEncoding="utf-8" url="../AdminFooter.jsp" />
</div>
<div id="bottom-space"></div>
</body>
</html>