<#-- @ftlvariable name="message" type="java.lang.String" -->
<@override name="title">错误_<@super/></@override>
<@override name="head_css">
<style type="text/css">
    .error_info {
    }
</style>
</@override>
<@override name="body_content">
<div id="content">
    <div class="error_info">
        <span>${message!("error")}</span>
    </div>
</div>
</@override>
<@override name="body_footerjs">
<script type="text/javascript">
    $(function () {
    });
</script>
</@override>
<@extends name="base.ftl"/>