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

import com.easyvalidation.exception.ValidationException;

/**
 * Base class for all rules like number, email, date, URL, etc. It defines all
 * necessary methods.
 * 
 */
public abstract class AbstractRule implements IRule {

	private String message = null;

	private Object value = null;

	public String getMessage() throws ValidationException {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public void setValue(Object value) {
		this.value = value;
	}

	public Object getValue() {
		return value;
	}


	public abstract boolean checkError();

	/**
	 * Call the checkError method & return the message
	 */
	public final String doValidate() throws ValidationException {
		if (checkError()) {
			return getMessage();
		}
		return null;
	}

}
