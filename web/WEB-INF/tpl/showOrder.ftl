<!Doctype html>
<html>
<head>
    {%- block head %}
    <meta charset="utf-8" />
    <title>{% block title %}职途网-{% endblock %}</title>
    <meta name="description" content="" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
    {%- block head_css %}
    <link rel="stylesheet" type="text/css" href="/static/css/lib.css" />
    {%- if debug  %}
    <link rel="stylesheet/less" type="text/css" href="/static/less/main.less" />
    {%- endif %}
    {%- endblock %}
    {%- block head_js %}
    <script src="/static/js/lib.js" type="text/javascript"></script>
    {%- if debug  %}
    <script type="text/javascript" src="/static/js_src/less-1.2.1.js"></script>
    {%- endif %}
    {%- endblock %}
    {%- endblock %}
    {%- if not debug %}
    <script type="text/javascript">
        try {
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-24877934-1']);
            _gaq.push(['_setDomainName', 'jobto.cn']);
            _gaq.push(['_trackPageview']);
            (function() {
                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();
        }
        catch (e) {}
    </script>
    {%- endif %}
</head>
<body class="fixed-header">
{%- block body %}
{%- block body_head %}{%- endblock %}
{%- block body_content %}{%- endblock %}
{%- block body_foot %}
<div class="footer">
    <div class="container">
        <a href="#">新手入门</a><a href="#">职途指南</a><a href="#">建议反馈</a><a href="#">隐私协议</a>  © 2011 职途网 京ICP备11040530号
    </div>
</div>
{%- endblock %}
{%- block foot_js %}{%- endblock %}
{%- endblock %}
</body>
</html>