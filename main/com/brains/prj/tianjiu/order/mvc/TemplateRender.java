package com.brains.prj.tianjiu.order.mvc;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-10
 * Time: 下午6:23
 * To change this template use File | Settings | File Templates.
 */

import java.io.*;
import java.util.Locale;

public class TemplateRender {
    static freemarker.template.Configuration ftConfig;

    public static void initConfig(String templateDir, String encoding) throws IOException {
        ftConfig = new freemarker.template.Configuration();
        ftConfig.setTemplateExceptionHandler(freemarker.template.TemplateExceptionHandler.HTML_DEBUG_HANDLER);
        ftConfig.setEncoding(Locale.getDefault(), encoding);
        ftConfig.setDirectoryForTemplateLoading(new File(templateDir));
    }

    public static void process(String templateFile, Object rootMap, Writer writer)
            throws freemarker.template.TemplateException, java.io.IOException {
        freemarker.template.Template template = ftConfig.getTemplate(templateFile);
        template.process(rootMap, writer);
    }

    public static String process(String templateFile, Object rootMap)
            throws freemarker.template.TemplateException, java.io.IOException {
        StringWriter stringWriter = new StringWriter();
        freemarker.template.Template template = ftConfig.getTemplate(templateFile);
        template.process(rootMap, stringWriter);
        String result = stringWriter.toString();
        stringWriter.close();
        return result;
    }
}
