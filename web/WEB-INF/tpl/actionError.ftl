<#-- @ftlvariable name="message" type="java.lang.String" -->
<@override name="title">错误_<@super/></@override>
<@override name="head_css">
<style type="text/css">
    .error_info {
        height: 180px;
        padding-top: 20px;
        text-align: center;
        color: #ff0000;
    }
</style>
</@override>
<@override name="body_content">
<div id="content">
    <div class="error_info">
        <span id="errorMessage"></span>
    </div>
</div>
</@override>
<@override name="body_footerjs">
<input type="hidden" id="error_hidden" value="${message!("error")?html}">
<script type="text/javascript">
    $(function () {
        var errorMsg = $("#error_hidden").val();
        $("#errorMessage").text(getLocaleMessage(errorMsg));
    });
</script>
</@override>
<@extends name="base.ftl"/>