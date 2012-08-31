package com.brains.prj.tianjiu.order.mvc;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-12
 * Time: 下午4:52
 * To change this template use File | Settings | File Templates.
 */

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.util.ClassUtils;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import freemarker.ext.beans.BeansWrapper;


public class OrderControlDirective implements TemplateDirectiveModel {

    public final static String DIRECTIVE_NAME = "OrderControl";

    HandlerMappingConfig mappingConfig = new HandlerMappingConfig();

    ApplicationContext applicationContext;

    public void init(HandlerMappingConfig mappingConfig, ApplicationContext applicationContext) {
        this.mappingConfig = mappingConfig;
        this.applicationContext = applicationContext;
    }

    @Override
    public void execute(Environment env,
                        Map params, TemplateModel[] loopVars,
                        TemplateDirectiveBody body) throws TemplateException, IOException {
        TemplateModel requestContextModel = env.getGlobalVariable(FMTemplateRender.KEY_REQUEST);
        RequestContext requestContext = (RequestContext) BeansWrapper.getDefaultInstance().unwrap(requestContextModel, RequestContext.class);
        String para = "";
        if (params.containsKey("para")) {
            para = params.get("para").toString();
        }
        RequestContext rc = new RequestContext(requestContext.httpServletRequest, requestContext.httpServletResponse, para);
        ResultContext resultContext = new ResultContext();
        Object value = params.get("path");
        if (value != null) {
            String path = value.toString();
            HandlerMapping handlerMapping = mappingConfig.getMapping(path);
            if (handlerMapping != null) {
                try {
                    Object controller = applicationContext.getBean(handlerMapping.getBean());
                    if (controller == null) {
                        throw new NoSuchMethodException();
                    }

                    Class<?> clazz = controller.getClass();
                    Method handler = clazz.getMethod(handlerMapping.getMethod(), RequestContext.class, ResultContext.class);
                    handler.invoke(controller, rc, resultContext);

                    Map<String, Object> result = resultContext.getResult();
                    for (String key : result.keySet()) {
                        env.setVariable(key, env.getObjectWrapper().wrap(result.get(key)));
                    }

                } catch (NoSuchMethodException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
