<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
   <head>
		<meta charset="utf-8">
		<title>菜单管理</title>
	</head>
	<!--如果使用frameSet的包含页面 主页面中不能由body-->
	<frameset cols="300,*" border="1">
		<frame src="${pageContext.request.contextPath}/sys/toMenuLeft.action" name="left">
		<frame src="${pageContext.request.contextPath}/sys/toMenuRight.action" name="right">

	</frameset>

</html>