<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<%@ include file="../header.jsp"%>

	<div class="box">
		<section>
			<aside>
				<ul>
					<li class="aside_title">클래스</li>
					<li class="aside_menu"><a href="/class/classList?pageNum=1">클래스 전체보기</a></li>
					<li class="aside_menu"><a
						href="/class/classList-ongoing?pageNum=1">진행중인클래스</a></li>
					<li class="aside_menu" id="aside_menu_btn">카테고리별 클래스
						<div id="aside_submenu">
							<p>
								<a href="classList-category?key=A&pageNum=1">&nbsp;&nbsp;의류</a>
							</p>
							<p>
								<a href="classList-category?key=B&pageNum=1">&nbsp;&nbsp;식품</a>
							</p>
							<p>
								<a href="classList-category?key=C&pageNum=1">&nbsp;&nbsp;미용</a>
							</p>
							<p>
								<a href="classList-category?key=D&pageNum=1">&nbsp;&nbsp;기타</a>
							</p>
						</div>
					</li>
					<li class="aside_menu"><a href="/class/classList-new">신규
							클래스</a></li>
					<li class="aside_menu"><a href="/class/classList-expired">지난클래스</a></li>
					<li class="aside_menu"><a href="/class/suggestion">클래스제안</a></li>
				</ul>

			</aside>
			<input type="hidden" id="startPage" value=1> <input
				type="hidden" id="maxPage" value="${count }">
			<div class="content" id="listBox">
				<c:forEach var="c" items="${list }">
					<div class="class_one">
						<a href="class-detail?class_code=${c.class_code }"><img
							src="../images/${fn:split(c.suggest_photo,'-')[0]}"></a>
						<p>
							<a href="class-detail?class_code=${c.class_code }">${c.class_subject }</a>
						</p>
						<p>${c.class_price }</p>
						<p>${c.class_teacher }</p>
					</div>
				</c:forEach>
				<a href="class/classList-ongoing?pageNum=${startNum - 5}&startNum=${startNum - 5 }">[이전]</a>
				<c:forEach var="pageNum" begin="${startNum }" end="${startNum + 4 }">
					<c:if test="${pageNum le count }">
						<a href="/class/classList-ongoing?pageNum=${pageNum }">${pageNum }</a>&nbsp;&nbsp;
					</c:if>
				</c:forEach>
				<c:if test="${startNum + 5 le count }">
					<a href="/class/classList=ongoing?pageNum=${startNum + 5 }&startNum="${startNum + 5 }">[다음]</a>
				</c:if>


			</div>
		</section>
	</div>
	<script>
		$("#aside_menu_btn").mouseover(function() {
			//alert('dd');
			$("#aside_submenu").css("display", "block");
		})
		$("#aside_menu_btn").mouseout(function() {
			//alert('dd');
			$("#aside_submenu").css("display", "none");
		})

		$("#prev").click(
				function() {
					let pageNum = $("#startPage").val();
					let count = $("#maxPage").val();
					pageNum = Number(pageNum) - 5;
					if (pageNum < 1) {
						pageNum = 1;
					}
					$("#startPage").val(pageNum);

					$("#pageNum").empty();
					for (let i = pageNum; i < pageNum + 5; i++) {
						if (i <= count) {
							$("#pageNum").append(
									"<button type = 'button' class='pages'>"
											+ i + "</button>");
						}
					}
				})

		$("#next").click(
				function() {
					let pageNum = $("#startPage").val();
					let count = $("#maxPage").val();
					pageNum = Number(pageNum) + 5;
					if (pageNum < 1) {
						pageNum = 1;
					}
					$("#startPage").val(pageNum);

					$("#pageNum").empty();
					for (let i = pageNum; i < pageNum + 5; i++) {
						if (i <= count) {
							$("#pageNum").append(
									"<button type = 'button' class='pages'>"
											+ i + "</button>");
						} else {
							$("#next").css("display", "none");
						}
					}
				})
	</script>
</body>
</html>