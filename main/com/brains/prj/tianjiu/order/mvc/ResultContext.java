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

    String templateView;
    Exception actionError;

    public ResultContext() {
    }

    public void putResult(String key, Object value) {
        resultMap.put(key, value);
    }

    public Map<String, Object> getResult() {
        return resultMap;
    }

    public void setTemplateView(String templateView) {
        this.templateView = templateView;
    }

    public String getTemplateView() {
        if (actionError != null) {
            return templateView == null ? "actionError" : templateView;
        } else {
            return templateView == null ? "actionError" : templateView;
        }
    }

    public void setError(Exception exception, String errorName, String errorView) {
        if (exception != null) {
            actionError = exception;
            templateView = errorView;

            putResult("success", false);
            if (errorName == null)
                errorName = "error";
            putResult(errorName, actionError);
        }
    }

    public boolean hasError() {
        return actionError != null;
    }
}
