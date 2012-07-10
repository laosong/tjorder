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

package com.easyvalidation.rules.impl;

import java.util.Map;

import org.apache.commons.validator.routines.RegexValidator;

import com.easyvalidation.rules.AbstractRule;
import com.easyvalidation.util.OgnlExpressionEvaluator;
import com.easyvalidation.util.Utils;

/**
 * This class compares the expression (i.e:- regular as well as OGNL
 * expression). It is based on the parameter regEx. If it is true then treat the
 * expression as regular expression otherwise OGNL expression
 * 
 */
public class ExpressionRule extends AbstractRule {

	private RegexValidator regexValidator = null;

	private String expression = null;

	private boolean regEx = false;

	private Map<String, Object> parameters = null;

	@Override
	/**
	 * Checks for error. As per parameter regEx, if true then regular expression otherwise OGNL.
	 */
	public final boolean checkError() {
		if (isRegEx()) {
			if (!Utils.isEmpty(getValue())) {
				regexValidator = new RegexValidator(getExpression());
				return !regexValidator.isValid(getValue().toString());
			}
		} else {
			return !OgnlExpressionEvaluator.getValue(expression, parameters);
		}
		return false;
	}

	public String getExpression() {
		return expression;
	}

	public void setExpression(String expression) {
		this.expression = expression;
	}

	public boolean isRegEx() {
		return regEx;
	}

	public void setRegEx(boolean regEx) {
		this.regEx = regEx;
	}

	public Map<String, Object> getParameters() {
		return parameters;
	}

	public void setParameters(Map<String, Object> parameters) {
		this.parameters = parameters;
	}

}
