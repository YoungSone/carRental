package com.hbue.sys.utils;

import com.hbue.sys.constant.SysConstant;

/**
 * 封装 返回json数据
 */
public class ResultObj {

    private Integer code=0;
    private String msg;

    public static final ResultObj ADD_SUCCESS=new ResultObj(SysConstant.CODE_SUCCESS,SysConstant.ADD_SUCCESS);
    public static final ResultObj ADD_ERROR=new ResultObj(SysConstant.CODE_ERROR,SysConstant.ADD_ERROR);
    public static final ResultObj UPDATE_SUCCESS=new ResultObj(SysConstant.CODE_SUCCESS,SysConstant.UPDATE_SUCCESS);
    public static final ResultObj UPDATE_ERROR=new ResultObj(SysConstant.CODE_ERROR,SysConstant.UPDATE_ERROR);
    public static final ResultObj DELETE_SUCCESS=new ResultObj(SysConstant.CODE_SUCCESS,SysConstant.DELETE_SUCCESS);
    public static final ResultObj DELETE_ERROR=new ResultObj(SysConstant.CODE_ERROR,SysConstant.DELETE_ERROR);
    public static final ResultObj RESET_SUCCESS=new ResultObj(SysConstant.CODE_SUCCESS,SysConstant.RESET_SUCCESS);
    public static final ResultObj RESET_ERROR=new ResultObj(SysConstant.CODE_ERROR,SysConstant.RESET_ERROR);
    public static final ResultObj DISPATCH_SUCCESS=new ResultObj(SysConstant.CODE_SUCCESS,SysConstant.DISPATCH_SUCCESS);
    public static final ResultObj DISPATCH_ERROR=new ResultObj(SysConstant.CODE_ERROR,SysConstant.DISPATCH_ERROR);


    public static final ResultObj STATUS_TRUE=new ResultObj(SysConstant.CODE_SUCCESS);
    public static final ResultObj STATUS_FALSE=new ResultObj(SysConstant.CODE_ERROR);
    
    
    private ResultObj(Integer code) {
        this.code = code;
    }

    //私有构造方法外界不能访问
    private ResultObj(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
