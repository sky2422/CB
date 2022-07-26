<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/echarts@5.3.3/dist/echarts.min.js"></script>


<link href="/css/board/board.css" rel="stylesheet" type="text/css">
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

</head>

<body>
	
	<h1>데이터 List</h1>
	
	<div class="testlist">
		<form id="boardForm" name="boardForm" method="post">
			
			<!-- search start -->
			<div class="form-group row">
				
				<div style="margin-left: 30px;">
					<label for="period"></label>
    				<input name="period" id="period" class="date-picker" value="${sPeriod }"/>
				</div>
				
				<div class="w100" style="padding-right: 10px">
					<select id="admi" name="admi">
							<option value="">-동선택-</option>		
						<c:forEach items="${dongList }" var="dong">
							<option value="${dong.admi_nm }"><c:out value="${dong.admi_nm }"></c:out></option>
						</c:forEach>
					</select>				
				</div>	
								
				<div>
					<input type="text" id="sensor" name="sensor" value="${sSensor }">
				</div>
				
				<div>
					<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
				</div>				
			</div>
			<!-- search end -->
			
			<table class="list_table" style="text-align: center;">				
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
	<div>
		<button id="btn_write" type="button" class="btn btn-primary btn_write">글작성</button>
	</div>	
	
	<!-- pagination{s} -->

	<div id="paginationBox" class="pagination1">
		<ul class="pagination">

			<c:if test="${pagination.prev}">
				<li class="page-item"><a class="page-link" href="#"
					onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
					,'${search.admi}', '${search.sensor}', '${search.period}')">이전</a></li>
			</c:if>

			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="unq">

				<li	class="page-item <c:out value="${pagination.page == unq ? 'active' : ''}"/> ">
					<a class="page-link" href="#" onClick="fn_pagination('${unq}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
					 ,'${search.admi}', '${search.sensor}', '${search.period}')">
						${unq} 
					</a>
				</li>
			</c:forEach>

			<c:if test="${pagination.next}">

				<li class="page-item">
					<a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
					,'${search.admi}', '${search.sensor}', '${search.period}')">다음</a>
				</li>
			</c:if>
		</ul>
	</div>
	<!-- pagination{e} -->
	
	<br>
	
	<!-- Prepare a DOM with a defined width and height for ECharts -->
    <div id="chart-container" style="width: 100%;height:600px;"></div>
    
    ${sAdmi }
</body>
<script type="text/javascript">

var jsonData = '${jList}'

var json = JSON.parse(jsonData);

console.log(json);

console.log(json[0].ym);

var ym = new Array();
var tp = new Array();
var hd = new Array();
var ulfptc = new Array();
var minudust = new Array();
var ulvry = new Array();


for(var i = 0; i<json.length; i++){
	ym.push(json[i].ym);
	tp.push(json[i].avrg_tp);
	hd.push(json[i].avrg_hd);
	ulfptc.push(json[i].avrg_ulfptc_dnsty);
	minudust.push(json[i].avrg_minudust_dnsty);
	ulvry.push(json[i].avrg_ulvry_idex);	
}

console.log(ym);
console.log(tp);
console.log(hd);
console.log(ulfptc);
console.log(minudust);
console.log(ulvry);


