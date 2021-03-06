<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>인턴프로젝트</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="csrf-param" content="authenticity_token" />
<meta name="csrf-token"
	content="FqXMAnwaMTsf5yfUvdmWufX8XqLazGL59qUM3IHfb0j1fWYCDNuv4bISmEPOR4/eBdk06e7VYJT12gH+EdiXwg==" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel='stylesheet'
	href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>


<link href="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.css" rel="stylesheet">
<script src="https://unpkg.com/tableexport.jquery.plugin/tableExport.min.js"></script>
<script src="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.js"></script>
<script src="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table-locale-all.min.js"></script>
<script src="https://unpkg.com/bootstrap-table@1.18.3/dist/extensions/export/bootstrap-table-export.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"> </script>
	
<style>

table {
  width: 100%;
  counter-reset: row-num -1;
}

table tr {
  counter-increment: row-num;
}
table tr td:first-child::before {
    content: counter(row-num);
}

tbody tr:hover {
  font-size:1.1em; 
}

div#boardlists{
	width: 120%;
	display: flex;
	position: relative;
	flex-direction: column;
	box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.15);
	
}

a:link {
	text-decoration: none;
	color: #000000;
}

a:visited {
	text-decoration: none;
	color: #888888;
}

a:active {
	text-decoration: none;
	color: #00a0a0;
}

a:hover {
	text-decoration: none;
	color: #008080;
}

/*
	   a:link 클릭하지 않았을 때 링크 상태

       a:visited 한번 클릭했거나 들어가보았던 링크 상태

       a:active 링크 부분에서 마우스를 누르고 있는 상태

       a:hover 링크를 클릭하려고 마우스를 가져갔을 때 상태

       text-decoration ->underline ; 밑줄, none ; 밑줄 없음

 */

h2{
	color: #008080;
	text-align: center;
	margin: 10px 5px 30px;
}

thead{
		text-align : center;
}

tbody
{
		text-align : center;
}

#outter {
	display: block;
	width: 100%;
	margin: auto;
}

a {
	text-decoration: none;
}

input[type=button] {
	padding: 10px 25px;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
}

/* outline 버튼 */
.info {
  border-color: #008080;
  color: #008080;
}

.info:hover {
  background: #008080;
  color: white;
}

body {
	font-family: arial;
}

.container-fluid {
	font-family: stencil;
	font-size: 30px;
}

.navbar-custom {
	background-color: white;
	border-bottom: thick double #8ca8ab;
	height: 100px;
}

.bd-navbar {
	position: sticky;
	top: 0;
	z-index: 1071;
	min-height: 4rem;
	box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, .05), inset 0 -1px 0
		rgba(0, 0, 0, .1);
}

.bd-sidebar {
	position: fixed;
	top: 6.3rem;
	z-index: 1000;
	height: calc(100vh - 4rem);
	background: #ffffff;
	border-right: thick double #8ca8ab;
	overflow-y: auto;
	min-width: 160px;
	max-width: 290px;
}

.bd-sidebar .nav {
	display: block;
}

.bd-sidebar .nav>li>a {
	display: block;
	padding: 0.25rem 4.5rem;
	font-size: 90%;
}

.footer {
	width: 100%;
	height: 100px;
	margin-left: 130px;
	position: absolute;
	bottom: 0;
	text-align: center;
	color: black;
}

div#head {
	position: absolute;
	left: 40%;
	top: 8%;
	color: #19555c;
}

div#user {
	position: absolute;
	color: teal;
	right: 3%;
	top: 30%;
	right: 3%;
}

ul#menu {
	position: absolute;
	top: 8%
}

.dropdown {
	background-color: white;
}

.dropdown-menu {
	color: white;
	border: thick double #8ca8ab;
	background-color: #ffffff;
}

.dropdown-menu li a {
	text-decoration: none;
	display: block;
	color: #000;
	padding: 8px 15px 8px 15px;
}

