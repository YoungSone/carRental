package com.hbue.stat.controller;

import com.hbue.bus.entity.Customer;
import com.hbue.bus.entity.Rent;
import com.hbue.bus.service.CustomerService;
import com.hbue.bus.service.RentService;
import com.hbue.bus.vo.CustomerVo;
import com.hbue.stat.entity.BaseEntity;
import com.hbue.stat.service.StatService;
import com.hbue.stat.utils.ExportCustomerUtils;
import com.hbue.stat.utils.ExportRentUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("stat")
public class StatController {
    
    @Autowired
    private StatService statService;
     @Autowired
    private CustomerService customerService;
      @Autowired
    private RentService rentService;
    
    @RequestMapping("toCustomerAreaStat")
    public String toCustomerAreaStat(){
        return "stat/customerAreaStat";
    }
    
    @RequestMapping("loadCustomerAreaStatJson")
    @ResponseBody
    public List<BaseEntity> loadCustomerAreaStatJson(){
        return this.statService.loadCustomerAreaStatList();
    }


    /**
     * 跳转业务员年度统计页面
     * @return
     */
     @RequestMapping("toOpernameYearGradeStat")
    public String toOpernameYearGradeStat(){
        return "stat/opernameYearGradeStat";
    }
    
    
    @RequestMapping("loadOpernameYearGradeStatJson")
    @ResponseBody
    public Map<String,Object> loadOpernameYearGradeStatJson(String year){
         Map<String,Object> map=new HashMap<>();
        List<BaseEntity> datas = this.statService.loadOpernameYearGradeStatJson(year);
        List<String> names=new LinkedList<>();
        List<Double> values=new LinkedList<>();
        for (BaseEntity data : datas) {
            names.add(data.getName());
            values.add(data.getValue());
        }
        map.put("name",names);
        map.put("value",values);
        return map;
    }
    
    /**
     * 跳转业务员年度统计页面
     * @return
     */
     @RequestMapping("toCompanyYearGradeStat")
    public String toCompanyYearGradeStat(){
        return "stat/companyYearGradeStat";
    }
    
    
    @RequestMapping("loadCompanyYearGradeStatJson")
    @ResponseBody
    public List<Double> loadCompanyYearGradeStatJson(String year){
        List<Double> doubleList = statService.loadCompanyYearGradeStatJson(year);
        for (int i = 0; i < doubleList.size(); i++) {
            if (null==doubleList.get(i)){
                doubleList.set(i,0.0);
            }
        }
        return doubleList;
    }
    
    
      /**
     * 导出客户数据
     * @param customerVo
     * @param response
     */
    @RequestMapping("exportCustomer")
    public ResponseEntity<Object> exportCustomer(CustomerVo customerVo, HttpServletResponse response){
       List<Customer> customers = customerService.queryAllCustomerForList(customerVo);
        String fileName="客户数据.xls";
        String sheetName="客户数据";

        ByteArrayOutputStream bos = ExportCustomerUtils.exportCustomer(customers,sheetName);

        try {
            //处理文件名乱码
            fileName= URLEncoder.encode(fileName,"UTF-8");
            //创建 封装响应头信息的对象
            HttpHeaders headers = new HttpHeaders();
            //封装响应内容类型(APPLICATION_OCTET_STREAM 响应的内容不限定)
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            //设置下载的文件的名称
            headers.setContentDispositionFormData("attachment",fileName);
            return new ResponseEntity<Object>(bos.toByteArray(),headers, HttpStatus.CREATED);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 导出出租单数据
     * @param rentid
     */
    @RequestMapping("exportRent")
    public ResponseEntity<Object> exportRent(String rentid){
        //根据出租单号查询出租单信息
        Rent rent = rentService.queryRentByRentId(rentid);
        //根据身份证号查询客户信息
        Customer customer = customerService.queryCustomerByIdentity(rent.getIdentity());

        String fileName=customer.getCustname()+"-的出租单.xls";
        String sheetName=customer.getCustname()+"出租单";

        ByteArrayOutputStream bos = ExportRentUtils.exportRent(rent,customer,sheetName);

        try {
            //处理文件名乱码
            fileName= URLEncoder.encode(fileName,"UTF-8");
            //创建 封装响应头信息的对象
            HttpHeaders headers = new HttpHeaders();
            //封装响应内容类型(APPLICATION_OCTET_STREAM 响应的内容不限定)
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            //设置下载的文件的名称
            headers.setContentDispositionFormData("attachment",fileName);
            return new ResponseEntity<Object>(bos.toByteArray(),headers, HttpStatus.CREATED);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
