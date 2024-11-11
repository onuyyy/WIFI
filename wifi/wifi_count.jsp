<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="wifi.WifiService"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	WifiService wf = new WifiService();
	int cnt = wf.WifiTotalCnt();
%>
<body>
	<h1><%= cnt %> 개의 WIFi 정보를 정상적으로 저장하였습니다.</h1>
	<a href="http://localhost:8080/wifi/index.jsp">홈으로 가기</a>
</body>
</html>