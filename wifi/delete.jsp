<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="wifi.WifiService" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	WifiService ws = new WifiService();
	
	String id = request.getParameter("id");
	
	ws.deleteHistory(Integer.parseInt(id));
%>
</body>
<script>
	alert('삭제되었습니다.');
	location.href = 'history.jsp';
</script>
</html>