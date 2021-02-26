package com.hbue.bus.vo;


import com.hbue.bus.entity.Customer;
import com.hbue.sys.entity.News;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


public class CustomerVo extends Customer {
    
    
    /**
     * 分页参数
     */
    private Integer page; //第几页
    private Integer limit;//每页几条数据
    private String[] identities;//批量获取传入的id值

    public String[] getIdentities() {
        return identities;
    }

    public void setIdentities(String[] identities) {
        this.identities = identities;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }
    
}