</script>
<script type="text/javascript">
	
	var jsonData = '${jList}'

	var json = JSON.parse(jsonData);

	console.log(json);

	console.log(json[0].ym);

	var ym = new Array();
	var tp = new Array();
	var hd = new Array();
	var ulfptc = new Array();
	var minudust = new Array();
	var ulvry = new Array();


	for(var i = 0; i<json.length; i++){
		ym.push(json[i].ym);
		tp.push(json[i].avrg_tp);
		hd.push(json[i].avrg_hd);
		ulfptc.push(json[i].avrg_ulfptc_dnsty);
		minudust.push(json[i].avrg_minudust_dnsty);
		ulvry.push(json[i].avrg_ulvry_idex);	
	}
	
	
	var dom = document.getElementById('chart-container');
	var myChart = echarts.init(dom, null, {
	  renderer: 'canvas',
	  useDirtyRect: false
	});
	var app = {};
	
	var option;
	
	option = {
	  title: {
	    text: '미세먼지 그래프'
	  },
	  tooltip: {
	    trigger: 'axis'
	  },
	  legend: {
	    data: ['온도', '습도', '초미세먼지', '미세먼지', '자외선']
	  },
	  grid: {
	    left: '3%',
	    right: '4%',
	    bottom: '3%',
	    containLabel: true
	  },
	  toolbox: {
	    feature: {
	      saveAsImage: {}
	    }
	  },
	  xAxis: {
	    type: 'category',
	    boundaryGap: false,
	    data: ym
	  },
	  yAxis: {
	    type: 'value'
	  },
	  series: [
	    {
	      name: '온도',
	      type: 'line',
	      stack: 'Total',
	      data: tp
	    },
	    {
	      name: '습도',
	      type: 'line',
	      stack: 'Total',
	      data: hd
	    },
	    {
	      name: '초미세먼지',
	      type: 'line',
	      stack: 'Total',
	      data: ulfptc
	    },
	    {
	      name: '미세먼지',
	      type: 'line',
	      stack: 'Total',
	      data: minudust
	    },
	    {
	      name: '자외선',
	      type: 'line',
	      stack: 'Total',
	      data: ulvry
	    }
	  ]
	};
	
	if (option && typeof option === 'object') {
	  myChart.setOption(option);
	}
	
	window.addEventListener('resize', myChart.resize);
</script>


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
	
	
	//데이트피커
	$(function() {
        $('.date-picker').datepicker( {
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: 'yyMM',
        monthNames: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        showOn:"button",
        buttonImage:"/images/calender.png",
        buttonImageOnly:true,
        onClose: function(dateText, inst) { 
            $(this).datepicker('setDate', new Date(inst.selectedYear, inst.selectedMonth, 1));
        }
        });
    });

	//이전 버튼 이벤트
    //5개의 인자값을 가지고 이동 testList.do
    //무조건 이전페이지 범위의 가장 앞 페이지로 이동
    function fn_prev(page, range, rangeSize, listSize, admi, sensor, period) {
            
        var page = ((range - 2) * rangeSize) + 1;
        var range = range - 1;
            
        var url = "/boardList.do";
        url += "?page=" + page;
        url += "&range=" + range;
        url += "&listSize=" + listSize;
        url += "&admi=" + admi;
        url += "&sensor=" + sensor;
        url += "&period=" + period;
        location.href = url;
        }
 
 
    //페이지 번호 클릭
    function fn_pagination(page, range, rangeSize, listSize, admi, sensor, period) {
 
        var url = "/boardList.do";
            url += "?page=" + page;
            url += "&range=" + range;
            url += "&listSize=" + listSize;
            url += "&admi=" + admi;
            url += "&sensor=" + sensor; 
            url += "&period=" + period; 
 
            location.href = url;    
        }
 
    //다음 버튼 이벤트
    //다음 페이지 범위의 가장 앞 페이지로 이동
    function fn_next(page, range, rangeSize, listSize, admi, sensor, period) {
        var page = parseInt((range * rangeSize)) + 1;
        var range = parseInt(range) + 1;            
        var url = "/boardList.do";
            url += "?page=" + page;
            url += "&range=" + range;
            url += "&listSize=" + listSize;
            url += "&admi=" + admi;
            url += "&sensor=" + sensor;
            url += "&period=" + period;
            location.href = url;
        }
        
    // 검색
    $(document).on('click', '#btnSearch', function(e){
		
		if($("#period").val() == ""){
			alert("날짜를 선택하세요");
			return false;
		}else if($("#admi").val() == ""){
			alert("동네를 선택하세요");
			return false;
		}else if($("#sensor").val() == ""){
			alert("센서를 입력하세요");
			return false;
		}
	
	
        e.preventDefault();
        var url = "/boardList.do";
        url += "?admi=" + $('#admi').val();
        url += "&sensor=" + $('#sensor').val();
        url += "&period=" + $('#period').val();
        location.href = url;
        console.log(url);
 
    });    
	
	//셀렉트 박스 검색 유지
	var sAdmi = '${sAdmi}'	
	$("#admi").val(sAdmi).prop("selected", true);	

</script>
<style>
    .ui-datepicker-calendar {
        display: none;
    }
</style>
</html>





