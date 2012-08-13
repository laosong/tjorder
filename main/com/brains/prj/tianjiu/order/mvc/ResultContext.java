package com.brains.prj.tianjiu.order.mvc;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-12
 * Time: 下午5:42
 * To change this template use File | Settings | File Templates.
 */

import java.util.Map;
import java.util.HashMap;

import com.brains.prj.tianjiu.order.common.*;

public class ResultContext {

    Map<String, Object> resultMap = new HashMap<String, Object>();

    String viewName;
    Exception actionError;

    public ResultContext() {
    }

    public void putResult(String key, Object value) {
        resultMap.put(key, value);
    }

    public Map<String, Object> getResult() {
        return resultMap;
    }

    public void setViewName(String viewName) {
        this.viewName = viewName;
    }

    public String getViewTemplateFile() {
        if (actionError != null) {
            return "actionError.ftl";
        } else {
            return viewName + ".ftl";
        }
    }

    public void setError(Exception e) {
        if (e != null) {
            actionError = e;

            putResult("success", false);
            String message = actionError.getMessage();
            if (message == null) {
                message = actionError.getClass().getName();
            }
            putResult("message", message);
        }
    }

    public boolean hasError() {
        return actionError != null;
    }
}
