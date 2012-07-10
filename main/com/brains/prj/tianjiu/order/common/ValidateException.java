package com.brains.prj.tianjiu.order.common;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-6
 * Time: 下午6:08
 * To change this template use File | Settings | File Templates.
 */

import com.easyvalidation.dto.*;
import com.easyvalidation.dto.Error;

import java.util.List;

public class ValidateException extends Exception {
    private List<com.easyvalidation.dto.Error> errors;

    public ValidateException(List<Error> errors) {
        this.errors = errors;
    }
}
