package com.brains.prj.tianjiu.order.common;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-14
 * Time: 下午6:48
 * To change this template use File | Settings | File Templates.
 */
public class MessageUtils {

    public static String format(String format) {
        return format;
    }

    public static String format(String format, Object... args) {
        return java.text.MessageFormat.format(format, args);
    }
}
