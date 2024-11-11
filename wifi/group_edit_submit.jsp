<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="wifi.WifiService" %>    
<%@ page import="wifi.BookMark" %>
<%@ page import="java.util.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Group Edit</title>
</head>
<body>
<%
	WifiService ws = new WifiService();

	String name = request.getParameter("groupName");
	String num = request.getParameter("num");
	String id = request.getParameter("id");
	
	ws.updateGroup(name, Integer.parseInt(num), Integer.parseInt(id));
%>
<script>
	alert('북마크 그룹 정보를 수정하였습니다.');
	location.href="group_manager.jsp";
</script>
</body>
</html>