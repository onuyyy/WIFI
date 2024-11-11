<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="wifi.WifiService" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Group Add Submit</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<%
	WifiService ws = new WifiService();

	String name = request.getParameter("groupName");
	String num = request.getParameter("num");

	ws.insertGroup(name, Integer.parseInt(num));
%>
<script>
	alert('북마크 그룹 정보를 추가하였습니다.');
	location.href = 'group_manager.jsp';
</script>
</body>
</html>