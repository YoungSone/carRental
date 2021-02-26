package com.hbue.sys.vo;

import com.hbue.sys.entity.User;

public class UserVo extends User {
     /**
     * 分页参数
     */
    private Integer page; //第几页
    private Integer limit;//每页几条数据
    private Integer[] ids;//批量获取传入的id值
    private String code;//验证码

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

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
