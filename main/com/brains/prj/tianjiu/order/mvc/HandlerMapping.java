package com.brains.prj.tianjiu.order.mvc;

import java.io.Serializable;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-5
 * Time: 下午3:38
 * To change this template use File | Settings | File Templates.
 */
public class HandlerMapping implements Serializable {
    private static final long serialVersionUID = -1837476667542850408L;

    private String path;

    private String bean;

    private String method;

    private String role;

    private String validator;

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getBean() {
        return bean;
    }

    public void setBean(String bean) {
        this.bean = bean;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getValidator() {
        return validator;
    }

    public void setValidator(String validator) {
        this.validator = validator;
    }
}
