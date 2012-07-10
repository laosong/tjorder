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

import java.util.Collection;
import java.util.Map;

/**
 * This is an utility class for common methods like check if object empty, etc.
 * 
 */
public final class Utils {

	/**
	 * Method checks if the parameter passed is empty
	 * 
	 * @param obj
	 * @return
	 */
	public static boolean isEmpty(Object obj) {
		boolean isEmpty = false;
		if (obj == null) {
			isEmpty = true;
		} else if (obj instanceof String && (obj.toString().trim()).length() == 0) {
			isEmpty = true;
		} else if (obj instanceof Collection && ((Collection) obj).size() == 0) {
			isEmpty = true;
		} else if (obj instanceof Map && ((Map) obj).size() == 0) {
			isEmpty = true;
		}

		return isEmpty;
	}

}