.dropdown-menu a:hover {
	color: #ffffff !important;
	background: teal;
	border-color: #42423e;
}

.cardwrapper {
	display: flex;
	position: relative;
	width: 70%;
	margin-left: 330px;
	padding: 3rem 1rem 3rem 12rem;
	justify-content: space-between;
}

.cardwrap {
	display: flex;
	width: 350px;
	height: 400px;
	flex-direction: column;
	box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.15);
	border-radius: 2rem;
	cursor: pointer;
}

.boardwrap {
	width: 100%;
	/* height: auto; */
	height: 320px;
	display: flex;
	align-items: top;
	justify-content: center;
	background: #fffabf;
	/*border-bottom: solid 1px;*/
	border-radius: 0 0 1rem 1rem;
}

.boardwrap:hover {
	background-color: #ffffff;
	opacity: 0.5;
}

.textwrap {
	width: 100%;
	height: 5rem;
	display: flex;
	justify-content: space-around;
	background: #4e859c;
	border-radius: 1rem 1rem 0 0;
}

.left-text {
	text-align: center;
	font-size: large;
	display: flex;
	align-items: center;
	color: white;
}

#tempCount {
	text-align: center;
	font-size: large;
	color: white;
	display: flex;
	align-items: center;
}

#saveCount {
	text-align: center;
	font-size: large;
	color: white;
	display: flex;
	align-items: center;
}

#deleteCount {
	text-align: center;
	font-size: large;
	color: white;
	display: flex;
	align-items: center;
}

.table {
	width: 100% !important;
}
</style>

<script type="text/javascript">
	$(document).ready(
			
			function() {
				
				// Sorting
				$(document).ready(function () {
				$('#dataTable').DataTable({
				"ordering": false // false to disable sorting (or any other option)
				});
				$('.dataTables_length').addClass('bs-select');
				});
				
				
				$("#writeBtn").click(function() {
					location.href = "write";
				})
				$.ajax({
					url : "saveBoard",
					success : function(result) {
						console.log(result);
						var html = "";
						result.forEach(function(item) {
							html += "<tr> <td><a href = 'view?idx=" + item.idx
									+ "'>" + item.title + "</a>"
									+ "</td> </tr>"
						})
						$("#listArea").append(html);
						$("#listArea1").append(html);
						$("#listArea2").append(html);
						$("#listArea3").append(html);
						$('#example').DataTable();
					}
				});

			}

	);

</script>

