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

package com.easyvalidation.xml.processor;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.configuration.HierarchicalConfiguration;
import org.apache.commons.configuration.PropertiesConfiguration;

import com.easyvalidation.dto.Rule;
import com.easyvalidation.exception.ValidationException;
import com.easyvalidation.util.Utils;
import com.easyvalidation.xml.common.Nodes;
import com.easyvalidation.xml.config.EasyValidationXmlConfiguration;
import com.easyvalidation.xml.util.RuleElementPathUtil;

/**
 * The class is to parse validation XML.
 * 
 */
public class XMLProcessor {

	/**
	 * Parse the XML & return list of rules.
	 * 
	 * @param fileNames
	 * @return
	 * @throws ValidationException
	 */
	public static Map<String, List<Rule>> parseXML(String[] fileNames)
			throws ValidationException {
		Map<String, List<Rule>> validationMap = new HashMap<String, List<Rule>>();

		EasyValidationXmlConfiguration configuration = new EasyValidationXmlConfiguration();
		configuration.setAutoSave(false);
		configuration.clear();
		configuration.setValidating(true);

		try {
			for (String fileName : fileNames) {
				configuration.load(fileName);
			}

			boolean isMessageFromKeyAllowed = false;

			Map<String, PropertiesConfiguration> propertiesMap = new HashMap<String, PropertiesConfiguration>();
			int propertiesSize = configuration.getMaxIndex(Nodes.PROPERTIES);
			for (int propertiesIndex = 0; propertiesIndex <= propertiesSize; propertiesIndex++) {

				String locale = configuration.getString(RuleElementPathUtil
						.getPropsFileLocale(propertiesIndex));

				PropertiesConfiguration propertiesConfiguration = new PropertiesConfiguration();
				propertiesConfiguration.setAutoSave(false);
				propertiesConfiguration.clear();

				HierarchicalConfiguration subConfig = configuration
						.configurationAt(RuleElementPathUtil
								.getPropertiesPath(propertiesIndex));
				int propFileSize = subConfig.getMaxIndex(Nodes.FILE);
				for (int propFileIndex = 0; propFileIndex <= propFileSize; propFileIndex++) {
					String propFileName = subConfig
							.getString(RuleElementPathUtil
									.getPropsFilePath(propFileIndex));
					if (!Utils.isEmpty(propFileName)) {
						propertiesConfiguration.load(propFileName);
					}
				}
				propertiesMap.put(locale, propertiesConfiguration);
			}

			if (!propertiesMap.isEmpty()) {
				isMessageFromKeyAllowed = true;
			}

			int validationSize = configuration.getMaxIndex(Nodes.VALIDATION);

			for (int validationIndex = 0; validationIndex <= validationSize; validationIndex++) {
				String name = configuration.getString(RuleElementPathUtil
						.getValidationName(validationIndex));

				HierarchicalConfiguration subConfig = configuration
						.configurationAt(RuleElementPathUtil
								.getValidation(validationIndex));

				int ruleSize = subConfig.getMaxIndex(Nodes.RULE);
				List<Rule> ruleList = new ArrayList<Rule>();
				for (int ruleIndex = 0; ruleIndex <= ruleSize; ruleIndex++) {
					String ruleType = subConfig.getString(RuleElementPathUtil
							.getRuleType(ruleIndex));

					String property = subConfig.getString(RuleElementPathUtil
							.getRuleFieldName(ruleIndex));

					String message = subConfig.getString(RuleElementPathUtil
							.getRuleMessage(ruleIndex));

					String min = subConfig.getString(RuleElementPathUtil
							.getRuleMin(ruleIndex));

					String max = subConfig.getString(RuleElementPathUtil
							.getRuleMax(ruleIndex));

					String dateFormat = subConfig.getString(RuleElementPathUtil
							.getRuleDateFormat(ruleIndex));

					String key = subConfig.getString(RuleElementPathUtil
							.getMessageKey(ruleIndex));

					String useAttributePlaceHolder = subConfig
							.getString(RuleElementPathUtil
									.getMessageUseAttributePlaceHolder(ruleIndex));

					String regEx = subConfig.getString(RuleElementPathUtil
							.getRuleRegEx(ruleIndex));
					
					String expression = subConfig.getString(RuleElementPathUtil
							.getRuleExpression(ruleIndex));

					Rule rule = new Rule(ruleType);

					rule.setProperty(property);
					rule.setMessage(message);
					rule.setMin(min);
					rule.setMax(max);
					rule.setDateFormat(dateFormat);
					rule.setKey(key);
					rule.setUseAttributePlaceHolder(Boolean
							.valueOf(useAttributePlaceHolder));
					rule.setRegEx(Boolean.valueOf(regEx));
					rule.setExpression(expression);
					if (isMessageFromKeyAllowed) {
						rule.setPropertiesMap(propertiesMap);
					}

					rule.populateRule();
					ruleList.add(rule);
				}
				validationMap.put(name, ruleList);
			}
		} catch (Exception ex) {
			throw new ValidationException(ex);
		}

		return validationMap;
	}

}
