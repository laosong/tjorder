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

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.easyvalidation.common.Constants;
import com.easyvalidation.exception.ValidationException;
import com.easyvalidation.rules.AbstractRule;
import com.easyvalidation.rules.RangeRule;
import com.easyvalidation.util.Utils;

/**
 * The class to compare dates as per the mentioned parameters in XML for rule
 * "date"
 * 
 */
public class DateRangeRule extends AbstractRule implements RangeRule {

	private Object min = null;

	private Object max = null;

	private String dateFormat = null;

	/**
	 * Check for date related error
	 */
	public boolean checkError() throws ValidationException {
		Object value = getValue();
		if (!Utils.isEmpty(value)) {
			try {
				String sValue = value.toString();
				
				boolean isMinInRange = true;
				boolean isMaxInRange = true;
				DateFormat df = new SimpleDateFormat(dateFormat);
				Date dtValue = df.parse(sValue);
				if (!Utils.isEmpty(min)) {
					Date dtMin = checkDate(min.toString());
					if (dtMin == null) {
						dtMin = df.parse(min.toString());
					}
					if (dtValue.before(dtMin)) {
						isMinInRange = false;
					}
				}

				if (!Utils.isEmpty(max)) {
					Date dtMax = checkDate(max.toString());
					if (dtMax == null) {
						dtMax = df.parse(max.toString());
					}
					if (dtValue.after(dtMax)) {
						isMaxInRange = false;
					}
				}
				return !(isMinInRange && isMaxInRange);
			} catch (ParseException ex) {
				ValidationException.mapAndThrow(ex);
			}
		}
		return false;
	}

	/**
	 * Check current/previous date if the such string mentioned in min/max
	 * parameter, generate date for it
	 * 
	 * @param sDate
	 * @return
	 * @throws ValidationException
	 */
	private Date checkDate(String sDate) throws ValidationException {
		Date date = null;
		try {
			DateFormat df = new SimpleDateFormat(dateFormat);
			Calendar calendar = Calendar.getInstance();
			if (sDate.equalsIgnoreCase(Constants.CURRENT_DATE_STR)) {
				date = df.parse(df.format(calendar.getTime()));
			} else if (sDate.equalsIgnoreCase(Constants.PREV_DATE_STR)) {
				calendar.add(Calendar.DATE, -1);
				date = df.parse(df.format(calendar.getTime()));
			}
		} catch (ParseException ex) {
			ValidationException.mapAndThrow(ex);
		}
		return date;
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

	public String getDateFormat() {
		return dateFormat;
	}

	public void setDateFormat(String dateFormat) {
		this.dateFormat = dateFormat;
	}

}