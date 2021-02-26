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
					<label class="layui-form-label">出租单号:</label>
					<div class="layui-input-inline">
						<input type="text" name="rentid" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">身份证号:</label>
					<div class="layui-input-inline">
						<input type="text" name="identity" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">车牌号:</label>
					<div class="layui-input-inline">
						<input type="text" name="carnumber" autocomplete="off" class="layui-input"/>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">开始时间:</label>
					<div class="layui-input-inline">
						<input type="text" name="begindate"  id="startTime" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">结束时间:</label>
					<div class="layui-input-inline">
						<input type="text" name="returndate" id="endTime" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">出租状态:</label>
					<div class="layui-input-inline">
						<input type="radio" name="rentflag" value="1" autocomplete="off" title="已归还" class="layui-input"/>
						<input type="radio" name="rentflag" value="0" autocomplete="off" title="未归还" class="layui-input"/>
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
		<table class="layui-hide" id="rentTable" lay-filter="rentTable"></table>



		
		 <!--行内工具栏-->
		<script type="text/html" id="bar1">
			 {{#  if(d.rentflag == 1){ }}
		    <a class="layui-btn layui-btn-green layui-btn-xs layui-btn-radius" lay-event="exportRent">导出出租单</a>
		    {{#  } else { }}
		    <a class="layui-btn layui-btn-xs layui-btn-radius" lay-event="edit">编辑</a>
		    <a class="layui-btn layui-btn-danger layui-btn-xs layui-btn-radius" lay-event="del">删除</a>
		    <a class="layui-btn layui-btn-green layui-btn-xs layui-btn-radius" lay-event="exportRent">导出出租单</a>
		    {{#  } }}
		  
		</script>

		<!--数据表格结束-->


		<!--添加修改菜单的弹出层开始-->
		<div style="display: none;" id="saveOrUpdateDiv">
			<form class="layui-form" action="" lay-filter="dataForm" id="form1">
				
				<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">起租时间:</label>
					<div class="layui-input-inline">
						<input type="text" name="begindate" id="begindate"  readonly autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">还车时间:</label>
					<div class="layui-input-inline">
						<input type="text" name="returndate" id="returndate" autocomplete="off" class="layui-input" placeholder="请选择还车时间"/>
					</div>
				</div>
			</div>
				<div class="layui-form-item">
					<label class="layui-form-label">出租单号:</label>
					<div class="layui-input-block">
						<input type="text" name="rentid" autocomplete="off" readonly class="layui-input" placeholder="请输入出租单号"/>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">身份证号:</label>
					<div class="layui-input-block">
						<input type="text" name="identity" autocomplete="off" readonly class="layui-input" placeholder="请输入身份证号"/>
					</div>
				</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">车牌号:</label>
					<div class="layui-input-inline">
						<input type="text" name="carnumber" autocomplete="off" readonly class="layui-input" placeholder="请输入车牌号"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">出租价格:</label>
					<div class="layui-input-inline">
						<input type="text" name="price" autocomplete="off" lay-verify="required|number" class="layui-input"/>
					</div>
				</div>
			</div>	
			
			<div class="layui-form-item">
					<label class="layui-form-label">操作员:</label>
					<div class="layui-input-block">
						<input type="text" name="opername" autocomplete="off" readonly class="layui-input" />
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
					elem:'#begindate',
					type:'datetime'
				})
				
				laydate.render({
					elem:'#returndate',
					type:'datetime'
				})
				


				var url;
				var mainIndex;
				tableIns=table.render({
					elem: '#rentTable'	//渲染的目标对象
				    ,url:'${pageContext.request.contextPath}/rent/loadAllRent.action'
				    ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
				      title: '提示'
				      ,layEvent: 'LAYTABLE_TIPS'
				      ,icon: 'layui-icon-tips'
				    }]
				    ,title: '出租单数据表' //数据导出的标题
					,cellMinWidth:200//设置列的最小默认宽度
				    ,cols: [[
				      {type: 'checkbox', fixed: 'left'}
				      ,{field:'rentid', title:'出租单号',align:'center'}
				      ,{field:'identity', title:'身份证号',align:'center'}
				      ,{field:'carnumber', title:'车牌号',align:'center'}
				      ,{field:'begindate', title:'起租时间',align:'center'}
				      ,{field:'returndate', title:'换车时间',align:'center'}
				      ,{field:'price', title:'出租价格',align:'center'}
				      ,{field:'sex', title:'出租状态',align:'center',templet: function(d){
				        return d.rentflag=='1'?'<font color=blue>已归还</font>':'<font color=red>未归还</font>';
				      }}
				       ,{field:'opername', title:'操作员',align:'center'}
				       ,{field:'createtime', title:'录入时间',align:'center'}
				      ,{toolbar:'#bar1',fixed:'right',title:'操作',align:'center',width:'250'}

				    ]]
				    ,page: true//开启分页
				});

				//模糊查询
				$('#doSearch').click(function() {
				var params=$('#searchForm').serialize();
				tableIns.reload({
					url:'${pageContext.request.contextPath}/rent/loadAllRent.action?'+params,
					curr:1
					});
				});

				

				//监听工具条
				table.on('tool(rentTable)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				  var data = obj.data; //获得当前行数据
				  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				  var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
				  if(layEvent == 'del'){ //删除
								layer.confirm('真的删除【'+data.rentid+'】这个出租单吗', function(index){
								  //向服务端发送删除指令
									$.post("${pageContext.request.contextPath}/rent/deleteRent.action",{rentid:data.rentid},function(res)
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

				    openUpdateRent(data);

				  }else if(layEvent==='exportRent'){//导出出租单
                window.location.href="${alfred}/stat/exportRent.action?rentid="+data.rentid;
            } 
				});
				
				
				
				//修改顾客
				function openUpdateRent(data){
					//console.log(data);
					mainIndex= layer.open({
						type:1,
						title:'修改出租单',
						content:$('#saveOrUpdateDiv'),
						area:['800px','400px'],
						success:function(index){
							//var id=data.id+""; selectInitVal必须传一个字符串
							form.val('dataForm',data);
							url="${pageContext.request.contextPath}/rent/updateRent.action";
							
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