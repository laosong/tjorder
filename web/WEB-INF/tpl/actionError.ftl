<#-- @ftlvariable name="error" type="java.lang.Exception" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>出错了</title>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
</head>
<body>
<div>
    <p>出错了<#if error??>${error.getMessage()}</#if></p>
</div>
</body>
</html>