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

import ognl.Ognl;
import ognl.OgnlContext;

import com.easyvalidation.common.ErrorMessages;
import com.easyvalidation.exception.ValidationException;

/**
 * It is an OGNL expression evaluator
 * 
 */
public final class OgnlExpressionEvaluator {

	private OgnlExpressionEvaluator() {
	}

	/**
	 * Return the boolean value of the OGNL expression
	 * 
	 * @param expression
	 * @param parameters
	 * @return
	 * @throws ValidationException
	 */
	public static boolean getValue(String expression,
			Map<String, Object> parameters) throws ValidationException {
		boolean value = false;
		try {
			OgnlContext context = new OgnlContext(parameters);
			Object expr = Ognl.parseExpression(expression);
			value = Boolean.valueOf(Ognl.getValue(expr, context, (Object) null)
					.toString());
		} catch (Exception ex) {
			throw new ValidationException(ErrorMessages.OGNL_PARSING_ERROR, ex);
		}
		return value;
	}

}
