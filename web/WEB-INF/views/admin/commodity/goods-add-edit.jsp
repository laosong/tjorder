<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<s:portlet var="cate" url="/pl/cate-leaf-list.htm" param="splitter=»"/>
<s:newBean var="goodsTypes" classType="java.lang.Integer" initVal="1" /><jsp:useBean id="pageTitle" class="java.lang.String" />
<jsp:useBean id="toUrl" class="java.lang.String" />
<c:if test="${param.price==0}">
    <c:set var="goodsTypes" value="2"/>
    <c:set var="pageTitle" value="0元品鉴商品商品添加/修改"/>
    <c:set var="toUrl" value="/admin/commodity/goods0-down-list.htm"/>
</c:if>
<c:if test="${empty param.price}">
    <c:set var="pageTitle" value="商品添加/修改"/>
    <c:set var="toUrl" value="/admin/commodity/goods-down-list.htm"/>
</c:if>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>${pageTitle}</title>
    <c:import charEncoding="utf-8"  url="../JsCss.jsp" />
    <link rel="stylesheet" type="text/css" href="/css/admin/form.css" />
    <link rel="stylesheet" type="text/css" href="/plugin/cal/jscal2.css" />
    <script type="text/javascript" src="/plugin/cal/jscal2.js"></script>
    <script type="text/javascript" src="/plugin/cal/lang/cn.js"></script>
    <script type="text/javascript">
        $(function(){
            // Tabs
            var tabObj = $('#tabs').tabs();
            <c:if test="${! empty param.tab}">tabObj.tabs( "select" , ${param.tab} ) ;</c:if>
        });
    </script>
