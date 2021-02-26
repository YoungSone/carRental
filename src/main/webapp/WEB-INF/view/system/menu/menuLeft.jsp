<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>左侧树</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui_ext/dtree/dtree.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui_ext/dtree/font/dtreefont.css" />
</head>
<body>
    <div id="menuTree" class="dtree" data-id="0"></div>

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>

    <script type="text/javascript">

			var menuTree;
			 layui.extend({
			    dtree: '${pageContext.request.contextPath}/resources/layui_ext/dist/dtree'   // {/}的意思即代表采用自有路径，即不跟随 base 路径
			  }).use(['dtree','layer','jquery'], function(){
			    var dtree = layui.dtree;
			    var layer = layui.layer;
			    var $ = layui.jquery;



			    // 初始化树
			    menuTree = dtree.render({
			      elem: '#menuTree',
				  dataStyle:"layuiStyle",
				  //自定义返回头信息
				  response:{message:"msg",statusCode:0},
	  			  dataFormat:"list",
			      //url:'../resources/user.json'
			      url: '${pageContext.request.contextPath}/menu/loadMenuManagerLeftTreeJson.action?spread=1', // 使用url加载（可与data加载同时存在）
			      method:'get'
			    });

			    //监听节点点击事件
			    dtree.on("node('menuTree')" ,function(obj){
					var id=obj.param.nodeId;
					window.parent.right.reloadTable(id);
				  // console.log(obj.param); // 点击当前节点传递的参数
				  // console.log(obj.dom); // 当前节点的jquery对象
				  // console.log(obj.childParams); // 当前节点的所有子节点参数
				  // console.log(obj.parentParam); // 当前节点的父节点参数
				});
				
			    
			  });
			 
			 
		</script>

</body>
</html>