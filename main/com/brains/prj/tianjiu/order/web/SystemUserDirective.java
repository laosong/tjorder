package com.brains.prj.tianjiu.order.web;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-10
 * Time: 下午5:08
 * To change this template use File | Settings | File Templates.
 */

import java.io.IOException;
import java.util.Map;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

import com.brains.prj.tianjiu.order.mvc.ContextUtils;
import com.brains.prj.tianjiu.order.mvc.RequestContext;

public class SystemUserDirective implements TemplateDirectiveModel {
    public final static String DIRECTIVE_NAME = "SystemUser";

    public void execute(Environment env,
                        Map params, TemplateModel[] loopVars,
                        TemplateDirectiveBody body) throws TemplateException, IOException {
        RequestContext rc = ContextUtils.getCurrentRequestContext();
        env.setVariable("systemUser", env.getObjectWrapper().wrap(rc.getSystemUser()));
    }

}