package com.hbue.bus.vo;


import com.hbue.bus.entity.Car;
import com.hbue.bus.entity.Customer;


public class CarVo extends Car {
    
    
    /**
     * 分页参数
     */
    private Integer page; //第几页
    private Integer limit;//每页几条数据
    private String[] carnumbers;//批量获取传入的id值

    public String[] getCarnumbers() {
        return carnumbers;
    }

    public void setCarnumbers(String[] carnumbers) {
        this.carnumbers = carnumbers;
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
