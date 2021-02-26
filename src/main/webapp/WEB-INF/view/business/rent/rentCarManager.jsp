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
					<div class="layui-input-inline">
						<input type="text" name="identity" id="identity"  autocomplete="off" class="layui-input" placeholder="请输入身份证号"/>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					 <button type="button" class="layui-btn layui-btn-normal layui-icon layui-icon-search" id="doSearch">查询</button>
				</div>
			</div>
		</form>

		<!--搜索条件结束-->
    
		<!--数据表格开始-->
        <div id="content" style="display: none">
		<table id="carTable" lay-filter="carTable"></table>
        </div>

    
		 <!--行内工具栏-->
		<script type="text/html" id="bar1">
		  <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="edit">出租汽车</a>
		  <a class="layui-btn  layui-btn-xs" lay-event="showImg">查看大图</a>
		</script>

		<!--数据表格结束-->
    
        <!--添加修改菜单的弹出层开始-->
		<div style="display: none;" id="saveOrUpdateDiv">
			<form class="layui-form" action="" lay-filter="dataForm" id="form1">
				

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
						<input type="text" name="price" autocomplete="off" class="layui-input"/>
					</div>
				</div>
			</div>	
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">起租时间:</label>
					<div class="layui-input-inline">
						<input type="text" name="begindate" id="begindate" readonly autocomplete="off" class="layui-input"/>
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
					<label class="layui-form-label">操作员:</label>
					<div class="layui-input-block">
						<input type="text" name="opername" autocomplete="off" readonly class="layui-input" />
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
    
    
    
        <!--查看大图div开始-->
        <div id="viewCarImgDiv" style="display: none;text-align: center" >
	        <img alt="车辆图片" id="view_carimg">
        </div>
        <!--查看大图div结束-->
    

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
				//判断identity是否存在
				$.post("${pageContext.request.contextPath}/rent/checkCustomerExist.action",params,function (res) {
					if (res.code>=0){
						$("#content").show();
					    openTable();
					}else {
					    layer.msg("该顾客身份证号不存在");
					     $("#content").hide();
					}
                })	
				});
				
				function openTable(){
				    tableIns=table.render({
					elem: '#carTable'	//渲染的目标对象
				    ,url:'${pageContext.request.contextPath}/car/loadAllCar.action?'
				    ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
				      title: '提示'
				      ,layEvent: 'LAYTABLE_TIPS'
				      ,icon: 'layui-icon-tips'
				    }]
				    ,title: '汽车数据表' //数据导出的标题
					,cellMinWidth:200//设置列的最小默认宽度
				    ,cols: [[
				      {field:'carnumber', title:'车牌号',align:'center'}
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
				    
                }
				
				//监听工具条
				table.on('tool(carTable)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				  var data = obj.data; //获得当前行数据
				  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				  var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
				  if(layEvent == 'edit'){ //编辑
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
						title:'添加汽车出租',
						content:$('#saveOrUpdateDiv'),
						area:['700px','400px'],
						skin:'layui-layer-molv',
						success:function(index){
							$('#form1')[0].reset();
							//请求数据
							var identity=$('#identity').val();
							var price=data.rentprice;
							var carnumber=data.carnumber;
							$.get("${pageContext.request.contextPath}/rent/initRentForm.action",{
							    identity:identity,
								price:price,
								carnumber:carnumber
							},function (res) {
								form.val("dataForm",res);
                            })
							url="${pageContext.request.contextPath}/rent/saveRent.action";
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
						//隐藏表格
						$('#content').hide();
						
					});
				})
				
			
			
				
			});
			
			
		</script>

    </body>
</html>