</head>
<jsp:useBean id="navTab" class="java.lang.String"/><c:set var="navTab" value="commodity"/>
<jsp:useBean id="menu" class="java.lang.String"/><c:set var="menu" value="goods${param.price}-down"/>
<body>
<div id="floater"></div>
<div id="centered">
    <c:import charEncoding="utf-8"  url="../AdminHeader.jsp" />
    <c:import charEncoding="utf-8"  url="../AdminTopNav.jsp?t=${navTab}" />
    <div id="bottom-main">
        <c:import charEncoding="utf-8"  url="../AdminMenu-Commodity.jsp?m=${menu}" />
        <div id="content">
            <h1>${pageTitle}</h1>
            <div  class="simpleForm" style="width: 700px;">
                <form:form id="addEditForm" commandName="cmd" action="/admin/commodity/goods-add-edit${cmd.id}.htm" method="post" enctype="multipart/form-data">
                    <h2 align="center" style="color: red"><form:errors path="*"/></h2>
                    <input type="hidden" name="id" value="${cmd.id}"/>
                    <input type="hidden" name="types" value="${goodsTypes}"/>
                    <input type="hidden" name="toUrl" value="${toUrl}"/>
                    <div id="tabs" style="border: none;">
                        <ul style="background: none;background-color:#fa9d88;font-size: 10pt;border: none;">
                            <li><a href="#tabs-1">基本信息</a></li>
                            <li><a href="#tabs-2">属性信息</a></li>
                            <li><a href="#tabs-3">详细信息</a></li>
                        </ul>
                        <div id="tabs-1">
                            <input type="hidden" id="toUrl" name="toUrl" value=""/>
                            <label>标题：<span class="small">此商品标题</span></label>
                            <form:input path="title"/>
                            <div class="spacer"></div>
                            <label>编号：<span class="small">此商品编号</span></label>
                            <form:input path="serial_num"/>
                            <div class="spacer"></div>
                            <label>分类：<span class="small">系列</span></label>
                            <form:select  path="category_id" >
                                <option value="0">请选择...</option>
                                <form:options items="${cate.list}" itemValue="id" itemLabel="full_name" htmlEscape="false"/>
                            </form:select>
                            <div class="spacer"></div>
                            <label>发布时间：<span class="small">发布时间</span></label>
                            <form:input  path="publish_date" />
                            <script type="text/javascript">
                                var cal = Calendar.setup({onSelect: function(cal) { cal.hide() } });
                                cal.manageFields("publish_date", "publish_date", "%Y/%m/%d");
                            </script>
                            <div class="spacer"></div>
                            <label>价格：<span class="small">输入整数或小数</span></label>
                            <form:input  path="price" />
                            <div class="spacer"></div>
                            <label>市场价：<span class="small">输入整数或小数</span></label>
                            <form:input  path="market_price" />
                            <div class="spacer"></div>
                            <label>库存数量：<span class="small">输入整数</span></label>
                            <form:input  path="quantity" />
                            <div class="spacer"></div>
                            <s:portlet var="upfilePl" url="/pl/upfile-2list.htm" param="ownerId=${cmd.id}&ownerType=1&orderbyIndex=2">
                                <label>已上传文件：<span class="small"></span></label><br/>
                                <div style="font-size: 10pt;">
                                    <c:forEach var="uList" items="${upfilePl.list}">
                                        <div style="width: 80px;height:1px;float: left;" class=""></div>
                                        <c:if test="${uList[0].label=='l-default'}">列表图片:</c:if>
                                        <c:if test="${ fn:startsWith(uList[0].label,'o-')}">其他图片:</c:if>
                                        <c:if test="${ fn:startsWith(uList[0].label,'p-')}">产品图片:</c:if>
                                        <c:forEach var="upfile" items="${uList}">
                                            <a href="${upfile.path}" target="_blank">${upfile.file_name}</a>
                                                <c:if test="${ upfile.mark=='s'}">(小)</c:if>
                                                <c:if test="${ upfile.mark=='m'}">(中)</c:if>
                                                <c:if test="${ upfile.mark=='b'}">(大)</c:if>
                                                <c:if test="${ upfile.mark=='-'}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
                                            <tags:btn-del id="del_${upfile.id}"  style="font-size:8pt;" actionScript="window.location.href='upload-file-del${upfile.id}.htm?toUrl='+window.location.href"/>
                                        </c:forEach>
                                        <div class="clear"></div>
                                    </c:forEach>
                                </div>
                                <div class="spacer"></div><br/>
                            </s:portlet>
                            <c:set var="tick" value="<%=(new java.util.Date()).getTime()%>"/>
                            <label>列表图片：<span class="small">显示在首页及列表页的图片</span></label>
                            <input type="hidden" name="upload-l.label" value="l-default">
                            <input type="hidden" name="upload-l.mark" value="-">
                            <input type="file" id="file-l" name="upload-l" />
                            <div class="spacer"></div>
                            <label>产品图片：<span class="small">小图</span></label>
                            <input type="hidden" name="upload-s.label" value="p-${tick}">
                            <input type="hidden" name="upload-s.mark" value="s">
                            <input type="file" id="file-s" name="upload-s" />
                            <div class="spacer"></div>
                            <label>产品图片：<span class="small">中图</span></label>
                            <input type="hidden" name="upload-m.label" value="p-${tick}">
                            <input type="hidden" name="upload-m.mark" value="m">
                            <input type="file" id="file-m" name="upload-m" />
                            <div class="spacer"></div>
                            <label>产品图片：<span class="small">大图</span></label>
                            <input type="hidden" name="upload-b.label" value="p-${tick}">
                            <input type="hidden" name="upload-b.mark" value="b">
                            <input type="file" id="file-b" name="upload-b" />
                            <div class="spacer"></div>
                            <label>其他图片：<span class="small">可用于产品描述等</span></label>
                            <input type="hidden" name="upload-o.label" value="o-${tick}">
                            <input type="hidden" name="upload-o.mark" value="-">
                            <input type="file" id="file-o" name="upload-o" />
                            <div class="spacer"></div>
                            <label>&nbsp;<span class="small"></span></label>
                            <tags:btn-common id="upload_${cmd.id}" actionScript="uploadFile();" iconClass="ui-icon-arrowthick-1-n" label="上传" />
                        </div>
                        <div id="tabs-2">
                            <label>容量：<span class="small">输入整数</span></label>
                            <form:input path="volume"/>ml
                            <div class="spacer"></div>
                            <label>度数：<span class="small">输入整数</span></label>
                            <form:input path="degree"/>度
                            <div class="spacer"></div>
                            <label>香型：<span class="small">输入文字</span></label>
                            <form:input path="flavor"/>
                            <div class="spacer"></div>
                            <label>推荐适用场合：<span class="small">输入文字</span></label>
                            <form:input path="occasion"/>
                            <div class="spacer"></div>
                            <label>规格：<span class="small">输入文字</span></label>
                            <form:input path="specs"/>
                            <div class="spacer"></div>
                            <label>生产许可证编号：<span class="small">输入文字</span></label>
                            <form:input path="permit_num"/>
                            <div class="spacer"></div>
                            <label>产品标准号：<span class="small">输入文字</span></label>
                            <form:input path="std_num"/>
                            <div class="spacer"></div>
                            <label>配料表：<span class="small">输入文字</span></label>
                            <form:input path="ele_table"/>
                            <div class="spacer"></div>
                            <label>商品条形码：<span class="small">输入文字</span></label>
                            <form:input path="bar_code"/>
                            <div class="spacer"></div>
                        </div>
                        <div id="tabs-3">
                            <label>商品描述：<span class="small">商品描述</span></label>
                            <div class="spacer"></div>
                            <textarea id="text" name="text"  >${cmd.text}</textarea>
                            <tags:editor field="text"/>
                            <div class="spacer"></div><br/>
                            <label>商品包装信息：<span class="small">商品包装信息</span></label>
                            <div class="spacer"></div>
                            <textarea id="package_info" name="package_info"  >${cmd.package_info}</textarea>
                            <tags:editor field="package_info"/>
                            <div class="spacer"></div><br/>
                            <label>质检信息：<span class="small">质检信息</span></label>
                            <div class="spacer"></div>
                            <textarea id="exam_report" name="exam_report"  >${cmd.exam_report}</textarea>
                            <tags:editor field="exam_report"/>
                            <div class="spacer"></div><br/>
                        </div>
                    </div>
                    <div class="spacer" style="height: 10px;"></div>
                    <label>&nbsp;<span class="small"></span></label>
                    <tags:btn-common id="sumbit_${cmd.id}" iconClass="ui-icon-check" label="提交" />
                    <tags:btn-common id="cancel_${cmd.id}" iconClass="ui-icon-close" label="返回" actionScript="window.location.href='goods-down-list.htm'" />
                </form:form>
            </div>
        </div>
        <script>
            function uploadFile()
            {
                if($("#file-l").val()!=""||$("#file-s").val()!=""||$("#file-m").val()!=""||
                        $("#file-b").val()!=""||$("#file-o").val()!="")
                {
                    $( "#toUrl" ).val(window.location.href);
                    $("#addEditForm").submit();
                }
            }
            /*
             $("#userForm").submit(function(event) {
             event.preventDefault();
             $.post( "admin-add-edit${cmd.id}.htm", $("#userForm").serialize(),
             function( data ) {
             window.location.href = "admin-list.htm";
             }
             );
             $( "#content" ).html("Waiting ...");
             });   */
        </script>
    </div>
    <c:import charEncoding="utf-8" url="../AdminFooter.jsp" />
</div>
<div id="bottom-space"></div>
</body>
</html>