package com.brains.prj.tianjiu.order.mvc;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-5
 * Time: 下午3:46
 * To change this template use File | Settings | File Templates.
 */

import java.util.*;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;

import org.w3c.dom.*;

public class HandlerMappingConfig {

    private Map<String, HandlerMapping> mappingMap = new HashMap<String, HandlerMapping>();

    public void initConfig(String configFile) throws Exception {
        mappingMap.clear();

        DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();

        Document document = documentBuilder.parse(configFile);
        Element mappingsEle = document.getDocumentElement();
        NodeList nodeList = mappingsEle.getElementsByTagName("mapping");

        for (int i = 0; i < nodeList.getLength(); i++) {
            NamedNodeMap namedNodeMap = nodeList.item(i).getAttributes();

            String path = namedNodeMap.getNamedItem("path").getNodeValue();
            String bean = namedNodeMap.getNamedItem("bean").getNodeValue();
            String function = namedNodeMap.getNamedItem("function").getNodeValue();

            HandlerMapping mapping = new HandlerMapping();
            mapping.setPath(path);
            mapping.setBean(bean);
            mapping.setFunction(function);

            String role = null;
            Node node = namedNodeMap.getNamedItem("role");
            if (node != null) {
                role = node.getNodeValue();
            }
            String validator = null;
            node = namedNodeMap.getNamedItem("validator");
            if (node != null) {
                validator = node.getNodeValue();
            }
            mapping.setRole(role);
            mapping.setValidator(validator);

            mappingMap.put(path, mapping);
        }
    }

    public HandlerMapping getMapping(String path) {
        HandlerMapping mapping = null;
        if (mappingMap.containsKey(path)) {
            mapping = mappingMap.get(path);
        }
        return mapping;
    }
}
