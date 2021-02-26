package com.hbue.sys.controller;

import com.hbue.sys.constant.SysConstant;
import com.hbue.sys.service.LogInfoService;
import com.hbue.sys.utils.DataGridView;
import com.hbue.sys.utils.ResultObj;
import com.hbue.sys.vo.LogInfoVo;
import com.hbue.sys.vo.RoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 日志管理控制器
 * RestController 所有数据返回都是json
 */
@RestController
@RequestMapping("log")
public class LogInfoController {

    @Autowired
    private LogInfoService logInfoService;

    

    

    /**
     * 加载日志列表返回DataGridView 进行分页处理
     *
     */
    @RequestMapping("loadAllLogInfo")
    public DataGridView loadAllLogInfo(LogInfoVo logInfoVo){
        return logInfoService.queryAllLogInfo(logInfoVo);

    }


    /**
     * 删除日志
     * @param logInfoVo
     * @return
     */
    @RequestMapping("deleteLogInfo")
    public ResultObj deleteLogInfo(LogInfoVo logInfoVo){
       try{
            logInfoService.deleteLogInfo(logInfoVo.getId());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 批量删除日志
     * @param logInfoVo
     * @return
     */
    @RequestMapping("deleteBatchLogInfo")
    public ResultObj deleteBatchLogInfo(LogInfoVo logInfoVo){
       try{
            logInfoService.deleteBatchLogInfo(logInfoVo.getIds());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    
}
