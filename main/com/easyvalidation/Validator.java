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

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.easyvalidation.common.Constants;
import com.easyvalidation.dto.Error;
import com.easyvalidation.exception.ValidationException;

/**
 * It is just an interface for RuleProcessor & the external java code which
 * initialize & check rules.
 * 
 */
public class Validator {

	private static ValidationPerformer validationPerformer = null;

	private Validator() {
	}

	/**
	 * Method to initialize rules that are mentioned in XML files. It internally
	 * invokes doProcess method of rule processor
	 * 
	 * @param fileNames
	 * @throws ValidationException
	 */
	public static void initialize(String fileNames) throws ValidationException {

		String[] fileNamesArr = fileNames.split(Constants.SPACE_STR);
		validationPerformer = ValidationPerformer.getInstance();
		validationPerformer.doInit(fileNamesArr);
	}

	/**
	 * Checks the validations with the validation name & parameters map passed
	 * 
	 * @param validationName
	 * @param parameters
	 * @return
	 * @throws ValidationException
	 */
	public static List<Error> checkValidations(String validationName,
			Map<String, Object> parameters) throws ValidationException {
		return validationPerformer.checkRule(validationName, parameters,
				Locale.ENGLISH.toString());
	}

	/**
	 * Checks the validations with the validation name,parameters map & locale
	 * passed
	 * 
	 * @param validationName
	 * @param parameters
	 * @param locale
	 * @return
	 * @throws ValidationException
	 */
	public static List<Error> checkValidations(String validationName,
			Map<String, Object> parameters, String locale)
			throws ValidationException {
		return validationPerformer
				.checkRule(validationName, parameters, locale);
	}

}
