package com.hbue.sys.vo;

import com.hbue.sys.entity.Menu;

public class MenuVo extends Menu {

    /**
     * 分页参数
     */
    private Integer page; //第几页
    private Integer limit;//每页几条数据

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
