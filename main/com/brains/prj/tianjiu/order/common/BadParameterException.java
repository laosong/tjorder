package com.brains.prj.tianjiu.order.common;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-10
 * Time: 下午9:44
 * To change this template use File | Settings | File Templates.
 */
public class BadParameterException extends Exception {
    private String parameterName;
    private String parameterValue;

    public BadParameterException(String message, String parameterName, String parameterValue) {
        super(message);
        this.parameterName = parameterName;
        this.parameterValue = parameterValue;
    }

    @Override
    public String getMessage() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(parameterName);
        stringBuilder.append("=[");
        stringBuilder.append(parameterValue);
        stringBuilder.append("]=>");
        stringBuilder.append(super.getMessage());
        return stringBuilder.toString();
    }
}
