package com.hbue.sys.vo;

import com.hbue.sys.entity.Role;

public class RoleVo extends Role {
    
    
    /**
     * 分页参数
     */
    private Integer page; //第几页
    private Integer limit;//每页几条数据
    private Integer[] ids;//批量获取传入的id值

    public Integer[] getIds() {
        return ids;
    }

    public void setIds(Integer[] ids) {
        this.ids = ids;
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
