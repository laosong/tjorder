<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://speedy.brains.com/jsp/tag" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="买茅台酒、劲酒、汾酒、国酒等各种白酒，上天酒商城." />
    <meta name="description" content="茅台酒,劲酒,汾酒,国酒,五粮液,高端白酒,天酒商城" />
    <title>关于我们_天酒商城</title>
    <link href="/css/base.css" rel="stylesheet" type="text/css"/>
    <link href="/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="/css/product.css" rel="stylesheet" type="text/css"/>
    <link href="/css/main.css" rel="stylesheet" type="text/css"/>
    <link href="/plugin/buk/buk.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.jqzoom.js"></script>
    <script type="text/javascript" src="/js/other.js"></script>
    <script type="text/javascript" language="javascript" src="/plugin/buk/pager.js"></script>
    <script type="text/javascript" src="/js/js_foundation.js"></script>
    <script type="text/javascript">
        function addfavorite()
        {
            if (document.all)
            {
                window.external.addFavorite('http://www.36519.cn/','高端白酒_天酒商城');
            }
            else if (window.sidebar)
            {
                window.sidebar.addPanel('高端白酒_天酒商城', 'http://www.36519.cn/', "");
            }
        }
    </script>
</head>
<body>
<c:import url="../topbar.jsp" charEncoding="utf-8"/>
<div id="container">
    <c:import url="../header.jsp" charEncoding="utf-8"/>
    <div id="content" class="noticeCon mart10">
        <div class="notice_del" style="line-height: 23px;">
            <h2 class="acticle_til fb txtcenter" style="margin-bottom: 10px;">关于我们</h2>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;仁怀市春秋酒业有限公司（即：天酒商场（36519.com）亦天酒网），是中国第一个专业电子商务B2C茅台酒水零售网站，公司凭借现代化电子商务平台和优质的服务主力从事茅台各种美酒的销售服务，主营包括茅台酒、习酒、国台、钓鱼台、久丰等茅台品牌，目前已与数十家茅台企业签订合作合同。</p>
            <h3 class="fb" style="margin-top: 10px;">管理团队</h3>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;天酒网管理团队不仅具有相当丰富的企业管理经验和资本运营经验，而且技术创新与市场开拓能力更是首屈一指，分别设有客服部、推广部、发展部、物流配送部、采购部、财务部、人事部等多个部门，团队平均年龄不到25岁，百分之九十以上是由大学本科及以上学历组成，团队不仅分工明确，而且充满激情与朝气。</p>
            <h3 class="fb" style="margin-top: 10px;">特色服务</h3>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;天酒网提倡诚信、快速、高质量的服务，坚持“货真价廉，快速送递”的特点，天酒网源于茅台，所有酒水渠道都由茅台直接提供，省去很多中间环节与费用，使产品价格最低化，天酒还提供业内最专业的退换货流程，请参考“退换货流程”。</p>
            <h3 class="fb" style="margin-top: 10px;">网站目标</h3>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;天酒网的发展目标是在3年内打造成为中国最专业的茅台美酒网上直销平台，天酒商场只专注茅台美酒，天酒商场的口号“购茅台美酒，上天酒商场”。</p>
        </div>
    </div><!-- end content -->
    <c:import url="../footer.jsp" charEncoding="utf-8"/>
</div>
</body>
</html>