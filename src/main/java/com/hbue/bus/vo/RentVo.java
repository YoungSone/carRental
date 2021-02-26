package com.hbue.bus.vo;


import com.hbue.bus.entity.Rent;


public class RentVo extends Rent {
    
    
    /**
     * 分页参数
     */
    private Integer page; //第几页
    private Integer limit;//每页几条数据
    private String[] rentids;

    public String[] getRentids() {
        return rentids;
    }

    public void setRentids(String[] rentids) {
        this.rentids = rentids;
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
