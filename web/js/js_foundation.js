// wk means webkit

function helper_isListener()
{
    return document.addEventListener!=undefined;
}

function dom_winReady(fun)
{
    if(helper_isListener()) window.addEventListener( "load", fun, false );
    else window.attachEvent("onload",fun);
}

function dom_getId(id)
{
    return document.getElementById(id);
}

function dom_getClassName(className, parentElement)
{
    if(document.getElementsByClassName==undefined)
    {
        var elems = parentElement.getElementsByTagName("*");
        var clazzName = " "+className+" ";
        var result=[];
        for (i=0; j=elems[i]; i++){
            if ((" "+j.className+" ").indexOf(clazzName)!=-1) result.push(j);
        }
        return result;
    }
    else return parentElement.getElementsByClassName(className);
}

function dom_evtHandlerId(id, event, func)
{
    if(helper_isListener()) dom_getId(id).addEventListener(event, func, false);
    else dom_getId(id).attachEvent("on"+event,func);
}

function dom_evtHandlerObj(obj, event, func)
{
    if(helper_isListener()) obj.addEventListener(event, func, false);
    else obj.attachEvent("on"+event,func);
}

function util_setHref(href)
{
    window.location.href = href;
}

/*
 Replace Url, keep query string
 example:
 util_replaceUrl(new.htm);
 util_replaceUrl(window.location.href)
 */
function util_replaceUrl(url)
{
    var newUrl = url;
    var oldUrl = window.location.href;
    var start = oldUrl.indexOf("?");
    if ( start > 0) newUrl += oldUrl.substring(start);
    return newUrl;
}
/*
 Replace certain parameter in Url
 example:
 helper_replaceQueryString(window.location.href, 'editingId', null);
 helper_replaceQueryString(window.location.href, 'editingId', 10)
 */
function util_replaceQString2(param, value)
{
    return util_replaceQString3(window.location.href, param, value)
}
function util_replaceQString3(url, param, value)
{
    var preURL = ""; var postURL = ""; var newURL = "";

    var start = url.indexOf(param+"=");
    if(start > -1)
    {
        var end = url.indexOf("=", start);
        if(value != null) preURL=url.substring(0,end) +"="+value;
        else preURL = url.substring(0,start-1);

        var startRest = url.indexOf("&",start);
        postURL="";
        if(startRest > -1) postURL=url.substring(startRest);
    }
    else
    {
        var delimiter = "";
        preURL=url;
        if (url.indexOf("?") > 0) delimiter = '&';
        else delimiter = '?';
        if(value != null) postURL=delimiter+param+"="+value;
    }
    newURL = preURL+postURL;
    return newURL;
}