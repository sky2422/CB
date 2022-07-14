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
				
				<tbody>
				<!-- jstl 데이터베이스를 검색해 넘겨 받은 list 를 result 라는 이름으로 순차적으로 실행을 시키게 됨  java의 for문같이 순차적으로 실행시킴-->

				<c:forEach items="${list}" var="result">
					<tr>
						<th>${result.unq }</th>
						<th>${result.ym }</th>
						<th>${result.admi_nm }</th>
						<th>${result.sensor_nm }</th>
						<th>${result.avrg_tp }</th>
						<th>${result.avrg_hd }</th>
						<th>${result.avrg_ulfptc_dnsty }</th>
						<th>${result.avrg_minudust_dnsty }</th>
						<th>${result.avrg_ulvry_idex }</th>	
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
	<div>
		<button id="btn_write" type="button" class="btn_write">글작성</button>
	</div>
	<br>
	<%-- <!-- pagination{s} -->

	<div id="paginationBox" class="pagination1">
		<ul class="pagination">

			<c:if test="${pagination.prev}">
				<li class="page-item"><a class="page-link" href="#"
					onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
					,'${search.searchType}', '${search.keyword}')">이전</a></li>
			</c:if>

			<c:forEach begin="${pagination.startPage}"
				end="${pagination.endPage}" var="testId">

				<li
					class="page-item <c:out value="${pagination.page == testId ? 'active' : ''}"/> "><a
					class="page-link" href="#"
					onClick="fn_pagination('${testId}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
					 ,'${search.searchType}', '${search.keyword}')">
						${testId} </a></li>
			</c:forEach>

			<c:if test="${pagination.next}">

				<li class="page-item"><a class="page-link" href="#"
					onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
					,'${search.searchType}', '${search.keyword}')">다음</a></li>
			</c:if>
		</ul>
	</div>
	<!-- pagination{e} -->



	<!-- search{s} -->

	<div class="form-group row justify-content-center">

		<div class="w100" style="padding-right: 10px">
			<select class="form-control form-control-sm" name="searchType"
				id="searchType">
				<option value="testTitle">제목</option>
				<option value="testContent">본문</option>
				<option value="testName">작성자</option>
			</select>
		</div>

		<div class="w300" style="padding-right: 10px">
			<input type="text"
				value="${pagination.keyword}" class="form-control form-control-sm"
				name="keyword" id="keyword">
		</div>

		<div>
			<button class="btn btn-sm btn-primary" name="btnSearch"
				id="btnSearch">검색</button>
		</div>

	</div>

	<!-- search{e} -->


	<!-- 페이지 목록 갯수   -->
	<div class="form-group row justify-content-center">
		<p>게시판 목록 갯수</p>
		<div class="w100" style="padding-right: 10px">
			<select class="form-control form-control-sm" name="searchType"
				id="listSize" onchange="page(1)">
				<option value="10"
					<c:if test="${pagination.getListSize() == 10 }">selected="selected"</c:if>>10개</option>
				<option value="15"
					<c:if test="${pagination.getListSize() == 15 }">selected="selected"</c:if>>15개</option>
				<option value="20"
					<c:if test="${pagination.getListSize() == 20 }">selected="selected"</c:if>>20개</option>
			</select>
		</div>

	</div>
</body>
<script type="text/javascript">
	//글 작성 버튼 클릭 시 testRegister로 이동
	$("#btn_write").click(function javascript_onclikc() {
		$(location).attr('href', 'testRegister.do');

	});
	
	//글조회
	//	어떤 게시물을 클릭했는지 게시물의 번호(testId)를 넘겨 줘야 함 따라서 게시물 클릭 이벤트에서 게시물의 번호를 인자 값으로 받습니다.
	//  get 방식으로 데이터를 전송합니다. 따라서 ? 연산자를 사용해 testId를 주소 뒤에 붙여 줍니다
	function fn_view(testId){
    
  	  var form = document.getElementById("boardForm");
  	  var url = "<c:url value='/testDetail.do'/>";
  	  url = url + "?testId=" + testId;
    
 	   form.action = url;    
 	   form.submit(); 
	}
	//이전 버튼 이벤트
	//5개의 인자값을 가지고 이동 testList.do
	//무조건 이전페이지 범위의 가장 앞 페이지로 이동
	function fn_prev(page, range, rangeSize, listSize, searchType, keyword) {
			
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
			
		var url = "/testList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&listSize=" + listSize;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;
		}

	  //페이지 번호 클릭

	function fn_pagination(page, range, rangeSize, listSize, searchType, keyword) {

		var url = "/testList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword; 

			location.href = url;	
		}

		//다음 버튼 이벤트
		//다음 페이지 범위의 가장 앞 페이지로 이동
	function fn_next(page, range, rangeSize, listSize, searchType, keyword) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;			
		var url = "/testList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
			location.href = url;
		}
		
		
	/* $는 jQuery를 시작하는 명령어로
	$(DOM요소) 와 같은 명령어로 각 요소에 접근 할 수 있다.
	e.preventDefault(); 는 버튼 고유의 기능을 막는 명령어 */ 
		
		// 검색
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url = "/testList.do";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		url = url + "&listSize=" + $('#listSize').val();
		location.href = url;
		console.log(url);

	});	

	/*한페이지당 게시물 */
	function page(testId){
	  var startPage = testId;
	  var listSize = $("#listSize option:selected").val();
		
	  if(listSize == 10){
		  var url="/testList.do?startPage="+startPage+"&listSize="+listSize
	  }else if(listSize == 15){
		  var url ="/testList.do?startPage="+startPage+"&listSize="+listSize
	  }else if(listSize == 20){
	      var url="/testList.do?startPage="+startPage+"&listSize="+listSize
	 
	  }
	  location.href = url;
	}
</script> --%>
</html>