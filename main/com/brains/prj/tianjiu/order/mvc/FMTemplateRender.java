package com.brains.prj.tianjiu.order.mvc;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-10
 * Time: 下午6:23
 * To change this template use File | Settings | File Templates.
 */

import java.io.Writer;
import java.io.StringWriter;

import java.util.Locale;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveModel;
import freemarker.ext.beans.BeansWrapper;

import cn.org.rapid_framework.freemarker.directive.*;

public class FMTemplateRender {
    static freemarker.template.Configuration ftConfig;

    public static void initConfig(String templateDir, String encoding) throws java.io.IOException {
        ftConfig = new freemarker.template.Configuration();
        ftConfig.setTemplateExceptionHandler(freemarker.template.TemplateExceptionHandler.HTML_DEBUG_HANDLER);
        ftConfig.setLocale(Locale.SIMPLIFIED_CHINESE);
        ftConfig.setDefaultEncoding(encoding);
        ftConfig.setDirectoryForTemplateLoading(new java.io.File(templateDir));

        ftConfig.setSharedVariable("block", new BlockDirective());
        ftConfig.setSharedVariable("override", new OverrideDirective());
        ftConfig.setSharedVariable("extends", new ExtendsDirective());
        ftConfig.setSharedVariable("super", new SuperDirective());
    }

    public static void addSharedVariable(String name, TemplateDirectiveModel templateDirectiveModel) {
        ftConfig.setSharedVariable(name, templateDirectiveModel);
    }

    public static final String KEY_REQUEST = "__RequestContext";

    public static void process(RequestContext requestContext, ResultContext resultContext, Writer writer)
            throws freemarker.template.TemplateException, java.io.IOException {
        String templateView = resultContext.getTemplateView();
        freemarker.template.Template template = ftConfig.getTemplate(templateView + ".ftl");
        StringWriter stringWriter = new StringWriter();
        Environment environment = template.createProcessingEnvironment(resultContext.getResult(), stringWriter);
        environment.setGlobalVariable(KEY_REQUEST, BeansWrapper.getDefaultInstance().wrap(requestContext));
        environment.process();
        String result = stringWriter.toString();
        stringWriter.close();
        writer.write(result);
    }

    public static String process(String templateView, Object rootMap)
            throws freemarker.template.TemplateException, java.io.IOException {
        freemarker.template.Template template = ftConfig.getTemplate(templateView + ".ftl");
        StringWriter stringWriter = new StringWriter();
        template.process(rootMap, stringWriter);
        String result = stringWriter.toString();
        stringWriter.close();
        return result;
    }
}
