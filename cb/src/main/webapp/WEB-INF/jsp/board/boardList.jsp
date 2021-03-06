<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<link href="/css/board/board.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

</head>

<body>
	
	<h1>데이터 List</h1>
	
	<div class="testlist">
		<form id="boardForm" name="boardForm" method="post">
			<div>
				<button id="btn_write" type="button" class="btn_write">글작성</button>
			</div>
			
			<table class="list_table">				
				<thead>
					<tr>
						<th>번호</th>
						<th>날짜</th>
						<th>동네명</th>
						<th>센서명</th>
						<th>온도</th>
						<th>습도</th>
						<th>초미세먼지</th>
						<th>미세먼지</th>
						<th>자외선</th>
					</tr>
				</thead>
				
				<!-- jstl 데이터베이스를 검색해 넘겨 받은 list를 result라는 이름으로 순차적으로 실행을 시키게 됨 java의 for문같이 순차적으로 시행시킴 -->
				
				<tbody>
					<c:forEach items="${list}" var="result">
						<tr>
							<th><a href="#" onclick="fn_view(${result.unq })"><c:out value="${result.unq }"/></th>
							<th><c:out value="${result.ym }"/></th>
							<th><c:out value="${result.admi_nm }"/></th>
							<th><c:out value="${result.sensor_nm }"/></th>
							<th><c:out value="${result.avrg_tp }"/></th>
							<th><c:out value="${result.avrg_hd }"/></th>
							<th><c:out value="${result.avrg_ulfptc_dnsty }"/></th>
							<th><c:out value="${result.avrg_minudust_dnsty }"/></th>
							<th><c:out value="${result.avrg_ulvry_idex }"/></th>	
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>	
	</div>
	
	
	<br>
</body>
<script type="text/javascript">
	//글 작성 버튼 클릭 시 testRegister로 이동
	$("#btn_write").click(function() {
		$(location).attr('href', 'boardRegister.do');
	})
	
	//데이터 조회
	//어떤 데이터를 클리했는지 데이터 번호(unq)를 넘겨 줘야 함 따라서 번호 클릭시 이벤트에서 데이터 번호를 인자 값으로 받음
	//get방식으로 데이터를 전송. 따라서, 연산자를 사용해 unq를 주소 뒤에 붇여줌
	function fn_view(unq){
		
		var form = document.getElementById("boardForm");
	  	var url = "<c:url value='/boardDetail.do'/>";
	  	url = url + "?unq=" + unq;
	    
	 	form.action = url;    
	 	form.submit(); 
	}
	
	
</script>
</html>





