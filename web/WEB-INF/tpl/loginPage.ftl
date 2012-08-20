<#-- @ftlvariable name="needRole" type="java.lang.Integer" -->
<#-- @ftlvariable name="redirect" type="java.lang.String" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>登录</title>
    <meta content="text/html; charset=utf-8" http-equiv=Content-Type>
<#if (needRole==2)>
    <meta http-equiv="refresh" content="0;url=/admin/usr/login.htm?toUrl=${redirect?url("utf-8")}">
<#else>
    <meta http-equiv="refresh" content="0;url=/home/user/login.htm?toUrl=${redirect?url("utf-8")}">
</#if>
</head>
<body>
</body>
</html>