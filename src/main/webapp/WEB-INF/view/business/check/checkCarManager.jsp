<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>汽车入库管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/public.css" media="all" />
		<style>
		.layui-table-cell .layui-form-checkbox[lay-skin="primary"]{
			 top: 50%;
			 transform: translateY(-50%);
		}
		</style>
</head>
    <body class="childrenBody">
    <!--搜索条件开始-->
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			<legend>查询条件 </legend>
		</fieldset>
		<form class="layui-form" method="post" id="searchForm">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">出租单号:</label>
					<div class="layui-input-inline">
						<input type="text" name="rentid" id="rentid"  autocomplete="off" class="layui-input" placeholder="请输入出租单号"/>
					</div>
				</div>
				<div class="layui-inline">
					 <button type="button" class="layui-btn layui-btn-normal layui-icon layui-icon-search" id="doSearch">查询</button>
				</div>
			</div>
		</form>

		<!--搜索条件结束-->
    
		<!--数据表格开始-->
        <div id="content" style="display: none">
	        
	        <blockquote class="layui-elem-quote layui-text">
			  <label>检查单表单</label>
		        
		        <form class="layui-form" action="" lay-filter="checkFrm" id="checkFrm">
			     <div class="layui-form-item">
					<label class="layui-form-label">检查单号:</label>
					<div class="layui-input-block">
						<input type="text" name="checkid" autocomplete="off" readonly class="layui-input" />
					</div>
				</div>   
			        
				<div class="layui-form-item">
					<label class="layui-form-label">出租单号:</label>
					<div class="layui-input-block">
						<input type="text" name="rentid" autocomplete="off" readonly class="layui-input" />
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">检查时间:</label>
					<div class="layui-input-block">
						<input type="text" name="checkdate" autocomplete="off" readonly class="layui-input" placeholder="请输入检查时间"/>
					</div>
				</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">存在问题:</label>
					<div class="layui-input-inline">
						<input type="text" name="problem" autocomplete="off" class="layui-input"/>
					</div>
				</div>
			</div>	
			 <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label">问题描述</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" class="layui-textarea" name="checkdesc"></textarea>
			    </div>
			  </div>
			<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">操作员:</label>
						<div class="layui-input-inline">
							<input type="text" name="opername" autocomplete="off" readonly class="layui-input" />
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">赔付金额:</label>
						<div class="layui-input-inline">
							<input type="text" name="paymoney" autocomplete="off" lay-verify="required|number"  class="layui-input" />
						</div>
					</div>
					
			</div>

				<div class="layui-form-item">
				    <div class="layui-input-block layui-center">
				      <button type="button" class="layui-btn layui-btn-normal layui-icon layui-icon-release" lay-filter="doSubmit" lay-submit="">提交</button>
				      <button type="reset" class="layui-btn layui-btn-warm layui-icon layui-icon-refresh">重置</button>
				    </div>
				  </div>
			</form>
			</blockquote>
	        
       <%--出租单信息，车辆信息，客户信息的展示--%>
		    <div style="padding: 10px; background-color: #F2F2F2;">
		        <div class="layui-row layui-col-space10">
		            <div class="layui-col-md4">
		                <div class="layui-card">
		                    <div class="layui-card-header">车辆信息</div>
		                    <div class="layui-card-body" id="car_carnumber"></div>
		                    <div class="layui-card-body" id="car_cartype"></div>
		                    <div class="layui-card-body" id="car_color"></div>
		                    <div class="layui-card-body" id="car_price"></div>
		                    <div class="layui-card-body" id="car_rentprice"></div>
		                    <div class="layui-card-body" id="car_deposit"></div>
		                    <div class="layui-card-body" id="car_description"></div>
		                    <div class="layui-card-body">
		                        车辆图片：<img src="" width="200" height="150" id="car_carimg">
		                    </div>
		                </div>
		            </div>
		            <div class="layui-col-md4">
		                <div class="layui-card">
		                    <div class="layui-card-header">出租单信息</div>
		                    <div class="layui-card-body" id="rent_rentid"></div>
		                    <div class="layui-card-body" id="rent_price"></div>
		                    <div class="layui-card-body" id="rent_begindate"></div>
		                    <div class="layui-card-body" id="rent_returndate"></div>
		                    <div class="layui-card-body" id="rent_opername"></div>
		                </div>
		            </div>
		            <div class="layui-col-md4">
		                <div class="layui-card">
		                    <div class="layui-card-header">客户信息</div>
		                    <div class="layui-card-body" id="customer_identity"></div>
		                    <div class="layui-card-body" id="customer_custname"></div>
		                    <div class="layui-card-body" id="customer_sex"></div>
		                    <div class="layui-card-body" id="customer_address"></div>
		                    <div class="layui-card-body" id="customer_phone"></div>
		                    <div class="layui-card-body" id="customer_career"></div>
		                </div>
		            </div>
		        </div>
		    </div>
	        
			
        </div>
    
    
    

		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js" ></script>
		<script>
			//提升tableIns作用域使外部方法可以访问
			var tableIns;
			layui.use(['table','jquery','layer','form','laydate'],function(){
				var $=layui.jquery;
				var table=layui.table;
				var layer=layui.layer;
				var form=layui.form;
				var laydate=layui.laydate;

				var url;
				var mainIndex;
				
				laydate.render({
					elem:'#begindate'
					,type:'datetime'
				});
				laydate.render({
					elem:'#returndate'
					,type:'datetime'
				});
				//模糊查询
				$('#doSearch').click(function() {
				var params=$('#searchForm').serialize();
				//console.log(identity);
				//判断出租单是否存在
				$.post("${pageContext.request.contextPath}/check/checkRentExist.action",params,function (res) {
					if (res===""){
					    layer.msg("单号不存在");
					     $("#content").hide();
						
					}else {
					    //判断出租单
					    if (res.rentflag == 1) {
					        layer.msg("汽车已归还");
					         $("#content").hide();
					        
					    }else {
					        initCheckFormData(res.rentid);
					        $("#content").show();
					    }
					    
					}
                })	
				});
				
				//初始化车辆信息出租单信息客户信息
				function initCheckFormData(rentid){
				   $.post("${pageContext.request.contextPath}/check/initCheckFormData.action",{rentid:rentid},function (obj) {
					   //检查单
                var check=obj.check;
                form.val("checkFrm",check);

                //客户
                var customer=obj.customer;
                $("#customer_identity").html("身份证号: "+customer.identity);
                $("#customer_custname").html("客户姓名: "+customer.custname);
                $("#customer_sex").html("客户性别: "+(customer.sex==1?'男':'女'));
                $("#customer_address").html("客户地址: "+customer.address);
                $("#customer_phone").html("客户电话: "+customer.phone);
                $("#customer_career").html("客户职位: "+customer.career);

                //出租单
                var rent=obj.rent;

                $("#rent_rentid").html("出租单号: "+rent.rentid);
                $("#rent_price").html("出租价格: "+rent.price);
                $("#rent_begindate").html("起租时间: "+rent.begindate);
                $("#rent_returndate").html("还车时间: "+rent.returndate);
                $("#rent_opername").html("操作员: "+rent.opername);

                //车辆信息
                var car=obj.car;
                $("#car_carnumber").html("车辆号牌: "+car.carnumber);
                $("#car_cartype").html("车辆类型: "+car.cartype);
                $("#car_color").html("车辆颜色: "+car.color);
                $("#car_price").html("购买价格: "+car.price);
                $("#car_rentprice").html("出租价格: "+car.rentprice);
                $("#car_deposit").html("出租押金: "+car.deposit);
                $("#car_description").html("车辆描述: "+car.description);
                $("#car_carimg").attr("src","${pageContext.request.contextPath}/file/downloadShowFile.action?path="+car.carimg);
					   
                   })
				    
                }
				
				//监听表单提交 修改出租单
				form.on('submit(doSubmit)',function(data){

					//alert(url);
					//序列化表单数据
					var params=$('#form1').serialize();
					//alert(params);
					$.post("${pageContext.request.contextPath}/check/addCheck.action",params,function(obj){
						layer.msg(obj.msg);
						//隐藏表格
						$('#content').hide();
						
					});
				})
				
			
			
				
			});
			
			
		</script>

    </body>
</html>