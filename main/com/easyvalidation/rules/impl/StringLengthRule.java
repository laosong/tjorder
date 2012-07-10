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

import com.easyvalidation.rules.AbstractRule;
import com.easyvalidation.rules.RangeRule;
import com.easyvalidation.util.Utils;

/**
 * Rule for string length
 * 
 */
public class StringLengthRule extends AbstractRule implements RangeRule {

	private Object min = null;

	private Object max = null;

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

	@Override
	/**
	 * Checks the length of string
	 */
	public boolean checkError() {
		Object value = getValue();
		if (!Utils.isEmpty(value)) {

			String sValue = value.toString();

			boolean isMinInRange = true;
			boolean isMaxInRange = true;
			if (!Utils.isEmpty(min)) {
				int iMin = Integer.parseInt(min.toString());
				if (sValue.length() < iMin) {
					isMinInRange = false;
				}
			}

			if (!Utils.isEmpty(max)) {
				int iMax = Integer.parseInt(max.toString());
				if (sValue.length() > iMax) {
					isMaxInRange = false;
				}
			}

			return !(isMinInRange && isMaxInRange);
		}
		return false;
	}
}