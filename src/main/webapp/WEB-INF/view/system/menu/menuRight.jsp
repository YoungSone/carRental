<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>右侧菜单</title>
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
					<label class="layui-form-label">菜单名称:</label>
					<div class="layui-input-inline">
						<input type="text" name="title" autocomplete="off" class="layui-input"/>
					</div>
				</div>
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
		<table class="layui-hide" id="menuTable" lay-filter="menuTable"></table>



		<!--表头工具栏-->
		<script type="text/html" id="toolbar1">
		  <div class="layui-btn-container">
		    <button class="layui-btn layui-btn-sm" lay-event="add">增加</button>
		    <button class="layui-btn layui-btn-sm" lay-event="batchDelete">删除选中</button>
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
					<label class="layui-form-label">父级菜单:</label>
					<div class="layui-input-block">
						 	<input type="text" class="layui-hide" id="pid" name="pid">
							<div id="selTree" class="dtree" data-id="0">
							<input type="text" placeholder="请选择" readonly="" class="layui-input layui-unselect">
							</div>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">菜单名称</label>
					<div class="layui-input-block">
						<input type="text" class="layui-hide" id="id" name="id">
						<input type="text" name="title" lay-verify="required" placeholder="请输入菜单名称" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">菜单地址</label>
					<div class="layui-input-block">
						<input type="text" name="href" placeholder="请输入菜单地址" autocomplete="off" class="layui-input"/>
					</div>
				</div>

				<div class="layui-form-item">
					<div class="layui-inline">
					<label class="layui-form-label">菜单图标:</label>
					<div class="layui-input-inline">
						<input type="text" name="icon" placeholder="请输入菜单图标" autocomplete="off" class="layui-input"/>
					</div>
					</div>
					<div class="layui-inline">
					<label class="layui-form-label">TARGET:</label>
					<div class="layui-input-inline">
						<input type="text" name="target" placeholder="请输入TRAGET" autocomplete="off" class="layui-input"/>
					</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-inline">
					<label class="layui-form-label">是否展开:</label>
					<div class="layui-input-inline">
						<input type="radio" name="spread" value="1" autocomplete="off" title="展开" class="layui-input"/>
						<input type="radio" name="spread" value="0" autocomplete="off" title="不展开" class="layui-input"/>
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

		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js" ></script>
		<script>
			//提升tableIns作用域使外部方法可以访问
			var tableIns;
			var menuSelectTree;
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
					elem: '#menuTable'	//渲染的目标对象
				    ,url:'${pageContext.request.contextPath}/menu/loadAllMenu.action'
				    ,toolbar: '#toolbar1' //开启头部工具栏，并为其绑定左侧模板
				    ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
				      title: '提示'
				      ,layEvent: 'LAYTABLE_TIPS'
				      ,icon: 'layui-icon-tips'
				    }]
				    ,title: '菜单数据表' //数据导出的标题
					,cellMinWidth:100//设置列的最小默认宽度
				    ,cols: [[
				      {type: 'checkbox', fixed: 'left'}
				      ,{field:'id', title:'ID',align:'center',width:'100'}
				      ,{field:'pid', title:'父节点ID',align:'center',width:'120'}
				      ,{field:'title', title:'菜单名称',align:'center',width:'150'}
				      ,{field:'href', title:'菜单地址',align:'center',width:'200'}
				      ,{field:'spread', title:'是否展开',align:'center',width:'100', templet: function(d){
				        return d.spread=='1'?'<font color=blue>展开</font>':'<font color=red>不展开</font>';
				      }}
				      ,{field:'targer', title:'TARGET',align:'center',width:'100'}
				      ,{field:'icon', title:'菜单图标',align:'center',width:'100',templet:function (d) {
				      	return "<div class='layui-icon'>"+d.icon+"</div>";
					   }}
				      ,{field:'available', title:'是否可用',align:'center',width:'100',templet: function(d){
				        return d.available=='1'?'<font color=blue>可用</font>':'<font color=red>不可用</font>';
				      }}
				      ,{toolbar:'#bar1',fixed:'right',title:'操作',align:'center',width:'200'}

				    ]]
				    ,page: true//开启分页
				});

				//模糊查询
				$('#doSearch').click(function() {
				var params=$('#searchForm').serialize();
				tableIns.reload({
					url:'${pageContext.request.contextPath}/menu/loadAllMenu.action?'+params
					});
				});


				//监听头部工具事件
				table.on('toolbar(menuTable)', function(obj){
				  //var checkStatus = table.checkStatus(obj.config.id);
				  switch(obj.event){
				    case 'add':
				    	openAddMenu();
				      //layer.msg('添加');
				    break;
				    case 'batchDelete':
				      layer.msg('删除');
				    break;


				  };
				});

				//打开添加页面
				function openAddMenu(){
					mainIndex= layer.open({
						type:1,
						title:'添加菜单',
						content:$('#saveOrUpdateDiv'),
						area:['700px','400px'],
						skin:'layui-layer-molv',
						success:function(index){
							$('#form1')[0].reset();
							url="${pageContext.request.contextPath}/menu/addMenu.action";
							//初始化下拉列表树
							dtree.reload("selTree",{
								url:"${pageContext.request.contextPath}/menu/loadMenuManagerLeftTreeJson.action"
							  });

						}

					});
				}

				//加载下拉列表树
				menuSelectTree=dtree.renderSelect({
				  elem: "#selTree",
	              dataStyle:"layuiStyle",
				  //自定义返回头信息
				  response:{message:"msg",statusCode:0},
	  			  dataFormat:"list",
				  width: "100%", // 指定树的宽度
				  url: "${pageContext.request.contextPath}/menu/loadMenuManagerLeftTreeJson.action",
				  method:'get'
				});

				//下拉树监听 选择事件 后给页面中隐藏元素赋值
				dtree.on("changeSelect('selTree')",function(obj) {
					var pid=obj.param.selTree_select_nodeId
					$('#pid').val(pid);
					//console.log(pid);
					//console.log(obj.param);
				})

				//监听工具条
				table.on('tool(menuTable)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				  var data = obj.data; //获得当前行数据
				  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				  var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
				  if(layEvent == 'del'){ //删除

				  	$.post("${pageContext.request.contextPath}/menu/checkMenuHasChildren.action?id="+data.id,function(obj){
						if (obj.code>=0){
							layer.msg("当前菜单有子节点，请先删除子节点");
						}else {
								layer.confirm('真的删除【'+data.title+'】这个菜单吗', function(index){
								  //向服务端发送删除指令
									$.post("${pageContext.request.contextPath}/menu/deleteMenu.action",{id:data.id},function(res)
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
											//更新菜单左侧列表树
											window.parent.left.menuTree.reload();
											dtree.reload("selTree",{
												url:"${pageContext.request.contextPath}/menu/loadMenuManagerLeftTreeJson.action"
											  });
										})
								});
							}
					})

				  } else if(layEvent == 'edit'){ //编辑
				    //do something

				    openUpdateMenu(data);

				  }
				});
				//修改Menu
				function openUpdateMenu(data){
					//console.log(data);
					mainIndex= layer.open({
						type:1,
						title:'修改菜单',
						content:$('#saveOrUpdateDiv'),
						area:['600px','400px'],
						success:function(index){
							var pid=data.pid+""; //selectInitVal必须传一个字符串
	
							form.val('dataForm',data);
							url="${pageContext.request.contextPath}/menu/updateMenu.action";
							dtree.reload("selTree",{
								url:"${pageContext.request.contextPath}/menu/loadMenuManagerLeftTreeJson.action",
								selectInitVal:pid
							  });
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
						//添加修改完成后要清空表单
						$('#form1')[0].reset();
						layer.close(mainIndex);
						//刷新表格
						tableIns.reload();
						//修改菜单左侧列表树
						
						window.parent.left.menuTree.reload();
						//修改
						//刷新添加和修改的下拉树
						//dtree reload必须要指定url不然会出现 url后接上提交的表单数据错误
						dtree.reload("selTree",{
						url:"${pageContext.request.contextPath}/menu/loadMenuManagerLeftTreeJson.action"
					  });
					});
				})
			});
			//更新数据表格通过id 左侧菜单树使用
			function reloadTable(id) {
				tableIns.reload({
					url:'${pageContext.request.contextPath}/menu/loadAllMenu.action?id='+id
					});
			}
		</script>

    </body>
</html>