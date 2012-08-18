package com.brains.prj.tianjiu.order.mvc;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-12
 * Time: 下午6:18
 * To change this template use File | Settings | File Templates.
 */

import java.io.Writer;

public class JsonObjectMapper {

    public static void initConfig(String templateDir, String encoding) throws java.io.IOException {
    }

    public static void process(String templateView, Object rootMap, Writer writer)
            throws java.io.IOException {
        org.codehaus.jackson.map.ObjectMapper objectMapper = new org.codehaus.jackson.map.ObjectMapper();
        objectMapper.writeValue(writer, rootMap);
    }
}
