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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


<style>
h2 {
	text-align: center;
	margin: 10px 5px 30px;
}

table {
	width: 100%;
}

#outter {
	display: block;
	width: 100%;
	margin: auto;
}

a {
	text-decoration: none;
}

body {
	font-family: arial;
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
	top: 40%;
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
	margin-left: 300px;
	padding: 6rem 1rem 3rem 12rem;
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

.right-text {
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

<script>
	var IDX = getQueryStringObject().idx;
	function getQueryStringObject() {
		var a = window.location.search.substr(1).split('&');
		if (a == "")
			return {};
		var b = {};
		for (var i = 0; i < a.length; ++i) {
			var p = a[i].split('=', 2);
			if (p.length == 1)
				b[p[0]] = "";
			else
				b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
		}
		return b;
	} // 연구해보기

	/* 댓글관련 */
	function drawReply(replys) {
		$("#cnt").text("등록된 댓글 - " + replys.length)
		var html = '';
		html += '<form class="form-inline" action="writeReply" method="post"><input type="hidden" name="idx" value = "' + IDX + '"><input type="hidden" name="replyIdx" value = "0"><input type="text" class="form-control mb-2 mr-sm-2" id="contents" placeholder="답글" name="contents"><button type="submit" class="btn btn-primary mb-2">등록</button></form>';

		replys
				.forEach(function(reply) {
					if (reply.replyIdx == 0) {
						var rc = 0;
						replys.forEach(function(i) {
							if (reply.idx == i.replyIdx)
								rc++;
						})
						html += '<div class="row"><div class="col-sm-12">';
						html += '<form class="form-inline" action="writeReply" method="post"><label for="pwd" class="mr-sm-2">'
								+ reply.contents + '(' + rc + ')' + '</label>'
						html += '<input type="hidden" name="idx" value = "' + IDX + '"><input type="hidden" name="replyIdx" value = "' + reply.idx + '"><input type="text" class="form-control mb-2 mr-sm-2" id="contents" placeholder="답글" name="contents"><button type="submit" class="btn btn-primary mb-2">등록</button></form>';
						html += '<div class="row"><div class="col-sm-12 sub' + reply.idx + '"></div></div></div></div>';
					}
				})
		$("#replyArea").append(html);
		replys
				.forEach(function(reply) {
					if (reply.replyIdx != 0) {
						var rc = 0;
						replys.forEach(function(i) {
							if (reply.idx == i.replyIdx)
								rc++;
						})
						var subHtml = '';
						subHtml = '<div class="row"><div class="col-sm-12 subReply">';
						subHtml += '<form class="form-inline" action="writeReply" method="post"><label for="pwd" class="mr-sm-2">'
								+ reply.contents + '(' + rc + ')' + '</label>'
						subHtml += '<input type="hidden" name="idx" value = "' + IDX + '"><input type="hidden" name="replyIdx" value = "' + reply.idx + '"><input type="text" class="form-control mb-2 mr-sm-2" id="contents" placeholder="답글" name="contents"><button type="submit" class="btn btn-primary mb-2">등록</button></form>';
						subHtml += '<div class="row"><div class="col-sm-12 sub' + reply.idx + '"></div></div></div></div>';
						$(".sub" + reply.replyIdx).append(subHtml);
					}
				})
	}

	$.ajax({
		url : "boardView?idx=" + IDX,
		success : function(result) {
			$("#image").append(
					'<img src="resources/images/' + result.image
							+ '" style="width: 100%;">');
			$("#title").text(result.title);
			$("#contents").text(result.contents);

			$("#writer").text(result.writer);
			$("#count").text(result.writer);
			$("#reg_date").text(result.reg_date);
			$("#idx").text(result.idx);
		}
	});

	$.ajax({
		url : "replyList?idx=" + IDX,
		success : function(replys) {
			drawReply(replys)
		}
	});
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#writeBtn").click(function() {
							location.href = "write";
						})
						$
								.ajax({
									url : "boardList",
									success : function(result) {
										var html = "";
										result
												.forEach(function(item) {
													html += "<tr> <td><a href = 'view?idx="
															+ item.idx
															+ "'>"
															+ item.title
															+ "</a>"
															+ "<button type='button' class='btn btn-danger' style='float: right;' id = 'deleteBtn' onclick = 'location.href = 'view?idx='"
															+ item.idx
															+ "'>글삭제</button></td> </tr>"
												})
										$("#listArea").append(html)
										$('#example').DataTable();
									}
								});
						$("#deleteBtn").click(function() {
							location.href = "write";
						})
						$("#updateBtn").click(function() {
							location.href = "update";
						})
					});
	/*
	 html+= "<tr> <td><a href = 'view?idx=" + item.idx + "'>" + item.title + "</a></td> </tr>"
	 + "<button type='button' class='btn btn-primary' align='right' id = 'deleteBtn'>글삭제</button></td> </tr>"
	 <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
	 */
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
				<h3>
					<a href="index"
						style="font-weight: bold; font-size: 1.0em; line-height: 1.0em; color: #19555c">
						SBDC 21년도 게시판</a>
				</h3>
			</div>
			<div id="user">
				<h5>임시사용자</h5>
			</div>
		</a>

	</header>

	<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="col-3 bd-sidebar">
				<ul class="nav" id="menu">
					<li class="nav-item"><a class="nav-link" href="index"
						style="color: black; font-size: 20px;">홈</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false" style="color: black; font-size: 20px;">게시판
					</a>
						<ul class="dropdown-menu">
							<li style="text-align: center"><a href="saveBoard"
								style="color: black">완료 게시판</a></li>
							<li style="text-align: center"><a href="tempBoard"
								style="color: black">임시저장 게시판</a></li>
							<li style="text-align: center"><a href="deleteBoard"
								style="color: black">삭제 게시판</a></li>
						</ul></li>
				</ul>
				<br>
			</div>
		</div>
	</div>

	<!-- 기존 뷰
	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-12">
				<h2>본문</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<div id="image"></div>
			</div>
			<div class="col-sm-6">
				<div class="row">
					<div class="col-sm-12">
						<h2 id="title"></h2>
					</div>
					<div class="col-sm-12">
						<pre id="contents"></pre>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<h2 id="cnt"></h2>
				<div id="replyArea"></div>
			</div>
		</div>
	</div>
	 -->
	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col">
				<div class="form-row float-left">
					<h2 id="title">제목 :</h2>
				</div>
				<div class="form-row float-right">
					<h4 id="idx"></h4>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="form-row float-left">
					<h3 id="writer">작성자 :</h3>
					<h3 id="reg_date">등록일 :</h3>
				</div>
				<div class="form-row float-right">
					<h4 id="count">조회수 :</h4>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div id="image"></div>
				<pre id="contents"></pre>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div>
					<h2 id="cnt"></h2>
					<div id="replyArea"></div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="form-row float-right">
					<button type=submit class="btn btn-outline-info">수정하기</button>
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
