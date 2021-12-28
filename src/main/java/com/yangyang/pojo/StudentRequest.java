package com.yangyang.pojo;

import com.yangyang.utils.Constants;

public class StudentRequest {
    public int getPageNow() {
        return pageNow;
    }

    public void setPageNow(int pageNow) {
        this.pageNow = pageNow;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private int pageNow;
    private int pageSize= Constants.PAGE_SIZE;
    private String name;


    public int getStart(){
        return (pageNow-1)*pageSize;
    }

}
