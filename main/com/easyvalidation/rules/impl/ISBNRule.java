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

import org.apache.commons.validator.routines.ISBNValidator;

import com.easyvalidation.rules.AbstractRule;
import com.easyvalidation.util.Utils;

/**
 * Rule to validates the code is either a valid ISBN-10 or a valid ISBN-13 code
 */
public final class ISBNRule extends AbstractRule {

	private static ISBNValidator isbnValidator = new ISBNValidator();

	@Override
	public final boolean checkError() {
		if (!Utils.isEmpty(getValue())) {
			return !isbnValidator.isValid(getValue().toString());
		}
		return false;
	}

}
