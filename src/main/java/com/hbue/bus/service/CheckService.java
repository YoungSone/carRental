package com.hbue.bus.service;

import com.hbue.bus.entity.Check;
import com.hbue.bus.vo.CheckVo;
import com.hbue.sys.utils.DataGridView;

import java.util.Map;

public interface CheckService {

    /**
     * 添加检查单
     * @param checkVo
     */
    void addCheck(CheckVo checkVo);

    /*
    初始化 检查单数据
     */
    Map<String, Object> initCheckFormData(String rentid);

    /**
     * 分页查看所有检查单
     * @param checkVo
     * @return
     */
    DataGridView queryAllCheck(CheckVo checkVo);

    /**
     * 删除检查单
     * @param checkid
     */
    void deleteCheck(String checkid);

    /**
     * 更新检查单
     */
    void updateCheck(CheckVo checkVo);

    /**
     * 批量删除检查单
     */
    
    void deleteBatchCheck(CheckVo checkVo);
}
