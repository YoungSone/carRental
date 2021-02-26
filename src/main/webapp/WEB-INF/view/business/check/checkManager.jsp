<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>检查单管理</title>
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
					<label class="layui-form-label">检查单号:</label>
					<div class="layui-input-inline">
						<input type="text" name="checkid" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">出租单号:</label>
					<div class="layui-input-inline">
						<input type="text" name="rentid" autocomplete="off" class="layui-input"/>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">存在问题:</label>
					<div class="layui-input-inline">
						<input type="text" name="problem" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">问题描述:</label>
					<div class="layui-input-inline">
						<input type="text" name="checkdesc" autocomplete="off" class="layui-input"/>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">开始时间:</label>
					<div class="layui-input-inline">
						<input type="text" name="startTime"  id="startTime" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">结束时间:</label>
					<div class="layui-input-inline">
						<input type="text" name="endTime" id="endTime" autocomplete="off" class="layui-input"/>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					 <button type="button" class="layui-btn layui-btn-normal layui-icon layui-icon-search" id="doSearch">查询</button>
		      		<button type="reset" class="layui-btn layui-btn-warm layui-btn-primary layui-icon layui-icon-refresh">重置</button>
				</div>
			</div>
		</form>

		<!--搜索条件结束-->

		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			<legend>数据 </legend>
		</fieldset>
		
		<!--数据表格开始-->
		<table class="layui-hide" id="checkTable" lay-filter="checkTable"></table>

		<!--表头工具栏-->
		<script type="text/html" id="toolbar1">
		  <div class="layui-btn-container">
		    <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="deleteBatch">删除选中</button>
		  </div>
		</script>
		
		 <!--行内工具栏-->
		<script type="text/html" id="bar1">
			    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
		        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		</script>

		<!--数据表格结束-->


		<!-- 添加和修改的弹出层-->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv">
    <form class="layui-form" lay-filter="dataFrom" id="dataFrom">
        <div class="layui-form-item">
            <label class="layui-form-label">检查单号:</label>
            <div class="layui-input-block">
                <input type="text" name="checkid" lay-verify="required" readonly="readonly" placeholder="请输入检查单号"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">出租单号:</label>
            <div class="layui-input-block">
                <input type="text" name="rentid" lay-verify="required" readonly="readonly" placeholder="请输入出租单号"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">检查时间:</label>
                <div class="layui-input-inline">
                    <input type="text" name="checkdate" id="checkdate" lay-verify="required" placeholder="请输入起租时间" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">存在问题:</label>
                <div class="layui-input-inline">
                    <input type="text" name="problem" lay-verify="required" id="problem" placeholder="请输入存在的问题" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">问题描述:</label>
                <div class="layui-input-inline">
                    <input type="text" name="checkdesc" lay-verify="required" placeholder="请输入问题描述"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">赔付金额:</label>
                <div class="layui-input-inline">
                    <input type="text" name="paymoney" lay-verify="required"  placeholder="请输入车牌号" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">操作员:</label>
                <div class="layui-input-inline">
                    <input type="text" name="opername" id="opername" lay-verify="required" placeholder="请输入操作员" readonly="readonly" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" style="text-align: center;padding-right: 120px">
                <button type="button"
                        class="layui-btn layui-btn-normal layui-btn-md layui-icon layui-icon-release layui-btn-radius"
                        lay-filter="doSubmit" lay-submit="">提交
                </button>
                <button type="reset"
                        class="layui-btn layui-btn-warm layui-btn-md layui-icon layui-icon-refresh layui-btn-radius">重置
                </button>
            </div>
        </div>
    </form>
</div>
		<!--添加修改的弹出层结束-->
    
    

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
				
				laydate.render({
					elem:'#startTime',
					type:'datetime'
				})
				laydate.render({
					elem:'#endTime',
					type:'datetime'
				})
				
				laydate.render({
					elem:'#checkdate',
					type:'datetime'
				})

				var url;
				var mainIndex;
				tableIns=table.render({
					elem: '#checkTable'	//渲染的目标对象
				    ,url:'${pageContext.request.contextPath}/check/loadAllCheck.action'
				    ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
				      title: '提示'
				      ,layEvent: 'LAYTABLE_TIPS'
				      ,icon: 'layui-icon-tips'
				    }]
				    ,title: '出租单数据表' //数据导出的标题
					,toolbar:'#toolbar1'//表头工具栏
					,cellMinWidth:200//设置列的最小默认宽度
				    ,cols: [[
				      {type: 'checkbox', fixed: 'left'}
		                , {field: 'checkid', title: '检查单号', align: 'center', width: '257'}
		                , {field: 'rentid', title: '出租单号', align: 'center', width: '260'}
		                , {field: 'problem', title: '存在问题', align: 'center', width: '105'}
		                , {field: 'checkdesc', title: '问题描述', align: 'center', width: '150'}
		                , {field: 'paymoney', title: '赔付金额', align: 'center', width: '100'}
		                , {field: 'opername', title: '操作员', align: 'center', width: '100'}
		                , {field: 'checkdate', title: '检查时间', align: 'center', width: '180'}
		                , {field: 'createtime', title: '录入时间', align: 'center', width: '180'}
				      ,{toolbar:'#bar1',fixed:'right',title:'操作',align:'center',width:'250'}

				    ]]
				    ,page: true//开启分页
				});

				//模糊查询
				$('#doSearch').click(function() {
				var params=$('#searchForm').serialize();
				tableIns.reload({
					url:'${pageContext.request.contextPath}/check/loadAllCheck.action?'+params,
					curr:1
					});
				});

				
				
				//监听头部工具事件
				table.on('toolbar(checkTable)', function(obj){
				  //var checkStatus = table.checkStatus(obj.config.id);
				  switch(obj.event){
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
					var checkStatus=table.checkStatus('checkTable');
					console.log(checkStatus);
					var data=checkStatus.data;
					var params="";
					$.each(data,function (i,item) {
						if (i==0){
						    params+="checkids="+item.checkid;
						} else {
						    params+="&checkids="+item.checkid;
						}
                    });
					layer.confirm('真的删除这些检查单吗？', function(index){
						  //向服务端发送删除指令
							$.post("${pageContext.request.contextPath}/check/deleteBatchCheck.action",params,function(res)
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
				

				//监听工具条
				table.on('tool(checkTable)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				  var data = obj.data; //获得当前行数据
				  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				  var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
				  if(layEvent == 'del'){ //删除
								layer.confirm('真的删除【'+data.checkid+'】这个出租单吗', function(index){
								  //向服务端发送删除指令
									$.post("${pageContext.request.contextPath}/check/deleteCheck.action",{checkid:data.checkid},function(res)
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

				    openUpdateCheck(data);

				  } 
				});
				
				
				
				//修改检查单
				function openUpdateCheck(data){
					console.log(data);
					mainIndex= layer.open({
						type:1,
						title:'修改出租单',
						content:$('#saveOrUpdateDiv'),
						area:['800px','400px'],
						success:function(index){
							//var id=data.id+""; selectInitVal必须传一个字符串
							form.val('dataFrom',data);
							url="${pageContext.request.contextPath}/check/updateCheck.action";
							
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