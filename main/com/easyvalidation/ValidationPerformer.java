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

package com.easyvalidation;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.easyvalidation.common.ErrorMessages;
import com.easyvalidation.dto.Rule;
import com.easyvalidation.exception.ValidationException;
import com.easyvalidation.rules.IRule;
import com.easyvalidation.rules.impl.ExpressionRule;
import com.easyvalidation.util.Utils;
import com.easyvalidation.xml.processor.XMLProcessor;
import com.easyvalidation.dto.Error;

/**
 * It is a central class to process all the rules, initialize validation rules,
 * check errors. It is a singletone class.
 */
final class ValidationPerformer {

	private static ValidationPerformer validationPerformer = null;

	private Map<String, List<Rule>> validationMap = null;

	private ValidationPerformer() {
	}

	/**
	 * Generate singletone instance of type ValidationPerformer
	 * 
	 * @return
	 */
	public synchronized static ValidationPerformer getInstance() {
		if (validationPerformer == null) {
			validationPerformer = new ValidationPerformer();
		}
		return validationPerformer;
	}

	/**
	 * Locate & intialize validation framework, also load .properties files (if
	 * any mentioned in the XML)
	 * 
	 * @param fileNames
	 * @throws ValidationException
	 */
	public void doInit(String[] fileNames) throws ValidationException {
		validationMap = XMLProcessor.parseXML(fileNames);
	}

	/**
	 * Check validation with validation name & parameter map supplied
	 * 
	 * @param validationName
	 * @param parameters
	 * @param locale
	 * @return
	 * @throws ValidationException
	 */
	public List<Error> checkRule(String validationName,
			Map<String, Object> parameters, String locale)
			throws ValidationException {
		locale = locale.toUpperCase();
		if (Utils.isEmpty(validationMap)) {
			throw new ValidationException(new Exception(
					ErrorMessages.NO_RULE_DEFINED));
		}

		List<Error> errorMessageList = null;
		if (validationMap.containsKey(validationName)) {
			errorMessageList = new ArrayList<Error>();
			List<Rule> ruleList = validationMap.get(validationName);
			if (!Utils.isEmpty(ruleList)) {
				for (Rule rule : ruleList) {
					String property = rule.getProperty();
					rule.transformMessage(locale);
					if (true || Utils.isEmpty(property)
							|| parameters.containsKey(property)) {
						IRule objRule = rule.getRule();
						if (!Utils.isEmpty(property)) {
							Object value = parameters.get(property);
							objRule.setValue(value);
						}

						if (objRule instanceof ExpressionRule) {
							((ExpressionRule) objRule)
									.setParameters(parameters);
						}
						String messge = objRule.doValidate();
						if (!Utils.isEmpty(messge)) {
							Error errorMessage = new Error();
							errorMessage.setFieldName(property);
							errorMessage.setMessage(messge);
							errorMessageList.add(errorMessage);
						}
					}
				}
			}
		}
		return errorMessageList;
	}

}