package com.brains.prj.tianjiu.order.domain;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 13-4-13
 * Time: 下午2:49
 * To change this template use File | Settings | File Templates.
 */

import java.io.Serializable;

public class AdItem implements Serializable {
    private static final long serialVersionUID = 4663939231996281385L;

    private int id;
    private String title;
    private String text;
    private String href;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
