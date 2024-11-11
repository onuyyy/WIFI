<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="wifi.WifiService" %>
<%@ page import="wifi.Wifi" %>    
<%@ page import="wifi.History" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>history</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<%
	WifiService ws = new WifiService();
	List<History> list = ws.getHistoryList();
	
%>
<body>
<h1>위치 히스토리 목록</h1>
	<%@include file="header.jsp" %>
		<table id="wifi">
			<colgroup>
				<col style="width: 10%; text-align: center;">
				<col style="width: 30%; text-align: center;">
				<col style="width: 30%; text-align: center;">
				<col style="width: 20%; text-align: center;">
				<col style="width: 10%; text-align: center;">
			</colgroup>
			<tr>
				<th>ID</th>
				<th>X 좌표</th>
				<th>Y 좌표</th>
				<th>조회 일자</th>
				<th>비고</th>
			</tr>
			<% 
				for (History history : list) {
			%>
			<tr>
				<td><%= history.getId() %></td>
				<td><%= history.getLat() %></td>
				<td><%= history.getLnt() %></td>
				<td><%= history.getViewDate() %></td>
				<td>
					<a href="delete.jsp?id=<%= history.getId() %>">삭제</a>
				</td>
			</tr>	
			<%
				}
			%>
		</table>
</body>
</html>

