package com.xzj.entity;

import lombok.Data;

@Data
public class PageResponse {

    private String code;

    private String msg;

    private Object data;

    private long count;

    public PageResponse putCount(long count){
        this.count = count;
        return this;
    }

    public static PageResponse successResult() {
        return new PageResponse().putCode("0");
    }

    public static PageResponse failResult() {
        return new PageResponse().putCode("1");
    }

    public PageResponse putCode(String code){
        this.code = code;
        return this;
    }

    public PageResponse putData(Object data) {
        this.data = data;
        return this;
    }

}
