<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>顾客区域统计</title>
</head>
<body style="height: 100%">
	<div id="container" style="height: 100%"></div>


	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/echarts/echarts.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/echarts/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		$.get("${pageContext.request.contextPath}/stat/loadCustomerAreaStatJson.action",function(data){

		var chartDom =echarts.init(document.getElementById('container'));
		
		var option= {
			title: {
			    text: '汽车出租系统客户区域统计',
			    left: 'center'
			},
			tooltip: {
			    trigger: 'item'
			},
			legend: {
			    orient: 'vertical',
			    left: 'left',
			},
			series: [
			    {
			        name: '客户数量',
			        type: 'pie',
			        radius: '50%',
			        data:data,
			        emphasis: {
			            itemStyle: {
			                shadowBlur: 10,
			                shadowOffsetX: 0,
			                shadowColor: 'rgba(0, 0, 0, 0.5)'
			            }
			        }
			    }
			]
			};
			
			
			chartDom.setOption(option);
		   
		})

	</script>
</body>
</html>