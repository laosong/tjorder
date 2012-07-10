/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package com.easyvalidation.xml.util;

import com.easyvalidation.common.Constants;
import com.easyvalidation.xml.common.Attributes;
import com.easyvalidation.xml.common.Nodes;

/**
 * Utility class to retieve XML node/attribute path
 * 
 */
public class RuleElementPathUtil {

	public static String getPropertiesPath(int index) {
		return Nodes.PROPERTIES + Constants.PARAN_START + index
				+ Constants.PARAN_END;
	}

	public static String getPropsFileLocale(int index) {
		return Nodes.PROPERTIES + Constants.PARAN_START + index
				+ Constants.PARAN_END + Constants.ATTRIBUTE_START
				+ Attributes.LOCALE + Constants.ATTRIBUTE_END;
	}

	public static String getPropsFilePath(int index) {
		return Nodes.FILE + Constants.PARAN_START + index + Constants.PARAN_END;
	}

	public static String getValidationName(int index) {
		return Nodes.VALIDATION + Constants.PARAN_START + index
				+ Constants.PARAN_END + Constants.ATTRIBUTE_START
				+ Attributes.NAME + Constants.ATTRIBUTE_END;
	}

	public static String getValidation(int index) {
		return Nodes.VALIDATION + Constants.PARAN_START + index
				+ Constants.PARAN_END;
	}

	public static String getRuleFieldName(int index) {
		return Nodes.RULE + Constants.PARAN_START + index + Constants.PARAN_END
				+ Constants.ATTRIBUTE_START + Attributes.FIELDNAME
				+ Constants.ATTRIBUTE_END;
	}

	public static String getRuleType(int index) {
		return Nodes.RULE + Constants.PARAN_START + index + Constants.PARAN_END
				+ Constants.ATTRIBUTE_START + Attributes.TYPE
				+ Constants.ATTRIBUTE_END;
	}

	public static String getRuleMessage(int index) {
		return Nodes.RULE + Constants.PARAN_START + index + Constants.PARAN_END
				+ Constants.DOT + Nodes.MESSAGE;
	}

	public static String getMessageKey(int index) {
		return Nodes.RULE + Constants.PARAN_START + index + Constants.PARAN_END
				+ Constants.DOT + Nodes.MESSAGE + Constants.ATTRIBUTE_START
				+ Attributes.KEY + Constants.ATTRIBUTE_END;
	}

	public static String getMessageUseAttributePlaceHolder(int index) {
		return Nodes.RULE + Constants.PARAN_START + index + Constants.PARAN_END
				+ Constants.DOT + Nodes.MESSAGE + Constants.ATTRIBUTE_START
				+ Attributes.USE_ATTRIBUTE_PLACEHOLDER
				+ Constants.ATTRIBUTE_END;
	}

	public static String getRuleMin(int index) {
		return Nodes.RULE + Constants.PARAN_START + index + Constants.PARAN_END
				+ Constants.DOT + Nodes.PARAM + Constants.ATTRIBUTE_START
				+ Attributes.MIN + Constants.ATTRIBUTE_END;
	}

	public static String getRuleMax(int index) {
		return Nodes.RULE + Constants.PARAN_START + index + Constants.PARAN_END
				+ Constants.DOT + Nodes.PARAM + Constants.ATTRIBUTE_START
				+ Attributes.MAX + Constants.ATTRIBUTE_END;
	}

	public static String getRuleDateFormat(int index) {
		return Nodes.RULE + Constants.PARAN_START + index + Constants.PARAN_END
				+ Constants.DOT + Nodes.PARAM + Constants.ATTRIBUTE_START
				+ Attributes.DATEFORMAT + Constants.ATTRIBUTE_END;
	}

	public static String getRuleRegEx(int index) {
		return Nodes.RULE + Constants.PARAN_START + index + Constants.PARAN_END
				+ Constants.DOT + Nodes.PARAM + Constants.ATTRIBUTE_START
				+ Attributes.REGEX + Constants.ATTRIBUTE_END;
	}
	
	public static String getRuleExpression(int index) {
		return Nodes.RULE + Constants.PARAN_START + index + Constants.PARAN_END
				+ Constants.DOT + Nodes.PARAM + Constants.ATTRIBUTE_START
				+ Attributes.EXPRESSION + Constants.ATTRIBUTE_END;
	}
}
