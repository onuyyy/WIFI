<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="wifi.WifiService" %>    
<%@ page import="wifi.BookMark" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Group Add</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<%
	WifiService ws = new WifiService();
	List<BookMark> list = ws.getGroupList();
%>
<h1>위치 히스토리 목록</h1>
	<%@ include file="header.jsp" %>
	<form action="group_add_submit.jsp">
		<table id="wifi">
		<colgroup>
			<col style="width: 40%; text-align: center;">
			<col style="width: 60%; text-align: center;">
		</colgroup>
		<tr>
			<th>북마크 이름</th>
			<td>
				<input type="text" name="groupName">
			</td>
		</tr>
		<tr>
			<th>순서</th>
			<td>
				<input type="text" name="num">
			</td>
		</tr>
		<tr>
			<th colspan=2 class="subButton">
				<input type=submit value="추가">
			</th>	
		</tr>
	</table>
	</form>
</body>
</html>