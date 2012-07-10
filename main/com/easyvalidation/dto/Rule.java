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

package com.easyvalidation.dto;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.configuration.PropertiesConfiguration;

import com.easyvalidation.common.ErrorMessages;
import com.easyvalidation.exception.ValidationException;
import com.easyvalidation.rules.IRule;
import com.easyvalidation.rules.RULETYPE;
import com.easyvalidation.rules.RangeRule;
import com.easyvalidation.rules.builder.RuleBuilder;
import com.easyvalidation.rules.impl.DateRangeRule;
import com.easyvalidation.rules.impl.ExpressionRule;
import com.easyvalidation.util.AttributePlaceHolder;
import com.easyvalidation.util.Utils;

/**
 * POJO class to rule related information like rule type, property, min , max
 * value, etc.
 */
public final class Rule {

	private IRule rule = null;

	private String property = null;

	private Object min = null;

	private Object max = null;

	private String key = null;

	private String dateFormat = null;

	private boolean regEx = false;

	private boolean useAttributePlaceHolder = false;

	private String message = null;

	private String expression = null;

	private Map<String, PropertiesConfiguration> propertiesMap = null;

	public Rule(String ruleType) {
		rule = RuleBuilder.buildRule(RULETYPE.getRuleType(ruleType));
	}

	public IRule getRule() {
		return rule;
	}

	public void setRule(IRule rule) {
		this.rule = rule;
	}

	public String getProperty() {
		return property;
	}

	public void setProperty(String property) {
		this.property = property;
	}

	public Object getMin() {
		return min;
	}

	public void setMin(Object min) {
		this.min = min;
	}

	public Object getMax() {
		return max;
	}

	public void setMax(Object max) {
		this.max = max;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getDateFormat() {
		return dateFormat;
	}

	public void setDateFormat(String dateFormat) {
		this.dateFormat = dateFormat;
	}

	public boolean isRegEx() {
		return regEx;
	}

	public void setRegEx(boolean regEx) {
		this.regEx = regEx;
	}

	public boolean isUseAttributePlaceHolder() {
		return useAttributePlaceHolder;
	}

	public void setUseAttributePlaceHolder(boolean useAttributePlaceHolder) {
		this.useAttributePlaceHolder = useAttributePlaceHolder;
	}

	public Map<String, PropertiesConfiguration> getPropertiesMap() {
		return propertiesMap;
	}

	public void setPropertiesMap(
			Map<String, PropertiesConfiguration> propertiesMap) {
		this.propertiesMap = propertiesMap;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getExpression() {
		return expression;
	}

	public void setExpression(String expression) {
		this.expression = expression;
	}

	public void populateRule() {
		if (rule instanceof RangeRule) {
			((RangeRule) rule).setMin(getMin());
			((RangeRule) rule).setMax(getMax());

			if (rule instanceof DateRangeRule) {
				((DateRangeRule) rule).setDateFormat(getDateFormat());
			}
		} else if (rule instanceof ExpressionRule) {
			((ExpressionRule) rule).setExpression(getExpression());
			((ExpressionRule) rule).setRegEx(isRegEx());
		}

		rule.setMessage(getMessage());
	}

	public void transformMessage(String locale) throws ValidationException {
		if (!Utils.isEmpty(propertiesMap) && !Utils.isEmpty(key)) {
			PropertiesConfiguration propertiesConfiguration = propertiesMap
					.get(locale);
			if (propertiesConfiguration != null) {
				message = propertiesConfiguration.getString(key);
			} else {
				throw new ValidationException(ErrorMessages.LOCALE_NOT_MAPPED);
			}
		}

		if (!Utils.isEmpty(message) && isUseAttributePlaceHolder()) {
			Map<String, Object> params = generateAttributeParamMap();
			message = AttributePlaceHolder.generateMesageFromPlaceHolder(
					message, params);
		}
		rule.setMessage(message);
	}

	private Map<String, Object> generateAttributeParamMap() {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("fieldName", property);
		params.put("min", min);
		params.put("max", max);
		params.put("dateFormat", dateFormat);

		return params;
	}
}