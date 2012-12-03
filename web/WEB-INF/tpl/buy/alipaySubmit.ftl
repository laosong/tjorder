<#-- @ftlvariable name="alipaySubmitForm" type="java.lang.String" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>重定向到支付宝</title>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
</head>
<body>
${alipaySubmitForm}
<script type="text/javascript">
    document.forms['alipaySubmitForm'].submit();
</script>
</body>
</html>