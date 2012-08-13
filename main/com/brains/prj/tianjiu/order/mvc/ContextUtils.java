package com.brains.prj.tianjiu.order.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-10
 * Time: 下午4:58
 * To change this template use File | Settings | File Templates.
 */
public class ContextUtils {
    static final ThreadLocal<HttpServletRequest> localRequest = new ThreadLocal<HttpServletRequest>();
    static final ThreadLocal<HttpServletResponse> localResponse = new ThreadLocal<HttpServletResponse>();

    public static void setContext(HttpServletRequest request, HttpServletResponse response) {
        localRequest.set(request);
        localResponse.set(response);
    }

    public static void resetContext() {
        localRequest.remove();
        localResponse.remove();
    }

    public static HttpServletRequest getThreadHttpServletRequest() {
        return localRequest.get();
    }

    public static HttpServletResponse getThreadHttpServletResponse() {
        return localResponse.get();
    }
}
