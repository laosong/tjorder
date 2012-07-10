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
package com.easyvalidation.rules;

/**
 * Enum to define all rule types
 * 
 */
public enum RULETYPE {

	REQUIRED, INT, DOUBLE, EMAIL, EXPRESSION, DATE, STRINGLENGTH, URL, CREDITCARD, ISBN, CURRENCY, PERCENT, INETADDRESS;

	/**
	 * Method to return ruletype as per the value passed to it.
	 * 
	 * @param ruleType
	 * @return
	 */
	public static RULETYPE getRuleType(String ruleType) {
		try {
			return RULETYPE.valueOf(ruleType.toUpperCase());
		} catch (Exception ex) {
			return null;
		}
	}
}