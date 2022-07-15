<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<link href="/css/board/board.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container">
		<table class="table table-bordered">
			<thead>
				<h1>데이터 등록</h1>
			</thead>
			<tbody>
				<form id="form_board" action="insertBoard.do" method="post"
					encType="multiplart/form-data">
					<tr>
						<th>행정동명</th>
						<td>
							<select id="dongList" name="dongList" class="form-control">
								<c:forEach items="${dongList }" var="dongList">
									<option><c:out value="" /></option>
								</c:forEach>
							</select>
						</td>
					</tr>
					
					<tr>
						<th>센서명</th>
						<td>
							<select id="sensorList" name="sensorList" class="form-control">								
								<c:forEach items="" var="">
									<option><c:out value="" /></option>
								</c:forEach>
							</select>							
						</td>
					</tr>
					
					<tr>
						<th>온도</th>
						<td><input type="text" placeholder="온도를 입력해 주세요." name="avrg_tp" class="form-control" /></td>
					</tr>
					
					<tr>
						<th>습도</th>
						<td><input type="text" placeholder="습도를 입력해 주세요." name="avrg_hd" class="form-control" /></td>
					</tr>
					
					<tr>
						<th>초미세먼지</th>
						<td><input type="text" placeholder="초미세먼지를 입력해 주세요." name="avrg_ulfptc_dnsty" class="form-control" /></td>
					</tr>
					
					<tr>
						<th>미세먼지</th>
						<td><input type="text" placeholder="미세먼지 수치를 입력하세요." name="avrg_minudust_dnsty" class="form-control" /></td>
					</tr>
					<tr>
						<th>자외선</th>
						<td><input type="text" placeholder="자외선 수치를 입력하세요." name="avrg_ulvry_idex" class="form-control" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<button id="btn_register" type="button" class="btn_register">등록</button>
							<button id="btn_previous" type="button" class="btn_previous">돌아가기</button>
					</tr>
				</form>
			</tbody>
		</table>
	</div>
</body>
<script type="text/javascript">
	//등록 버튼
	$(document).on('click', '#btn_register', function(e) {
		$("#form_board").submit();
	});

	//돌아가기 클릭 시 boardList로 이동
	$("#btn_previous").click(function() {
		$(location).attr('href', 'boardList.do');
	});
</script>
</html>
