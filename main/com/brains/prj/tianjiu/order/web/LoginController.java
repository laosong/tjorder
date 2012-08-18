package com.brains.prj.tianjiu.order.web;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-11
 * Time: 下午7:54
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;

import com.brains.prj.tianjiu.order.common.BadParameterException;
import com.brains.prj.tianjiu.order.common.StringConvert;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.common.SystemUser;
import com.brains.prj.tianjiu.order.mvc.RequestContext;
import com.brains.prj.tianjiu.order.mvc.ResultContext;

@Controller
public class LoginController {

    public static final String DEFAULT_REDIRECT = "/";

    public void getSystemUser(RequestContext rc, ResultContext result) {
        result.putResult("systemUser", rc.getSystemUser());
    }

    public void showLoginPage(RequestContext rc, ResultContext result) {
        try {
            result.putResult("redirect", DEFAULT_REDIRECT);
            result.setTemplateView("loginPage");
        } catch (IllegalArgumentException e) {
            result.setError(e, null);
        }
    }

    public void login(RequestContext rc, ResultContext result) {

        try {
            String userName = rc.getParameter("username");
            String userPwd = rc.getParameter("userpwd");
            String redirect = rc.getParameter("redirect");

            int userId = rc.getParameterInt("username");

            SystemUser user = new SystemUser();
            user.setUserId(userId);
            user.setUserName("User" + userId);
            user.setUserRole(SystemUser.UserRole.Normal);

            rc.setSystemUser(user);
            if (redirect == null)
                redirect = DEFAULT_REDIRECT;
            result.putResult("redirect", redirect);

            result.setTemplateView("loginOk");
        } catch (BadParameterException e) {
            result.setError(e, null);
        }
    }

    public void logout(RequestContext rc, ResultContext result) {
        try {
            SystemUser user = new SystemUser();
            user.setUserId(-1);
            user.setUserRole(SystemUser.UserRole.Anonymous);
            rc.setSystemUser(user);

            result.setTemplateView("loginOk");
        } catch (IllegalArgumentException e) {
            result.setError(e, null);
        }
    }
}
