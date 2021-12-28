package com.yangyang.pojo;

import com.yangyang.utils.Constants;

import java.util.List;

public class TableResult<T> {

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getPageNow() {
        return pageNow;
    }

    public void setPageNow(int pageNow) {
        this.pageNow = pageNow;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private List<T> data;
    private int totalCount;//总条数
    private int pageNow;
    private int pageCount;//总页数
    private String name;//透传



    public int getPageCount() {
        if(totalCount% Constants.PAGE_SIZE==0){
            pageCount=totalCount/Constants.PAGE_SIZE;
        }
        else{
            pageCount=totalCount/Constants.PAGE_SIZE+1;
        }
        return pageCount;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
