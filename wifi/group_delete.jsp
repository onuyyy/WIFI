<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="wifi.WifiService" %>    
<%@ page import="wifi.BookMark" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	WifiService ws = new WifiService();
	BookMark b = ws.getBookmark(Integer.parseInt(id));
%>
<h1>위치 히스토리 목록</h1>
	<%@ include file="header.jsp" %>
	<form action="group_delete_submit.jsp">
	<input type="hidden" name="id" value="<%= id %>">
		<table id="wifi">
		<colgroup>
			<col style="width: 40%; text-align: center;">
			<col style="width: 60%; text-align: center;">
		</colgroup>
		<tr>
			<th>북마크 이름</th>
			<td>
				<input type="text" name="groupName" value=<%=b.getGroupName() %>>
			</td>
		</tr>
		<tr>
			<th>순서</th>
			<td>
				<input type="text" name="num" value=<%=b.getOrderNum() %>>
			</td>
		</tr>
		<tr>
			<th colspan=2 style="text-align:center;">
				<a href="group_manager.jsp">돌아가기</a>
				<input type=submit value="삭제">
			</th>	
		</tr>
	</table>
	</form>
</body>
</html>