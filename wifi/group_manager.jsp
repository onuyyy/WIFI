<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="wifi.WifiService" %>
<%@ page import="wifi.BookMark" %>
<%@ page import="java.util.*" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>group manager</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<%
	WifiService ws = new WifiService();
	List<BookMark> list = ws.getGroupList();
%>
<body>
<h1>위치 히스토리 목록</h1>
	<%@include file="header.jsp" %>
	<div>
		<input type="button" value="북마크 추가" onclick="addGroup()">
	</div>		
	<table id="wifi">
		<tr>
			<th>ID</th>
			<th>북마크 이름</th>
			<th>순서</th>
			<th>등록일자</th>
			<th>수정일자</th>
			<th>비고</th>
		</tr>
		<% for (BookMark b :list) { %>
		<tr>
			<td><%= b.getId() %></td>
			<td><%= b.getGroupName() %></td>
			<td><%= b.getOrderNum() %></td>
			<td><%= b.getRegDate() %></td>
			<td>
				<%
					if (b.getModDate() != null) {
				%>
				<%= b.getModDate() %>
				<% } else { %>
				
				<% } %>
			</td>
			<td>
				<a href="group_edit.jsp?id=<%= b.getId() %>">수정</a>
				<a href="group_delete.jsp?id=<%= b.getId() %>">삭제</a>
			</td>
		</tr>
		<% } %>
	</table>
	<script>
		function addGroup() {
			location.href = "group_add.jsp";
		}
	</script>
</body>
</html>