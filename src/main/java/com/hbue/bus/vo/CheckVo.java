package com.hbue.bus.vo;


import com.hbue.bus.entity.Check;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


public class CheckVo extends Check {
    
    
    /**
     * 分页参数
     */
    private Integer page; //第几页
    private Integer limit;//每页几条数据
    private String[] checkids;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;
    
    public String[] getCheckids() {
        return checkids;
    }

    public void setCheckids(String[] checkids) {
        this.checkids = checkids;
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
