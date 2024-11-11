<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="wifi.WifiService" %>
<%@ page import="wifi.Wifi" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<%
	String mgrNo = request.getParameter("mgr_no");
	String distance = request.getParameter("distance");
	
	WifiService ws = new WifiService();
	Wifi wifi = ws.getWifiDetail(mgrNo);
%>
<body>
<h1>와이파이 정보 구하기</h1>
	<%@include file="header.jsp" %>
    <select name="language" >
      <option value="none">북마크 그룹 이름 선택</option>
    </select>
    <input type=button value="북마크 추가하기">
	<table id="wifi">
		<colgroup>
			<col style="width: 30%; text-align: center;">
			<col style="width: 70%; text-align: center;">
		</colgroup>
		<tr>
			<th>거리(Km)</th>
			<td><%= distance %></td>
		</tr>
		<tr>
			<th>관리 번호</th>
			<td><%= wifi.getMgr_no() %></td>
		</tr>
		<tr>
			<th>자치구</th>
			<td><%= wifi.getWrdofc() %></td>
		</tr>
		<tr>
			<th>와이파이명</th>
			<td><%= wifi.getMain_nm() %></td>
		</tr>
		<tr>
			<th>도로명 주소</th>
			<td><%= wifi.getAdrr1() %></td>
		</tr>
		<tr>
			<th>상세 주소</th>
			<td><%= wifi.getAdrr2() %></td>
		</tr>
		<tr>
			<th>설치 위치(층)</th>
			<td><%= wifi.getFloor() %></td>
		</tr>
		<tr>
			<th>설치 유형</th>
			<td><%= wifi.getInstl_ty() %></td>
		</tr>
		<tr>
			<th>설치 기관</th>
			<td><%= wifi.getInstl_mby() %></td>
		</tr>
		<tr>
			<th>서비스 구분</th>
			<td><%= wifi.getService() %></td>
		</tr>
		<tr>
			<th>망 종류</th>
			<td><%= wifi.getCmcwr() %></td>
		</tr>
		<tr>
			<th>설치년도</th>
			<td><%= wifi.getInstl_year() %></td>
		</tr>
		<tr>
			<th>실내외 구분</th>
			<td><%= wifi.getInout() %></td>
		</tr>
		<tr>
			<th>WIFI 접속 환경</th>
			<td><%= wifi.getRemars() %></td>
		</tr>
		<tr>
			<th>X 좌표</th>
			<td><%= wifi.getLat() %></td>
		</tr>
		<tr>
			<th>Y 좌표</th>
			<td><%= wifi.getLnt() %></td>
		</tr>
		<tr>
			<th>작업 일자</th>
			<td><%= wifi.getWork_date() %></td>
		</tr>
	</table>
</body>
</html>