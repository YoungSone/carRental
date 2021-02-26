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
					<label class="layui-form-label">车牌号:</label>
					<div class="layui-input-inline">
						<input type="text" name="carnumber" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">车辆类型:</label>
					<div class="layui-input-inline">
						<input type="text" name="cartype" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">车辆颜色:</label>
					<div class="layui-input-inline">
						<input type="text" name="color" autocomplete="off" class="layui-input"/>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">车辆描述:</label>
					<div class="layui-input-inline">
						<input type="text" name="description" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">是否出租:</label>
					<div class="layui-input-inline">
						<input type="radio" name="isrenting" value="1" autocomplete="off" title="已出租" class="layui-input"/>
						<input type="radio" name="isrenting" value="0" autocomplete="off" title="未出租" class="layui-input"/>
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
		<table class="layui-hide" id="carTable" lay-filter="carTable"></table>



		<!--表头工具栏-->
		<script type="text/html" id="toolbar1">
		  <div class="layui-btn-container">
		    <button class="layui-btn layui-btn-sm" lay-event="add">增加汽车 </button>
		    <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="deleteBatch">删除选中</button>
		  </div>
		</script>
		 <!--行内工具栏-->
		<script type="text/html" id="bar1">
		  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
		  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		  <a class="layui-btn  layui-btn-xs" lay-event="showImg">查看大图</a>
		</script>

		<!--数据表格结束-->


		<!--添加修改菜单的弹出层开始-->
		<div style="display: none;" id="saveOrUpdateDiv">
			<form class="layui-form layui-row layui-col-space10" action="" lay-filter="dataForm" id="form1">
			<div class="layui-col-md12 layui-col-xs12">
				<div class="layui-row layui-col-space10">
					<div class="layui-col-md9 layui-col-xs7">
						<div class="layui-form-item magt3">
							<label class="layui-form-label">车牌号</label>
							<div class="layui-input-block">
								<input type="text" name="carnumber" class="layui-input" lay-verify="required" placeholder="请输入车牌号">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">车辆类型</label>
							<div class="layui-input-block">
								<input type="text" name="cartype" class="layui-input" lay-verify="required" placeholder="请输入车辆类型">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">车辆颜色</label>
							<div class="layui-input-block">
								<input type="text" name="color" class="layui-input" lay-verify="required" placeholder="请输入车辆颜色">
							</div>
						</div>
					</div>
					<div class="layui-col-md3 layui-col-xs5">
						<div class="layui-upload-list thumbBox mag0 magt3" id="carimgDiv">
							<!--显示上传图片-->
							<img class="layui-upload-img thumbImg" id="showCarImg">
							<!--保存当前显示图片的地址-->
							<input type="hidden" name="carimg" id="carimg"> 
						</div>
					</div>
				</div>
				<div class="layui-form-item magb0">
					<div class="layui-inline">
						<label class="layui-form-label">购买价格</label>
						<div class="layui-input-block">
							<input type="text" name="price" class="layui-input" lay-verify="required|number" placeholder="请输入购买价格">			
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">出租价格</label>
						<div class="layui-input-block">
							<input type="text" name="rentprice" class="layui-input" lay-verify="required|number" placeholder="请输入出租价格">			
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">出租押金</label>
						<div class="layui-input-block">
							<input type="text" name="deposit" class="layui-input" lay-verify="required|number" placeholder="请输入出租押金">			
						</div>
					</div>
				</div>
				<div class="layui-form-item magb0">
						<label class="layui-form-label">车辆描述</label>
						<div class="layui-input-block">
							<input type="text" name="description" class="layui-input" lay-verify="required|number" placeholder="请输入车辆描述">			
						</div>
				</div>
				<div class="layui-form-item magb0">
					<div class="layui-inline">
						<label class="layui-form-label">车辆状态</label>
						<div class="layui-input-block">
							<div class="layui-input-inline">
								<input type="radio" name="isrenting" value="1" autocomplete="off" title="已出租" class="layui-input"/>
								<input type="radio" name="isrenting" value="0" autocomplete="off" title="未出租" class="layui-input" checked/>
							</div>		
						</div>
					</div>
				</div>
				<div class="layui-form-item magb0">
						    <div class="layui-input-block layui-center">
						      <button type="button" class="layui-btn layui-btn-normal layui-icon layui-icon-release" lay-filter="doSubmit" lay-submit="">提交</button>
						      <button type="reset" class="layui-btn layui-btn-warm layui-icon layui-icon-refresh" id="dataFrmResetBtn">重置</button>
						    </div>
				</div>
			</div>
			</form>
			

		</div>
		<!--添加修改的弹出层结束-->
        
        <!--查看大图div开始-->
        <div id="viewCarImgDiv" style="display: none;text-align: center" >
	        <img alt="车辆图片" id="view_carimg">
        </div>
        <!--查看大图div结束-->
    

		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js" ></script>
		<script>
			//提升tableIns作用域使外部方法可以访问
			var tableIns;
			layui.use(['table','jquery','layer','form','upload'],function(){
				var $=layui.jquery;
				var table=layui.table;
				var layer=layui.layer;
				var form=layui.form;
				var upload=layui.upload;


				var url;
				var mainIndex;
				tableIns=table.render({
					elem: '#carTable'	//渲染的目标对象
				    ,url:'${pageContext.request.contextPath}/car/loadAllCar.action'
				    ,toolbar: '#toolbar1' //开启头部工具栏，并为其绑定左侧模板
				    ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
				      title: '提示'
				      ,layEvent: 'LAYTABLE_TIPS'
				      ,icon: 'layui-icon-tips'
				    }]
				    ,title: '汽车数据表' //数据导出的标题
					,cellMinWidth:200//设置列的最小默认宽度
				    ,cols: [[
				      {type: 'checkbox', fixed: 'left'}
				      ,{field:'carnumber', title:'车牌号',align:'center'}
				      ,{field:'cartype', title:'车辆类型',align:'center'}
				      ,{field:'color', title:'车辆颜色',align:'center'}
				      ,{field:'price', title:'购买价格',align:'center'}
				      ,{field:'rentprice', title:'出租价格',align:'center'}
				      ,{field:'deposit', title:'出租押金',align:'center'}
				      ,{field:'isrenting', title:'出租状态',align:'center',templet: function(d){
				        return d.isrenting=='1'?'<font color=blue>已出租</font>':'<font color=red>未出租</font>';
				      }}
				      ,{field:'description', title:'车辆描述',align:'center'}
				      ,{field:'carimg', title:'缩略图',align:'center',width:'80',templet:function(d) {
						return "<img width=40 height=40 src=${pageContext.request.contextPath}/file/downloadShowFile.action?path="+d.carimg+"/>";
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
					url:'${pageContext.request.contextPath}/car/loadAllCar.action?'+params,
					curr:1
					});
				});


				//监听头部工具事件
				table.on('toolbar(carTable)', function(obj){
				  //var checkStatus = table.checkStatus(obj.config.id);
				  switch(obj.event){
				    case 'add':
				    	openAddCar();
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
					var checkStatus=table.checkStatus('carTable');
					console.log(checkStatus);
					var data=checkStatus.data;
					var params="";
					$.each(data,function (i,item) {
						if (i==0){
						    params+="carnumbers="+item.carnumber;
						} else {
						    params+="&carnumbers="+item.carnumber;
						}
                    });
					layer.confirm('真的删除这些顾客吗？', function(index){
						  //向服务端发送删除指令
							$.post("${pageContext.request.contextPath}/car/deleteBatchCar.action",params,function(res)
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
				function openAddCar(){
					mainIndex= layer.open({
						type:1,
						title:'添加车辆',
						content:$('#saveOrUpdateDiv'),
						area:['920px','450px'],
						skin:'layui-layer-molv',
						success:function(index){
						    
							$('#form1')[0].reset();
							$("#showCarImg").attr("src","${pageContext.request.contextPath}/file/downloadShowFile.action?path=images/defaultcarimage.jpg");
							$("#carimg").val("images/defaultcarimage.jpg");
							url="${pageContext.request.contextPath}/car/addCar.action";
						}

					});
				}
				

				
				
				

				//监听工具条
				table.on('tool(carTable)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				  var data = obj.data; //获得当前行数据
				  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				  var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
				  if(layEvent == 'del'){ //删除
								layer.confirm('真的删除【'+data.carnumber+'】这个辆汽车吗', function(index){
								  //向服务端发送删除指令
									$.post("${pageContext.request.contextPath}/car/deleteCar.action",{carnumber:data.carnumber},function(res)
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

				    openUpdateCar(data);

				  }else if (layEvent=='showImg'){
				      //查看大图
					  openImg(data);
                  }
				});
				
				
				//查看车辆大图
				function openImg(data) {
					layer.open({
						type:1,
						title:data.carnumber+"车辆图片",
						content:$('#viewCarImgDiv'),
						area:['600px','500px'],
						success:function (index) {
							$('#view_carimg').attr("src","${pageContext.request.contextPath}/file/downloadShowFile.action?path="+data.carimg);	
                        }
					});
                }
				
				
				
				//修改车辆
				function openUpdateCar(data){
					//console.log(data);
					mainIndex= layer.open({
						type:1,
						title:'修改车辆',
						content:$('#saveOrUpdateDiv'),
						area:['920px','450px'],
						success:function(index){
							//var id=data.id+""; selectInitVal必须传一个字符串
							form.val('dataForm',data);
							url="${pageContext.request.contextPath}/car/updateCar.action";
							
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
				
				//上传图片
			 //上传缩略图
		    upload.render({
		        elem: '#carimgDiv',
		        url: '${pageContext.request.contextPath}/file/uploadFile.action',
			    acceptMime:'images/*',//图片
			    auto:true,//自动上传
			    field:'mf',//后台接收名
		        method : "get",  //此处是为了演示之用，实际使用中请将此删除，默认用post方式提交
		        done: function(res, index, upload){
		            var data=res.data;
		          //  console.log(data);
		            $('#showCarImg').attr('src',"${pageContext.request.contextPath}/file/downloadShowFile.action?path="+data.src);
		            $('#carimg').val(data.src);
		            $('#carimgDiv').css("background","#fff");
		        }
		    });
				
			});
			
			
		</script>

    </body>
</html>