</head>
<body>
	<header class="navbar navbar-custom">
		<a class="navbar-brand" href="index">
			<div>
				<img class="sbdc" alt="SBDC" width="250" height="45"
					src="https://img.etnews.com/photonews/2012/1370528_20201230091413_961_0001.jpg">
			</div>
			<div id="head">
				<h2 style="font-family: stencil">
					<a href="index"
						style="font-weight: bold; font-size: 1.0em; line-height: 1.0em; color: #19555c">
						2021 SBDC Board Project</a>
				</h2>
			</div>
			<div id="user" onclick="alert('임시 사용자입니다.')" style="cursor:pointer">
					<img alt="user" width="50" height="50"
					
					src="https://i.pinimg.com/736x/3f/94/70/3f9470b34a8e3f526dbdb022f9f19cf7.jpg"
					>
				USER
			</div>
		</a>

	</header>

	<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="col-3 bd-sidebar">
				<ul class="nav" id="menu">
					<li class="nav-item"><a class="nav-link" href="index"
						style="color: black;">Home</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false" style="color: black;">Board </a>
						<ul class="dropdown-menu">
							<li style="text-align: center"><a href="saveBoard"
								style="color: black">Complete Board</a></li>
							<li style="text-align: center"><a href="tempBoard"
								style="color: black">Archive</a></li>
							<li style="text-align: center"><a href="deleteBoard"
								style="color: black">Delete Board</a></li>
						</ul></li>
				</ul>
				<br>
			</div>
		</div>
	</div>


	<div class="container" style="margin-top: 30px" >
		<div class="row">
			<div class="col-lg-12">
					<h3>
						<a
							style="color: teal; text-align: center; margin: 60px 0 100px 550px; font-family: stencil;">Complete Board</a>
					</h3>
				
				<div id="outter">

					<!-- 목록시작 -->

					<div class="card mb-12" id="boardlists">
						<div class="card-header">
							<i class="fas fa-table mr-3"> 
							
							<!-- 검색 -->
								<div style="margin:10px 0 -10px" class="container">
									<div class="row">
										<div style="margin:0 1px" class="span2">
											<select class="form-control" name="searchType">
												<option value="t"
													<c:out value="${searchType eq 't' ? 'selected' : ''}"/>>제목</option>
												<option value="w"
													<c:out value="${searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
											</select>
										</div>

										<div style="margin:0 5px" class="span8">
											<input type="text" class="form-control" name="keyword"
												id="keywordInput" value="${keyword}" />
										</div>

										<div class="span2">
											<button id="searchBtn" type="submit"
												class="btn btn-outline-info">검색</button>
										</div>
									</div>
								</div>
							</i>
						</div>
						<!-- 검색 끝-->

						<div class="card-body">
							<div class="table-responsive">

								<!-- 글갯수 옵션 -->
								<div style="float: right;">
									<select id="cntPerPage" name="sel" onchange="selChange()">
										<option value="5"
											<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
											보기</option>
										<option value="10"
											<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
											보기</option>
									</select>
								</div>
								<!-- 옵션선택 끝 -->

								<!-- 글목록 -->
								<table class="table table-striped table-bordered" id="dataTable" border="1">
									<thead>
									<tr>
											<th>번호</th>
											<th width="50%">제목</th>
											<th>작성자</th>
									<!-- 	<td>등록일</td>
										<td>조회수</td> -->
									</tr>
									</thead>
									<tbody>
										<%-- <c:if test="${status eq 'S'}"> --%>
										<c:forEach items="${viewAll }" var="list">
											<tr style = "cursor:pointer;" onClick = "location.href='view?idx=${list.idx }'">
												
												<%-- <td>${list.idx }</td> --%>
												<td></td>
												<td>${list.title }
												<td>${list.writer }</td>
											<%-- 	<td><fmt:formatDate value="${list.reg_date }"
														pattern="yyyy.MM.dd" /></td>
												<td>${list.count }</td> --%>
												
											</tr>
										</c:forEach>
										<%-- </c:if> --%>
									</tbody>
								</table>
								
							</div>
						</div>
					</div>

					<div class="col">
						<div>
							<!-- 글쓰기 버튼 -->
							<input type="button" class="btn btn-outline-info" id="writeBtn"
								value="글쓰기" style="float: right;"
								onclick="location.href='/write'">
						</div>

					</div>
					
					<!-- 페이지네이션 -->
					<div style="display: block; text-align: center;">
						<c:if test="${paging.startPage != 1 }">
							<a
								href="/web/saveBoard?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a
										href="/web/saveBoard?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="/web/saveBoard?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
						</c:if>
					</div>
				</div>


			</div>
		</div>
	</div>
	<footer class="footer">
		<p style="color: black; text-align: left;">
		<div
			style="width: 250px; height: 50px; float: left; margin-left: 430px; margin-right: 100px">
			<img class="sbdc" alt="SBDC" width="250" height="50" align="middle"
				hspace="50"
				src="https://www.sbdc.or.kr/assets/images/footer/footer-logo.png">
		</div>
		<div style="margin-left: 300px">
			<p style="text-align: left;">
				(07997) 서울특별시 양천구 목동동로 309 중소기업유통센터<br> 대표자 : 정진수 / 대표전화 :
				02-6678-9000 / 사업자등록번호 : 107-81-53660 <br> © Small & Medium
				Business Distribution Center. All Rights Reserved.
			</p>
		</div>
		</p>
	</footer>
</body>
</html>