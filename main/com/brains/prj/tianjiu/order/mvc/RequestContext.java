package com.brains.prj.tianjiu.order.mvc;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-5
 * Time: 下午9:46
 * To change this template use File | Settings | File Templates.
 */

import java.util.Map;
import java.util.HashMap;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import com.brains.groundwork.domain.User;
import com.brains.groundwork.support.UserSupport;

import com.brains.prj.tianjiu.order.common.*;

public class RequestContext {
    private HttpServletRequest request;

    private Map<String, String[]> requestParametersMap;
    private Map<String, Object> resultMap;

    private SystemUser systemUser;

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
        User user = new User();
        user.setId((long) systemUser.getUserId());
        user.setLogin_name(systemUser.getUserName());
        UserSupport.saveCurrentUser(request, user);
    }

    public SystemUser getSystemUser() {
        if (systemUser == null) {
            systemUser = new SystemUser();
            systemUser.setUserId(-1);
            User user = UserSupport.getCurrentUser(request);
            if (user != null) {
                systemUser.setUserId(user.getId().intValue());
                systemUser.setUserName(user.getLogin_name());
                systemUser.setUserRole(SystemUser.UserRole.Normal);
            }
            if (systemUser.getUserId() < 0) {
                systemUser.setUserRole(SystemUser.UserRole.Anonymous);
            }
        }
        return systemUser;
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
