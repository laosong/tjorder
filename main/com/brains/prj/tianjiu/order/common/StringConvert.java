package com.brains.prj.tianjiu.order.common;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-9
 * Time: 上午12:05
 * To change this template use File | Settings | File Templates.
 */
public class StringConvert {

    public static class ConvertException extends Exception {
    }

    public interface Converter<T> {
        T fromString(String str) throws ConvertException;
    }

    public static <T> T toType(String str, Converter<T> converter) throws ConvertException {
        return converter.fromString(str);
    }

    public static int toInt(String str) throws ConvertException {
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException e) {
            throw new ConvertException();
        }
    }

    public static class IntConverter implements Converter<Integer> {
        @Override
        public Integer fromString(String str) throws ConvertException {
            return Integer.parseInt(str);
        }
    }
}
