<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<body>
	<div class="container">
		<table class="table table-bordered">
			<thead>
				<h1>데이터 상세보기 Detail</h1>
			</thead>
			<tbody>
				<form action="updateBoard.do" id="viewForm" method="post"
					encType="multiplart/form-data">
					
					<tr>
						<th>데이터 번호</th>
						<td><input type="text" name="unq" value="${result.unq }" class="form-control" readonly="readonly"></td>
					</tr>
					
					<tr>
						<th>행정동명</th>
						<td>
							<input type="text" name="admi_nm" value="${result.admi_nm }" class="form-control" readonly="readonly">
						</td>
					</tr>
					
					<tr>
						<th>센서명</th>
						<td>
							<input type="text" name="sensor_nm" value="${result.sensor_nm }" class="form-control" readonly="readonly">						
						</td>
					</tr>
					
					<tr>
						<th>온도</th>
						<td><input type="text"  name="avrg_tp" value="${result.avrg_tp }" class="form-control" /></td>
					</tr>
					
					<tr>
						<th>습도</th>
						<td><input type="text"  name="avrg_hd " value="${result.avrg_hd }" class="form-control" /></td>
					</tr>
					
					<tr>
						<th>초미세먼지</th>
						<td><input type="text"  name="avrg_ulfptc_dnsty" value="${result.avrg_ulfptc_dnsty }" class="form-control" /></td>
					</tr>
					
					<tr>
						<th>미세먼지</th>
						<td><input type="text"  name="avrg_minudust_dnsty" value="${result.avrg_minudust_dnsty }" class="form-control" /></td>
					</tr>
					<tr>
						<th>자외선</th>
						<td><input type="text"  name="avrg_ulvry_idex" value="${result.avrg_ulvry_idex }" class="form-control" /></td>
					</tr>
						<td colspan="2">
							<button id="btn_previous" type="button" class="btn_previous">이전</button>
							<button id="btn_delete" type="button" class="btn_previous">삭제</button>
							<button id="btn_modify" type="button" class="btn_register">수정</button>
						</td>
					</tr>
				</form>
			</tbody>
		</table>
	</div>

</body>
<script type="text/javascript">
	$(document).on('click', '#btn_modify', function(e) {
		if(confirm("정말 수정하시겠습니까 ?") == true){
	        $("#viewForm").submit();
	    }
	    else{
	        return ;
	    }
	});
	$(document).on('click', '#btn_delete', function(e) {
		if(confirm("정말 삭제하시겠습니까 ?") == true){
			$("#viewForm").attr("action", "deleteBoard.do");
			$("#viewForm").submit();
	    }
	    else{
	        return ;
	    }
	});

	//이전 클릭 시 testList로 이동
	$("#btn_previous").click(function() {
		$(location).attr('href', 'boardList.do');

	});
</script>
</html>