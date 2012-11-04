<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $(function() {
        $("#top-nav-tabs").tabs(
                {
                    select: function(event, ui) {
                        var url = window.location.href;
                        switch(ui.index)
                        {
                            case 0: url="/admin/commodity/ad-list.htm"; break;
                            case 1: url="/admin/usr/admin-list.htm"; break;
                        }
                        window.location.href=url;
                        return false;
                    },    <c:choose>
                                <c:when test="${param.t == 'commodity' }" >selected: 0</c:when>
                                <c:when test="${param.t == 'usr' }" >selected: 1</c:when>
                                <c:when test="${param.t == 'order' }" >selected: 2</c:when>
                          </c:choose>
                }
        );
    });
</script>
<!-- ${param.t} -->
<div id="top-nav">
    <div id="top-nav-tabs" style="height: 30px;">
        <ul>
            <li><a href="1" class="nav-tab"><span >商品管理</span></a></li>
            <li><a href="2" class="nav-tab"><span >用户管理</span></a></li>
            <li><a href="3" class="nav-tab"><span >订单管理</span></a></li>
        </ul>
    </div>
</div>