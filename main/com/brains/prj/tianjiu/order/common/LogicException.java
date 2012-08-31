package com.brains.prj.tianjiu.order.common;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-30
 * Time: 下午2:50
 * To change this template use File | Settings | File Templates.
 */
public class LogicException extends Exception {
    private static final long serialVersionUID = 8596885929240229001L;

    @Override
    public String getMessage() {
        return getClass().getName();
    }
}
