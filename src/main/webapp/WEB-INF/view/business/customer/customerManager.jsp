<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>客户管理</title>
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
					<label class="layui-form-label">身份证号:</label>
					<div class="layui-input-inline">
						<input type="text" name="identity" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">客户姓名:</label>
					<div class="layui-input-inline">
						<input type="text" name="custname" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">客户地址:</label>
					<div class="layui-input-inline">
						<input type="text" name="address" autocomplete="off" class="layui-input"/>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">客户电话:</label>
					<div class="layui-input-inline">
						<input type="text" name="phone" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">客户职位:</label>
					<div class="layui-input-inline">
						<input type="text" name="career" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">性别:</label>
					<div class="layui-input-inline">
						<input type="radio" name="sex" value="1" autocomplete="off" title="男" class="layui-input"/>
						<input type="radio" name="sex" value="0" autocomplete="off" title="女" class="layui-input"/>
					</div>
					</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					 <button type="button" class="layui-btn layui-btn-normal layui-icon layui-icon-search" id="doSearch">查询</button>
		      		<button type="reset" class="layui-btn layui-btn-warm layui-btn-primary layui-icon layui-icon-refresh">重置</button>
					 <button type="button" class="layui-btn layui-btn-green layui-icon layui-icon-download-circle layui-btn-radius layui-btn-sm"
                    id="doExport" style="margin-top: 4px">导出</button>
				</div>
			</div>
		</form>

		<!--搜索条件结束-->

		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			<legend>数据 </legend>
		</fieldset>

		<!--数据表格开始-->
		<table class="layui-hide" id="customerTable" lay-filter="customerTable"></table>



		<!--表头工具栏-->
		<script type="text/html" id="toolbar1">
		  <div class="layui-btn-container">
		    <button class="layui-btn layui-btn-sm" lay-event="add">增加顾客 </button>
		    <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="deleteBatch">删除选中</button>
			  
		  </div>
		</script>
		 <!--行内工具栏-->
		<script type="text/html" id="bar1">
		  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
		  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		</script>

		<!--数据表格结束-->


		<!--添加修改菜单的弹出层开始-->
		<div style="display: none;" id="saveOrUpdateDiv">
			<form class="layui-form" action="" lay-filter="dataForm" id="form1">
				

				<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">身份证号:</label>
					<div class="layui-input-inline">
						<input type="text" name="identity" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">客户姓名:</label>
					<div class="layui-input-inline">
						<input type="text" name="custname" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">客户地址:</label>
					<div class="layui-input-inline">
						<input type="text" name="address" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">客户电话:</label>
					<div class="layui-input-inline">
						<input type="text" name="phone" autocomplete="off" class="layui-input"/>
					</div>
				</div>
			</div>	
			<div class="layui-form-item">
				
				<div class="layui-inline">
					<label class="layui-form-label">客户职位:</label>
					<div class="layui-input-inline">
						<input type="text" name="career" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">性别:</label>
					<div class="layui-input-inline">
						<input type="radio" name="sex" value="1" autocomplete="off" title="男" class="layui-input"/>
						<input type="radio" name="sex" value="0" autocomplete="off" title="女" class="layui-input"/>
					</div>
					</div>
			</div>

				<div class="layui-form-item">
				    <div class="layui-input-block layui-center">
				      <button type="button" class="layui-btn layui-btn-normal layui-icon layui-icon-release" lay-filter="doSubmit" lay-submit="">提交</button>
				      <button type="reset" class="layui-btn layui-btn-warm layui-icon layui-icon-refresh" id="dataFrmResetBtn">重置</button>
				    </div>
				  </div>
			</form>

		</div>
		<!--添加修改的弹出层结束-->
    
    

		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js" ></script>
		<script>
			//提升tableIns作用域使外部方法可以访问
			var tableIns;
			layui.use(['table','jquery','layer','form'],function(){
				var $=layui.jquery;
				var table=layui.table;
				var layer=layui.layer;
				var form=layui.form;
				


				var url;
				var mainIndex;
				tableIns=table.render({
					elem: '#customerTable'	//渲染的目标对象
				    ,url:'${pageContext.request.contextPath}/customer/loadAllCustomer.action'
				    ,toolbar: '#toolbar1' //开启头部工具栏，并为其绑定左侧模板
				    ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
				      title: '提示'
				      ,layEvent: 'LAYTABLE_TIPS'
				      ,icon: 'layui-icon-tips'
				    }]
				    ,title: '客户数据表' //数据导出的标题
					,cellMinWidth:200//设置列的最小默认宽度
				    ,cols: [[
				      {type: 'checkbox', fixed: 'left'}
				      ,{field:'identity', title:'身份证号',align:'center'}
				      ,{field:'custname', title:'客户姓名',align:'center'}
				      ,{field:'phone', title:'客户电话',align:'center'}
				      ,{field:'address', title:'客户地址',align:'center'}
				      ,{field:'career', title:'客户职位',align:'center'}
				      ,{field:'sex', title:'性别',align:'center',templet: function(d){
				        return d.sex=='1'?'<font color=blue>男</font>':'<font color=red>女</font>';
				      }}
				       ,{field:'createtime', title:'创建时间',align:'center'}
				      ,{toolbar:'#bar1',fixed:'right',title:'操作',align:'center',width:'250'}

				    ]]
				    ,page: true//开启分页
				});

				//模糊查询
				$('#doSearch').click(function() {
				var params=$('#searchForm').serialize();
				tableIns.reload({
					url:'${pageContext.request.contextPath}/customer/loadAllCustomer.action?'+params,
					curr:1
					});
				});
				//模糊查询
				$('#doExport').click(function() {
				var params=$('#searchForm').serialize();
				window.location.href="${pageContext.request.contextPath}/stat/exportCustomer.action?"+params;
				});
				

				//监听头部工具事件
				table.on('toolbar(customerTable)', function(obj){
				  //var checkStatus = table.checkStatus(obj.config.id);
				  switch(obj.event){
				    case 'add':
				    	openAddCustomer();
				      //layer.msg('添加');
				    break;
				    case 'deleteBatch':
				        deleteBatch();
				        //console.log(obj);
				      //layer.msg('删除');
				    break;


				  };
				});
				
				//批量删除角色
				function deleteBatch() {
					//得到选中数据行
					var checkStatus=table.checkStatus('customerTable');
					console.log(checkStatus);
					var data=checkStatus.data;
					var params="";
					$.each(data,function (i,item) {
						if (i==0){
						    params+="identities="+item.identity;
						} else {
						    params+="&identities="+item.identity;
						}
                    });
					layer.confirm('真的删除这些顾客吗？', function(index){
						  //向服务端发送删除指令
							$.post("${pageContext.request.contextPath}/customer/deleteBatchCustomer.action",params,function(res)
								{
									layer.msg(res.msg);
									//刷新表格
									tableIns.reload({
										done:function(res,curr,count) {
											//判断是否为当前页最后一条数据 返回到上一页
											 if (curr>1&&res.data.length<=0){
											     curr=curr-1;
											     tableIns.reload({
													page:{
													    curr:curr
													}
												},res.data);
											 } 
										}
									});
								})
					});
                }
				//打开添加页面
				function openAddCustomer(){
					mainIndex= layer.open({
						type:1,
						title:'添加顾客',
						content:$('#saveOrUpdateDiv'),
						area:['700px','400px'],
						skin:'layui-layer-molv',
						success:function(index){
						    
							$('#form1')[0].reset();
							url="${pageContext.request.contextPath}/customer/addCustomer.action";
						}

					});
				}
				

				
				
				

				//监听工具条
				table.on('tool(customerTable)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				  var data = obj.data; //获得当前行数据
				  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				  var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
				  if(layEvent == 'del'){ //删除
								layer.confirm('真的删除【'+data.custname+'】这个顾客吗', function(index){
								  //向服务端发送删除指令
									$.post("${pageContext.request.contextPath}/customer/deleteCustomer.action",{identity:data.identity},function(res)
										{
											layer.msg(res.msg);
											//刷新表格
											tableIns.reload({
												done:function(res,curr,count) {
													//判断是否为当前页最后一条数据 返回到上一页
													 if (curr>1&&res.data.length<=0){
													     curr=curr-1;
													     tableIns.reload({
															page:{
															    curr:curr
															}
														},res.data);
													 } 
												}
											});
											
										})
								});
				  }else if(layEvent == 'edit'){ //编辑
				    //do something

				    openUpdateCustomer(data);

				  } 
				});
				
				
				
				//修改顾客
				function openUpdateCustomer(data){
					//console.log(data);
					mainIndex= layer.open({
						type:1,
						title:'修改顾客',
						content:$('#saveOrUpdateDiv'),
						area:['600px','400px'],
						success:function(index){
							//var id=data.id+""; selectInitVal必须传一个字符串
							form.val('dataForm',data);
							url="${pageContext.request.contextPath}/customer/updateCustomer.action";
							
							//反选下拉树
							//var pid=data.pid
							//var param = dtree.getParam("selTree",pid);
							//console.log(param.context);
							//$("#pid_str").val(param.context);
							//$('#pid_str').val(parms.context);
						}
					});
				}
				//监听表单提交
				form.on('submit(doSubmit)',function(data){

					//alert(url);
					//序列化表单数据
					var params=$('#form1').serialize();
					//alert(params);
					$.post(url,params,function(obj){
						layer.msg(obj.msg);
						layer.close(mainIndex)
						//刷新表格
						tableIns.reload();
						
					});
				})
			});
			
		</script>

    </body>
</html>