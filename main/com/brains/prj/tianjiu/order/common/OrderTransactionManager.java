package com.brains.prj.tianjiu.order.common;

import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionDefinition;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-17
 * Time: 下午1:25
 * To change this template use File | Settings | File Templates.
 */
public class OrderTransactionManager extends DataSourceTransactionManager {
    protected void doBegin(Object transaction, TransactionDefinition definition) {
        org.springframework.transaction.support.TransactionSynchronizationManager.setCurrentTransactionName(definition.getName());
        super.doBegin(transaction, definition);
    }
}
