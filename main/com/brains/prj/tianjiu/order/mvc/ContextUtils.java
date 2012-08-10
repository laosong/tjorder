package com.brains.prj.tianjiu.order.mvc;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-10
 * Time: 下午4:58
 * To change this template use File | Settings | File Templates.
 */
public class ContextUtils {
    private static final ThreadLocal<RequestContext> localRequestContext = new ThreadLocal<RequestContext>();

    public static void setCurrentRequestContext(RequestContext requestContext) {
        localRequestContext.set(requestContext);
    }

    public static RequestContext getCurrentRequestContext() {
        return localRequestContext.get();
    }
}
