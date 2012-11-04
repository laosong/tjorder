<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<s:portlet var="c" url="/pl/comments-list.htm" param="owner_id=${param.id}&pageItemNum=10&pageNo=${param.pageNo}"/>
<ul class="pro_comment_del mart10">
    <c:forEach var="unit" items="${c.list}">
    <li class="cmt">
        <div class="cmt_u clearfix"><p class="left">${unit.login_name}<span>|</span><i><fmt:formatDate value="${unit.created_date}" pattern="yyyy-MM-dd"/></i></p><p class="right btn cmt_stars stars_${unit.score}">星级</p></div>
        <p class="mart10">${unit.msg}</p>
    </li>
</c:forEach>
</ul>
<script type="text/javascript" >
    var pager = new Pager(${c.maxPageNo});
    pager.currPage = "${param.pageNo}";
    pager.numPageVisible = 10;
    function clickPager(obj)
    {
        $.get('/home/products/comments-list.htm?id=${param.id}&pageNo='+obj.currPage, function(data) {
            $('#comments-list').html(data);       // #comments-list define outside
        });
    }
    pager.clickFun = clickPager;
    pager.paginate("#pager-bottom");
</script>
<div><div id="pager-bottom" class="pager-default"></div></div>