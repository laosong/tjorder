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

package com.easyvalidation.rules.builder;

import com.easyvalidation.rules.IRule;
import com.easyvalidation.rules.RULETYPE;
import com.easyvalidation.rules.impl.CreditCardRule;
import com.easyvalidation.rules.impl.CurrencyRule;
import com.easyvalidation.rules.impl.DateRangeRule;
import com.easyvalidation.rules.impl.DoubleRangeRule;
import com.easyvalidation.rules.impl.EmailRule;
import com.easyvalidation.rules.impl.ExpressionRule;
import com.easyvalidation.rules.impl.ISBNRule;
import com.easyvalidation.rules.impl.InetAddressRule;
import com.easyvalidation.rules.impl.IntRangeRule;
import com.easyvalidation.rules.impl.PercentRule;
import com.easyvalidation.rules.impl.RequiredRule;
import com.easyvalidation.rules.impl.StringLengthRule;
import com.easyvalidation.rules.impl.URLRule;

/**
 * A factory class to generate instance rule as per the rule type supplied
 * 
 */
public final class RuleBuilder {

	private RuleBuilder() {
	}

	/**
	 * Method to generate instance of rule
	 * 
	 * @param ruleType
	 * @return
	 */
	public static IRule buildRule(RULETYPE ruleType) {
		IRule rule = null;
		switch (ruleType) {
		case REQUIRED: {
			rule = new RequiredRule();
			break;
		}
		case EMAIL: {
			rule = new EmailRule();
			break;
		}
		case EXPRESSION: {
			rule = new ExpressionRule();
			break;
		}
		case INT: {
			rule = new IntRangeRule();
			break;
		}
		case DOUBLE: {
			rule = new DoubleRangeRule();
			break;
		}
		case DATE: {
			rule = new DateRangeRule();
			break;
		}
		case STRINGLENGTH: {
			rule = new StringLengthRule();
			break;
		}
		case URL: {
			rule = new URLRule();
			break;
		}
		case CREDITCARD: {
			rule = new CreditCardRule();
			break;
		}
		case ISBN: {
			rule = new ISBNRule();
			break;
		}
		case CURRENCY: {
			rule = new CurrencyRule();
			break;
		}
		case PERCENT: {
			rule = new PercentRule();
			break;
		}
		case INETADDRESS: {
			rule = new InetAddressRule();
			break;
		}
		}
		return rule;
	}

}
