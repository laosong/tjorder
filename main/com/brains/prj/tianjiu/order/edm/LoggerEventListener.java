package com.brains.prj.tianjiu.order.edm;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-25
 * Time: 下午4:22
 * To change this template use File | Settings | File Templates.
 */

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wpl.common.event.EventHandler;
import com.wpl.common.event.IEventListener;

import java.io.Serializable;

public class LoggerEventListener implements IEventListener {

    private final Logger logger = LoggerFactory.getLogger(LoggerEventListener.class);

    @Override
    public void onEvent(Object sender, Serializable args) {

    }

    @EventHandler(OrderSubmitEventArgs.class)
    public void onOrderSubmitEvent(final Object sender, final OrderSubmitEventArgs args) {
        logger.info(args.getOrderId() + " submit!");
    }
}
