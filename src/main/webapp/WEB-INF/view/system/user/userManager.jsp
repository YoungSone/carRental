<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用户管理</title>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui_ext/dtree/dtree.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui_ext/dtree/font/dtreefont.css" />
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
					<label class="layui-form-label">用户姓名:</label>
					<div class="layui-input-inline">
						<input type="text" name="realname" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">登录名称:</label>
					<div class="layui-input-inline">
						<input type="text" name="loginname" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">用户地址:</label>
					<div class="layui-input-inline">
						<input type="text" name="address" autocomplete="off" class="layui-input"/>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">用户电话:</label>
					<div class="layui-input-inline">
						<input type="text" name="phone" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">身份证号码:</label>
					<div class="layui-input-inline">
						<input type="text" name="identity" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">性别:</label>
					<div class="layui-input-inline">
						<input type="radio" name="sex" value="1" autocomplete="off" title="可用" class="layui-input"/>
						<input type="radio" name="sex" value="0" autocomplete="off" title="不可用" class="layui-input"/>
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
		<table class="layui-hide" id="userTable" lay-filter="userTable"></table>



		<!--表头工具栏-->
		<script type="text/html" id="toolbar1">
		  <div class="layui-btn-container">
		    <button class="layui-btn layui-btn-sm" lay-event="add">增加</button>
		    <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="deleteBatch">删除选中</button>
		  </div>
		</script>
		 <!--行内工具栏-->
		<script type="text/html" id="bar1">
		  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
		  <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="resetUserPwd">重置密码</a>
		  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		  <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="selectUserRole">分配角色</a>
		</script>

		<!--数据表格结束-->


		<!--添加修改菜单的弹出层开始-->
		<div style="display: none;" id="saveOrUpdateDiv">
			<form class="layui-form" action="" lay-filter="dataForm" id="form1">
				

				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">用户姓名</label>
						<div class="layui-input-inline">
							<input type="text" class="layui-hide" id="userid" name="userid">
							<input type="text" name="realname" lay-verify="required" placeholder="请输入用户姓名" autocomplete="off" class="layui-input"/>
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">登录名称</label>
						<div class="layui-input-inline">
							<input type="text" name="loginname" lay-verify="required" placeholder="请输入登录名称" autocomplete="off" class="layui-input"/>
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">身份证号</label>
						<div class="layui-input-inline">
							<input type="text" name="identity" lay-verify="required|identity" placeholder="请输入身份证" autocomplete="off" class="layui-input"/>
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">用户地址</label>
						<div class="layui-input-inline">
							<input type="text" name="address" lay-verify="required" placeholder="请输入用户地址" autocomplete="off" class="layui-input"/>
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">用户电话</label>
						<div class="layui-input-inline">
							<input type="text" name="phone" lay-verify="required|phone" placeholder="请输入用户电话" autocomplete="off" class="layui-input"/>
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">用户职位</label>
						<div class="layui-input-inline">
							<input type="text" name="position" lay-verify="required" placeholder="请输入用户职位" autocomplete="off" class="layui-input"/>
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-inline">
					<label class="layui-form-label">性别:</label>
					<div class="layui-input-inline">
						<input type="radio" name="sex" value="1" autocomplete="off" title="男" class="layui-input"/>
						<input type="radio" name="sex" value="0" autocomplete="off" title="女" class="layui-input"/>
					</div>
					</div>
					<div class="layui-inline">
					<label class="layui-form-label">是否可用:</label>
					<div class="layui-input-inline">
						<input type="radio" name="available" value="1" autocomplete="off" title="可用" class="layui-input"/>
						<input type="radio" name="available" value="0" autocomplete="off" title="不可用" class="layui-input"/>
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

		</div>
		<!--添加修改的弹出层结束-->
    
        <!--用户分配角色弹出层开始-->
        <div style="display: none" id="selectRoleDiv">
	        <table  id="roleTable" lay-filter="roleTable"></table>
        </div>
        <!--角色分配菜单弹出层结束-->
    

		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js" ></script>
		<script>
			//提升tableIns作用域使外部方法可以访问
			var tableIns;
			layui.extend({
			    dtree: '${pageContext.request.contextPath}/resources/layui_ext/dist/dtree'   // {/}的意思即代表采用自有路径，即不跟随 base 路径
			  }).use(['table','jquery','layer','dtree','form'],function(){
				var $=layui.jquery;
				var table=layui.table;
				var layer=layui.layer;
				var form=layui.form;
				var dtree=layui.dtree;


				var url;
				var mainIndex;
				tableIns=table.render({
					elem: '#userTable'	//渲染的目标对象
				    ,url:'${pageContext.request.contextPath}/user/loadAllUser.action'
				    ,toolbar: '#toolbar1' //开启头部工具栏，并为其绑定左侧模板
				    ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
				      title: '提示'
				      ,layEvent: 'LAYTABLE_TIPS'
				      ,icon: 'layui-icon-tips'
				    }]
				    ,title: '用户数据表' //数据导出的标题
					,cellMinWidth:200//设置列的最小默认宽度
				    ,cols: [[
				      {type: 'checkbox', fixed: 'left'}
				      ,{field:'userid', title:'ID',align:'center'}
				      ,{field:'realname', title:'用户姓名',align:'center'}
				      ,{field:'loginname', title:'登录名',align:'center'}
				      ,{field:'identity', title:'身份证号',align:'center'}
				      ,{field:'phone', title:'用户电话',align:'center'}
				      ,{field:'address', title:'用户地址',align:'center'}
				      ,{field:'sex', title:'性别',align:'center',templet: function(d){
				        return d.available=='1'?'<font color=blue>男</font>':'<font color=red>女</font>';
				      }}
				      ,{field:'pwd', title:'密码',align:'center',templet: function(d){
				        return "******";
				      }}
				      ,{field:'available', title:'是否可用',align:'center',templet: function(d){
				        return d.available=='1'?'<font color=blue>可用</font>':'<font color=red>不可用</font>';
				      }}
				      ,{toolbar:'#bar1',fixed:'right',title:'操作',align:'center',width:'300'}

				    ]]
				    ,page: true//开启分页
				});

				//模糊查询
				$('#doSearch').click(function() {
				var params=$('#searchForm').serialize();
				tableIns.reload({
					url:'${pageContext.request.contextPath}/user/loadAllUser.action?'+params
					});
				});


				//监听头部工具事件
				table.on('toolbar(userTable)', function(obj){
				  //var checkStatus = table.checkStatus(obj.config.id);
				  switch(obj.event){
				    case 'add':
				    	openAddUser();
				      //layer.msg('添加');
				    break;
				    case 'deleteBatch':
				        deleteBatch();
				        //console.log(obj);
				      //layer.msg('删除');
				    break;


				  };
				});
				
				//批量删除用户
				function deleteBatch() {
					//得到选中数据行
					var checkStatus=table.checkStatus('userTable');
					console.log(checkStatus);
					var data=checkStatus.data;
					var params="";
					$.each(data,function (i,item) {
						if (i==0){
						    params+="ids="+item.userid;
						} else {
						    params+="&ids="+item.userid;
						}
                    });
					layer.confirm('真的删除这些用户吗？', function(index){
						  //向服务端发送删除指令
							$.post("${pageContext.request.contextPath}/user/deleteBatchUser.action",params,function(res)
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
				function openAddUser(){
					mainIndex= layer.open({
						type:1,
						title:'添加用户',
						content:$('#saveOrUpdateDiv'),
						area:['700px','400px'],
						skin:'layui-layer-molv',
						success:function(index){
							$('#form1')[0].reset();
							url="${pageContext.request.contextPath}/user/addUser.action";
							

						}

					});
				}
				
				

				
				
				

				//监听工具条
				table.on('tool(userTable)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				  var data = obj.data; //获得当前行数据
				  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				  var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
				  if(layEvent == 'del'){ //删除
								layer.confirm('真的删除【'+data.realname+'】这个用户吗', function(index){
								  //向服务端发送删除指令
									$.post("${pageContext.request.contextPath}/user/deleteUser.action",{userid:data.userid},function(res)
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
				  }else if (layEvent=='selectUserRole'){
				      //给角色添加菜单
				      openselectUserRole(data);
				      
                  }else if(layEvent == 'edit'){ //编辑
				    //do something

				    openUpdateUser(data);

				  }else if (layEvent=='resetUserPwd'){ 
				      //重置密码
					  var userid=data.userid;
					  $.post("${pageContext.request.contextPath}/user/resetUserPwd.action",{userid:userid},function (res) {
						  layer.msg(res.msg);
                      })
					  
                  }
				});
				
				//打开分配菜单弹出层给角色添加菜单
				function openselectUserRole(data) {
				    var selectTree;
					layer.open({
						type:1,
						title:'分配【'+data.realname+'】的角色',
						content:$('#selectRoleDiv'),
						area:['700px','400px'],
						skin:'layui-layer-molv',
						btnAlign:'c',
						btn:['<div class="layui-icon layui-icon-release">确认分配</div>','<div class="layui-icon layui-icon-close">取消分配</div>'],
						yes:function(index,layero){
						    var checkStatus=table.checkStatus('roleTable');
						    var roleData=checkStatus.data;
						    //console.log(roleData);
							var userid=data.userid;
						    var params="userid="+userid;
						    $.each(roleData,function (i,item) {
							    params+="&ids="+item.roleid;
                            })
							$.post("${pageContext.request.contextPath}/user/saveUserRole.action?",params,function (res) {
								if (res.code>=0){
								    layer.msg(res.msg);
								    layer.close(index);
								}else {
								    layer.msg(res.msg+",要不再试试");
								}
                            })
							
						},
						success:function(index){
							table.render({
									elem: '#roleTable'	//渲染的目标对象
								    ,url:'${pageContext.request.contextPath}/user/initUserRole.action?userid='+data.userid
								    ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
								      title: '提示'
								      ,layEvent: 'LAYTABLE_TIPS'
								      ,icon: 'layui-icon-tips'
								    }]
								    ,title: '角色数据表' //数据导出的标题
									,cellMinWidth:100//设置列的最小默认宽度
								    ,cols: [[
								      {type: 'checkbox', fixed: 'left'}
								      ,{field:'roleid', title:'ID',align:'center'}
								      ,{field:'rolename', title:'角色名称',align:'center'}
								      ,{field:'roledesc', title:'角色描述',align:'center'}
				
								    ]]
								});
						}

					});
                }
				
				//修改角色
				function openUpdateUser(data){
					//console.log(data);
					mainIndex= layer.open({
						type:1,
						title:'修改用户',
						content:$('#saveOrUpdateDiv'),
						area:['600px','400px'],
						success:function(index){
							var pid=data.pid+""; //selectInitVal必须传一个字符串

							form.val('dataForm',data);
							url="${pageContext.request.contextPath}/user/updateUser.action";
							
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