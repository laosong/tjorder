package com.brains.prj.tianjiu.order.common;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-17
 * Time: 下午12:09
 * To change this template use File | Settings | File Templates.
 */
public class OrderDataSource extends AbstractRoutingDataSource {
    @Override
    protected Object determineCurrentLookupKey() {
        return org.springframework.transaction.support.TransactionSynchronizationManager.getCurrentTransactionName();
    }
}
