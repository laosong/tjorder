package com.brains.prj.tianjiu.order.mvc;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-5
 * Time: 下午6:35
 * To change this template use File | Settings | File Templates.
 */

import java.io.*;
import java.util.*;
import java.lang.reflect.*;
import java.net.URL;

import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.commons.lang.StringUtils;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.util.WebUtils;
import org.springframework.util.ClassUtils;
import org.springframework.util.ResourceUtils;
import org.springframework.util.SystemPropertyUtils;

import com.easyvalidation.Validator;

import com.brains.prj.tianjiu.order.common.*;

public class OrderControlServlet extends HttpServlet {

    public static final String MAPPING_CONFIG_LOCATION_PARAM = "mappingConfigLocation";
    public static final String VALIDATOR_CONFIG_LOCATION_PARAM = "validatorConfigLocation";
    public static final String TEMPLATE_LOCATION_PARAM = "templateLocation";

    public static final String UTF_8 = "utf-8";

    HandlerMappingConfig mappingConfig = new HandlerMappingConfig();

    ApplicationContext applicationContext;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            applicationContext = WebApplicationContextUtils.getWebApplicationContext(config.getServletContext());

            String location = config.getInitParameter(MAPPING_CONFIG_LOCATION_PARAM);
            if (location != null) {
                if (!ResourceUtils.isUrl(location)) {
                    location = SystemPropertyUtils.resolvePlaceholders(location);
                    location = WebUtils.getRealPath(config.getServletContext(), location);
                } else {
                    URL url = ResourceUtils.getURL(location);
                    location = url.toString();
                }
                mappingConfig.initConfig(location);
            }
            location = config.getInitParameter(VALIDATOR_CONFIG_LOCATION_PARAM);
            if (location != null) {
                if (!ResourceUtils.isUrl(location)) {
                    location = SystemPropertyUtils.resolvePlaceholders(location);
                    location = WebUtils.getRealPath(config.getServletContext(), location);
                } else {
                    URL url = ResourceUtils.getURL(location);
                    location = url.toString();
                }
                Validator.initialize(location);
            }
            location = config.getInitParameter(TEMPLATE_LOCATION_PARAM);
            if (location != null) {
                location = WebUtils.getRealPath(config.getServletContext(), location);
                TemplateRender.initConfig(location, UTF_8);

                OrderControlDirective orderControlDirective = new OrderControlDirective();
                orderControlDirective.init(mappingConfig, applicationContext);
                TemplateRender.addSharedVariable("OrderControl", orderControlDirective);
            }
            JsonObjectMapper.initConfig(null, UTF_8);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    public void destroy() {
        super.destroy();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        _service(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        _service(req, resp);
    }

    protected void _service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding(UTF_8);

        String requestURI = req.getRequestURI();
        int jPos = requestURI.indexOf(";JSESSIONID=");
        if (jPos >= 0) {
            requestURI = requestURI.substring(0, jPos);
        }
        String[] parts = StringUtils.split(requestURI, '/');
        String path = parts[1];
        HandlerMapping handlerMapping = mappingConfig.getMapping(path);
        if (handlerMapping != null) {
            ContextUtils.setContext(req, resp);

            RequestContext requestContext = new RequestContext(req, resp);
            ResultContext resultContext = new ResultContext();

            SystemUser user = requestContext.getSystemUser();
            SystemUser.UserRole role = SystemUser.fromString(handlerMapping.getRole());

            try {
                if (role.compareTo(user.getUserRole()) > 0) {
                    if (requestContext.isJsonReq()) {
                        resp.setContentType("text/json;charset=utf-8");
                        resultContext.putResult("success", false);
                        resultContext.putResult("loginFrame", requestURI);
                        resultContext.setViewName("loginFrame");
                        JsonObjectMapper.process(resultContext.getViewTemplateFile(), resultContext.getResult(), resp.getWriter());
                    } else {
                        String redirect = requestURI;
                        if (req.getQueryString() != null) {
                            redirect += "?";
                            redirect += req.getQueryString();
                        }
                        resp.setContentType("text/html;charset=utf-8");
                        resultContext.putResult("success", false);
                        resultContext.putResult("redirect", redirect);
                        resultContext.setViewName("loginPage");
                        TemplateRender.process(resultContext.getViewTemplateFile(), resultContext.getResult(), resp.getWriter());
                    }
                } else {
                    List<com.easyvalidation.dto.Error> validateErrors = null;
                    if (handlerMapping.getValidator() != null) {
                        Map<String, Object> reqParametersMap = new HashMap<String, Object>();

                        Set<Map.Entry<String, String[]>> paraSet = req.getParameterMap().entrySet();
                        for (Map.Entry<String, String[]> entry : paraSet) {
                            reqParametersMap.put(entry.getKey(), entry.getValue()[0]);
                        }

                        validateErrors = Validator.checkValidations(handlerMapping.getValidator(), reqParametersMap);
                    }
                    if (validateErrors != null && validateErrors.size() > 0) {
                        resultContext.setError(new ValidateException(validateErrors));
                    } else {
                        Object controller = applicationContext.getBean(handlerMapping.getBean());
                        if (controller == null) {
                            throw new NoSuchMethodException();
                        }

                        Class clazz = controller.getClass();
                        Method handler = ClassUtils.getMethod(clazz, handlerMapping.getFunction(), RequestContext.class, ResultContext.class);
                        handler.invoke(controller, requestContext, resultContext);
                    }

                    if (requestContext.needJsonResp() || (requestContext.isJsonReq() && resultContext.hasError())) {
                        resp.setContentType("text/json;charset=utf-8");
                        JsonObjectMapper.process(resultContext.getViewTemplateFile(), resultContext.getResult(), resp.getWriter());
                    } else {
                        resp.setContentType("text/html;charset=utf-8");
                        TemplateRender.process(resultContext.getViewTemplateFile(), resultContext.getResult(), resp.getWriter());
                    }
                }

            } catch (NoSuchMethodException e) {
                throw new ServletException("NoSuchMethodException", e);
            } catch (IllegalAccessException e) {
                throw new ServletException("IllegalAccessException", e);
            } catch (InvocationTargetException e) {
                throw new ServletException("InvocationTargetException", e);
            } catch (freemarker.template.TemplateException e) {
                throw new ServletException("TemplateException", e);
            } finally {
                ContextUtils.resetContext();
            }
        } else {
            throw new ServletException("no handlerMapping");
        }
    }
}
