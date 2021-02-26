package com.hbue.bus.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hbue.bus.dao.CustomerMapper;
import com.hbue.bus.entity.Customer;
import com.hbue.bus.service.CustomerService;
import com.hbue.bus.vo.CustomerVo;
import com.hbue.sys.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerMapper customerMapper;
    

    @Override
    public List<Customer> queryAllCustomerForList(CustomerVo customerVo) {
        return customerMapper.queryAllCustomer(customerVo);
    }
    

    @Override
    public DataGridView queryAllCustomer(CustomerVo customerVo) {
        Page<Object> page= PageHelper.startPage(customerVo.getPage(),customerVo.getLimit());
        //先拿到数据在进行分页
        // getTotal获取总的记录数
        List<Customer> data = customerMapper.queryAllCustomer(customerVo);
        return new DataGridView(page.getTotal(),data);
    }

    @Override
    public void addCustomer(CustomerVo customerVo) {
        customerMapper.insertSelective(customerVo);
    }

    @Override
    public void upDateCustomer(CustomerVo customerVo) {
        customerMapper.updateByPrimaryKeySelective(customerVo);
    }

   

    @Override
    public void deleteCustomer(String identity) {
        //删除菜单表的数据
        //根据菜单id删除sys_customer_Customer里面的数据
        customerMapper.deleteByPrimaryKey(identity);
    }
    
    @Override
    public void deleteBatchCustomer(String[] identities) {
        for (String identity : identities) {
            deleteCustomer(identity);
        }
    }

    @Override
    public Customer queryCustomerByIdentity(String identity) {
        return customerMapper.selectByPrimaryKey(identity);
    }


}
