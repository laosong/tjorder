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
package com.easyvalidation.util;

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.easyvalidation.common.ErrorMessages;
import com.easyvalidation.exception.ValidationException;

/**
 * Class to replace the attributes placeholder values mentioned in message of
 * the rule
 * 
 */
public final class AttributePlaceHolder {

	private static final String PLACEHOLDER_REGEX = "(\\$\\{([a-z]+|[A-Z]+|[0-9]+)+\\})";

	private AttributePlaceHolder() {
	}

	/**
	 * Method replace placeholders with values passed in the map (which contains
	 * attribute values)
	 * 
	 * @param message
	 * @param params
	 * @return
	 */
	public static String generateMesageFromPlaceHolder(String message,
			Map<String, Object> params) throws ValidationException {
		Pattern pattern = Pattern.compile(PLACEHOLDER_REGEX);
		Matcher matcher = pattern.matcher(message);
		StringBuffer sbMessage = new StringBuffer();
		try {
			while (matcher.find()) {
				String key = matcher.group();
				String keyVal = key.substring(2, key.length() - 1);
				matcher.appendReplacement(sbMessage, params.get(keyVal)
						.toString());
			}
			matcher.appendTail(sbMessage);
		} catch (Exception ex) {
			throw new ValidationException(
					ErrorMessages.ATTRIBUTE_NOT_SPECIFIED, ex);
		}
		return sbMessage.toString();
	}
}