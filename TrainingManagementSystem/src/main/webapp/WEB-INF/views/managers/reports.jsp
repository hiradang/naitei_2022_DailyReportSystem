<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<c:set var="baseURL" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid bootstrap snippets bootdey">
		<div class="row">
			<div class="col-md-12 p-5 m-3">
				<h2>Danh sách báo cáo</h2>
				<table class="table text-center">
					<thead>
						<tr>
							<!-- <th scope="col">STT</th> -->
							<th scope="col">Tên thành viên</th>
							<th scope="col">Ngày báo cáo</th>
							<th scope="col">Việc đã làm</th>
							<th scope="col">Vấn đề</th>
							<th scope="col">Việc dự định</th>
							<th scope="col">Hành động</th>
						</tr>
					</thead>
					<tbody id="reportsTable">
						<tr>
							<form:form class="d-none d-md-flex"
								action="${baseURL}/manager/reports?pageNumber=${pageNumber }&textSearch=${searchParams.textSearch }&reportDate=${searchParams.date }"
								method="GET" modelAttribute="searchParams">
								<td><c:choose>
										<c:when test="${searchParams.textSearch != ''}">
											<form:input path="textSearch"
												class="form-control force-white text-secondary" type="search"
												placeholder="${name }" value="${name }"></form:input>
										</c:when>
										<c:otherwise>
											<form:input path="textSearch"
												class="form-control force-white text-secondary" type="search"
												placeholder="Nhập tên..." value="${name }"></form:input>
										</c:otherwise>
									</c:choose></td>
								<td><form:input path="date" value="${date }"
										class="form-control force-white text-secondary" type="date"></form:input></td>
								<td><button type='submit'
										class='btn btn-square btn-secondary'>
										<i class='fa fa-search' aria-hidden='true'></i>
									</button></td>
							</form:form>

							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<c:forEach var="std" items="${reports}">
							<tr>
								<!-- <td class="table-plus">${std.id}</td> -->
								<td>${std.user.name}</td>
								<td>${std.date}</td>
								<td>${std.actualTask}</td>
								<td>${std.plannedTask}</td>
								<td>${std.issue}</td>
								<td><a href='reports/${std.id}'><button type='button'
											class='btn btn-square btn-secondary m-2'>
											<i class='fa fa-comments' aria-hidden='true'></i>
										</button></a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item"><c:choose>
								<c:when test="${pageNumber > 1}">
									<a class="page-link"
										href="?pageNumber=${pageNumber - 1 }&textSearch=${searchParams.textSearch }&reportDate=${searchParams.date }"
										aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
								</c:when>
								<c:otherwise>
									<a class="page-link"
										href="?pageNumber=${pageNumber }&textSearch=${searchParams.textSearch }&reportDate=${searchParams.date }"
										aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
								</c:otherwise>
							</c:choose></li>

						<c:forEach begin="1" end="${totalPages}" varStatus="loop">
							<c:choose>
								<c:when test="${loop.index == pageNumber}">
									<li class="page-item active" aria-current="page"><a
										class="page-link"
										href="?pageNumber=${loop.index }&textSearch=${searchParams.textSearch }&reportDate=${searchParams.date }">${loop.index }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="?pageNumber=${loop.index }&textSearch=${searchParams.textSearch }&reportDate=${searchParams.date }">${loop.index }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${pageNumber < totalPages}">
								<li class="page-item"><a class="page-link"
									href="?pageNumber=${pageNumber + 1 }&textSearch=${searchParams.textSearch }&reportDate=${searchParams.date }"
									aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="?pageNumber=${pageNumber }&textSearch=${searchParams.textSearch }&reportDate=${searchParams.date }"
									aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
							</c:otherwise>
						</c:choose>

					</ul>
				</nav>
			</div>
		</div>
	</div>
	<style>
.force-white {
	background-color: white !important;
	width: 80%;
	text-align: center;
	position: relative;
	margin: auto;
	position: relative;
}
</style>
</body>
</html>