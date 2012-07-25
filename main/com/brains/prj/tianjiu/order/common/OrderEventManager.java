package com.brains.prj.tianjiu.order.common;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-25
 * Time: 下午3:50
 * To change this template use File | Settings | File Templates.
 */

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;

import com.wpl.common.event.IEventListener;
import com.wpl.common.event.IEventManager;

import java.io.Serializable;

public class OrderEventManager implements InitializingBean, DisposableBean {

    private IEventManager eventManager;
    private IEventListener[] eventListeners;


    public void setEventManager(IEventManager eventManager) {
        this.eventManager = eventManager;
    }

    public void setEventListeners(IEventListener[] eventListeners) {
        this.eventListeners = eventListeners;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        if (this.eventManager == null) {
            throw new IllegalArgumentException("Property 'eventManager' is required");
        }
        if (this.eventListeners != null) {
            for (IEventListener eventListener : this.eventListeners) {
                this.eventManager.addListener(eventListener);
            }
        }
    }

    @Override
    public void destroy() throws Exception {
        if (eventManager != null) {
            eventManager.dispose();
        }
    }

    public void invoke(final Object sender, final Serializable args) {
        eventManager.invoke(sender, args);
    }

}
