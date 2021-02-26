package com.hbue.bus.service;


import com.hbue.bus.entity.Customer;
import com.hbue.bus.vo.CustomerVo;
import com.hbue.sys.utils.DataGridView;


import java.util.List;

/**
 * 客户管理的服务接口
 */
public interface CustomerService {


    /**
     * 查询所有客户非分页
     */
    public List<Customer> queryAllCustomerForList(CustomerVo customerVo);

    

    /**
     * 分页查询所有客户
     */
    public DataGridView queryAllCustomer(CustomerVo customerVo);

    /**
     * 添加客户
     * @param customerVo
     */
    void addCustomer(CustomerVo customerVo);

    /**
     * 修改客户
     * @param customerVo
     */
    void upDateCustomer(CustomerVo customerVo);



    /**
     * 删除客户
     * @param identity
     */
    void deleteCustomer(String identity);

    /**
     * 批量删除客户
     */
    void deleteBatchCustomer(String[] identities);

    
    Customer queryCustomerByIdentity(String identity);
    
}
