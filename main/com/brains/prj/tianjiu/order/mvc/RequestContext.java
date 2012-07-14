package com.brains.prj.tianjiu.order.mvc;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-5
 * Time: 下午9:46
 * To change this template use File | Settings | File Templates.
 */

import java.util.*;

import javax.servlet.http.*;

import com.brains.prj.tianjiu.order.common.*;

public class RequestContext {
    private HttpServletRequest request;

    private Map<String, String[]> requestParametersMap;
    private Map<String, Object> resultMap;

    private String viewName;
    private Exception actionError;

    public RequestContext(HttpServletRequest req) {
        request = req;
        requestParametersMap = req.getParameterMap();
        resultMap = new HashMap<String, Object>();
    }

    public String[] getParameters(String paraName) {
        return requestParametersMap.get(paraName);
    }

    public String getParameter(String paraName) {
        String[] pValues = requestParametersMap.get(paraName);
        if (pValues != null && pValues.length > 0) {
            return pValues[0];
        } else return null;
    }

    public int getParameterInt(String paraName) throws BadParameterException {
        String[] pValues = requestParametersMap.get(paraName);
        String pValue = null;
        if (pValues != null && pValues.length > 0) {
            pValue = pValues[0];
        }

        int result = 0;
        try {
            result = StringConvert.toInt(pValue);
        } catch (StringConvert.ConvertException e) {
            throw new BadParameterException("getParameterInt failed", paraName, pValue);
        }
        return result;
    }

    public void setSystemUser(SystemUser systemUser) {
        HttpSession session = request.getSession();
        session.setAttribute("__SystemUser", systemUser);
    }

    public SystemUser getSystemUser() {
        HttpSession session = request.getSession();
        Object obUser = session.getAttribute("__SystemUser");
        if (obUser == null || !(obUser instanceof SystemUser)) {
            SystemUser unknownUser = new SystemUser();
            unknownUser.setUserId(-1);
            unknownUser.setUserRole(SystemUser.UserRole.Anonymous);

            obUser = unknownUser;
            session.setAttribute("__SystemUser", unknownUser);
        }
        return (SystemUser) obUser;
    }

    public void putResult(String key, Object value) {
        resultMap.put(key, value);
    }

    public Map<String, Object> getResult() {
        return resultMap;
    }

    public boolean isJsonReq() {
        return "json".equals(request.getParameter("reqDataType"));
    }

    public boolean needJsonResp() {
        return "json".equals(request.getParameter("respDataType"));
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
