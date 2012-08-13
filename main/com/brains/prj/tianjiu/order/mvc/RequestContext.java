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
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.brains.groundwork.domain.User;
import com.brains.groundwork.support.UserSupport;

import com.brains.prj.tianjiu.order.common.*;

public class RequestContext {
    HttpServletRequest httpServletRequest;
    HttpServletResponse httpServletResponse;

    Map<String, String[]> requestParametersMap;

    public RequestContext(HttpServletRequest request, HttpServletResponse response) {
        this.httpServletRequest = request;
        this.httpServletResponse = response;
        requestParametersMap = request.getParameterMap();
    }

    public RequestContext(String queryString) {
        this.requestParametersMap = parseQueryString(queryString);
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

    private HttpServletRequest getRequest() {
        if (this.httpServletRequest == null) {
            this.httpServletRequest = ContextUtils.getThreadHttpServletRequest();
        }
        return this.httpServletRequest;
    }

    private SystemUser systemUser;

    public void setSystemUser(SystemUser systemUser) {
        this.systemUser = null;

        User user = new User();
        user.setId((long) systemUser.getUserId());
        user.setLogin_name(systemUser.getUserName());
        UserSupport.saveCurrentUser(getRequest(), user);
    }

    public SystemUser getSystemUser() {
        if (systemUser == null) {
            systemUser = new SystemUser();
            systemUser.setUserId(-1);
            User user = UserSupport.getCurrentUser(getRequest());
            if (user != null) {
                systemUser.setUserId(user.getId().intValue());
                systemUser.setUserName(user.getLogin_name());
                systemUser.setUserRole(SystemUser.UserRole.Normal);
            }
            if (systemUser.getUserId() < 0) {
                systemUser.setUserRole(SystemUser.UserRole.Anonymous);
            } else if (systemUser.getUserId() > 1000) {
                systemUser.setUserRole(SystemUser.UserRole.Admin);
            }
        }
        return systemUser;
    }

    public boolean isJsonReq() {
        return "json".equals(getParameter("reqDataType"));
    }

    public boolean needJsonResp() {
        return "json".equals(getParameter("respDataType"));
    }

    private static HashMap<String, String[]> parseQueryString(String s) {
        String[] valArray = null;

        if (s == null) {
            throw new IllegalArgumentException();
        }
        HashMap<String, String[]> ht = new HashMap<String, String[]>();
        StringBuilder sb = new StringBuilder();
        StringTokenizer st = new StringTokenizer(s, "&");
        while (st.hasMoreTokens()) {
            String pair = st.nextToken();
            int pos = pair.indexOf('=');
            if (pos == -1) {
                throw new IllegalArgumentException();
            }
            String key = parseName(pair.substring(0, pos), sb);
            String val = parseName(pair.substring(pos + 1, pair.length()), sb);
            if (ht.containsKey(key)) {
                String[] oldValues = (String[]) ht.get(key);
                valArray = new String[oldValues.length + 1];
                for (int i = 0; i < oldValues.length; i++)
                    valArray[i] = oldValues[i];
                valArray[oldValues.length] = val;
            } else {
                valArray = new String[1];
                valArray[0] = val;
            }
            ht.put(key, valArray);
        }
        return ht;
    }

    private static String parseName(String s, StringBuilder sb) {
        sb.setLength(0);
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            switch (c) {
                case '+':
                    sb.append(' ');
                    break;
                case '%':
                    try {
                        sb.append((char) Integer.parseInt(s.substring(i + 1, i + 3), 16));

                        i += 2;
                    } catch (NumberFormatException e) {
                        throw new IllegalArgumentException();
                    } catch (StringIndexOutOfBoundsException e) {
                        String rest = s.substring(i);
                        sb.append(rest);
                        if (rest.length() == 2) {
                            i++;
                        }
                    }

                default:
                    sb.append(c);
            }
        }
        return sb.toString();
    }
}
