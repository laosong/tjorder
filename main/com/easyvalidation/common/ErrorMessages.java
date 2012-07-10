package com.easyvalidation.common;

public interface ErrorMessages {

	String NO_RULE_DEFINED = "Define the rules";

	String LOCALE_NOT_MAPPED = "Locale not mapped in validation XML file(s)";

	String ATTRIBUTE_NOT_SPECIFIED = "Attribute is not specified in error message, please check error message";

	String OGNL_PARSING_ERROR = "Error while parsing OGNL expression or expression variables may not be added in parameter map. Please check OGNL expression";
}
