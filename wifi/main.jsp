<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="wifi.WifiService" %>
<%@ page import="wifi.Wifi" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<%

	WifiService ws = new WifiService();
	List<Wifi> list = null;
	
	// request 요청으로 파라미터 추출
	// getParameter 메서드는 문자열로 반환한다
	String lat = request.getParameter("lat");
	String lnt = request.getParameter("lnt");
	
	if (lat != null && !lat.isEmpty() && lnt != null && !lnt.isEmpty()) {
		list = ws.getWifiList(Double.parseDouble(lat), Double.parseDouble(lnt));
		ws.historyInsert(Double.parseDouble(lat), Double.parseDouble(lnt));
	}
	
%>

<body>
	<p>
		LAT : <input type="text" id="lat" />
		LNT : <input type="text" id="lnt" />
		<input type=button value="내 위치 가져오기" onclick="getLocation()">
		<input type=button value="근처 WIFI 정보 보기" onclick="getNearestList()">
	</p>	
	<table id="wifi">
	  <tr>
	    <th>거리(Km)</th>
	    <th>관리번호</th>
	    <th>자치구</th>
	    <th>와이파이명</th>
	    <th>도로명주소</th>
	    <th>상세주소</th>
	    <th>설치위치(층)</th>
	    <th>설치유형</th>
	    <th>설치기관</th>
	    <th>서비스구분</th>
	    <th>망종류</th>
	    <th>설치년도</th>
	    <th>실내외구분</th>
	    <th>WIFI 접속 환경</th>
	    <th>X좌표</th>
	    <th>Y좌표</th>
	    <th>작업 일자</th>    
	  </tr>
	  <% if(list != null && !list.isEmpty())
	  		for (Wifi wifi : list) {  
	  %>
	  <tr id="wifiList">
	      <td><%= wifi.getDistance() %></td>
	      <td><%= wifi.getMgr_no() %></td>
	      <td><%= wifi.getWrdofc() %></td>
	      <td><a href="detail.jsp?mgr_no=<%= wifi.getMgr_no() %>&distance=<%= wifi.getDistance() %>"><%= wifi.getMain_nm() %></a></td>
	      <td><%= wifi.getAdrr1() %></td>
	      <td><%= wifi.getAdrr2() %></td>
	      <td><%= wifi.getFloor() %></td>
	      <td><%= wifi.getInstl_ty() %></td>
	      <td><%= wifi.getInstl_mby() %></td>
	      <td><%= wifi.getService() %></td>
	      <td><%= wifi.getCmcwr() %></td>
	      <td><%= wifi.getInstl_year() %></td>
	      <td><%= wifi.getInout() %></td>
	      <td><%= wifi.getRemars() %></td>
	      <td><%= wifi.getLat() %></td>
	      <td><%= wifi.getLnt() %></td>
	      <td><%= wifi.getWork_date() %></td>
	  </tr>
	  <%
	  		} else {
	  %>
	  <tr id="noSearch">
	  	<td colspan="17" style="text-align: center;">위치 정보를 입력한 후에 조회해 주세요.</td>
	  </tr>
	  <% } %>
	</table>
	
	<script type="text/javascript">
		function getLocation() {
		    // Geolocation API 지원 여부 확인
		    if (navigator.geolocation) {
		        navigator.geolocation.getCurrentPosition(onSuccess, onError);
		    } else {
		        alert("Geolocation을 지원하지 않는 브라우저입니다.");
		    }
		}
		
		// 위치 정보를 가져오는 데 성공했을 때 호출되는 함수
		function onSuccess(position) {
		    const latitude = position.coords.latitude;    
		    const longitude = position.coords.longitude;  
		
		    // LAT, LNT 입력 필드에 위도와 경도를 설정
		    document.getElementById("lat").value = latitude;
		    document.getElementById("lnt").value = longitude;
		}
		
		// 위치 정보를 가져오는 데 실패했을 때 호출되는 함수
		function onError(error) {
		    alert(`위치 정보를 가져오는 데 실패했습니다: ${error.message}`);
		}
		
		function getNearestList() {
			var lat = document.getElementById("lat").value;
			var lnt = document.getElementById("lnt").value;

			if (lat === "" || lnt === "") {
				alert("위치 정보를 먼저 조회해 주세요.");
				return;
			}
			
			 window.location.assign("http://localhost:8080/wifi/index.jsp?lat=" + lat + "&lnt=" + lnt);

		}
	</script>
	
</body>
</html>

