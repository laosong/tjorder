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
    <title>管理员登录</title>
    <c:import charEncoding="utf-8"  url="../JsCss.jsp" />
    <link rel="stylesheet" type="text/css" href="/css/admin/form.css" />
    <script>
        $(function() {
            $( "#dialog" ).dialog({ draggable: false, closeOnEscape: false, closeText: 'hide', resizable: false, width: 550, height:450,
                open: function(event, ui) { $(this).parent().children().children('.ui-dialog-titlebar-close').hide();}
            });
        });
    </script>
</head>
<body>
<div id="floater"></div>
<div id="centered">
   <div id="bottom-main">
       <div id="dialog" title="登录">
           <div  class="simpleForm">
               <form:form commandName="cmd" action="/admin/usr/login.htm" method="post">
                   <input  type="hidden" name="toUrl" value="${__sCtrlInfo.prevInfo.fullUri}" />
                   <h2 align="center" style="color: red;font-size: 14pt;"><form:errors path="*"/></h2>
                   <label>登录名：<span class="small">管理员名称</span></label>
                   <form:input path="login_name"/>
                   <div class="spacer"></div>
                   <label>密码：<span class="small">登录密码</span></label>
                   <form:password path="login_pass"/>
                   <div class="spacer"></div>
                   <label>验证码：<span class="small">输入右边数字</span></label>
                   <input type="text" name="verifyCd" style="width:160px;"/>&nbsp; <img src="/verify_code.jpg" alt="验证码">
                   <div class="spacer"></div>
                   <label>&nbsp;<span class="small"></span></label>
                   <tags:btn-common id="sumbit_${cmd.id}" iconClass="ui-icon-check" label="登录" />
               </form:form>
           </div>
           <c:import charEncoding="utf-8" url="../AdminFooter.jsp" />
       </div>
   </div>
</div>
<div id="bottom-space"></div>
</body>
</html>