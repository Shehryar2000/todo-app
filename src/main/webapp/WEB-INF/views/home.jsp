<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><c:out value="TODO Application ${ page}"></c:out></title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr"
	crossorigin="anonymous">
</head>
<body>

	<div class="container mt-3 text-center">

		<div class="row mt-4">
			<div class="col-md-2"></div>

			<div class="col-md-10 text-center">
				<h2>Welcome to TODO Manager</h2>
			</div>
		</div>

		<c:if test="${not empty msg}">
			<div class="container alert alert-success">
				<b><c:out value="${msg}"></c:out></b>
			</div>
		</c:if>

		<div class="row mt-4">

			<div class="col-md-2 text-center">
				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-action active"
						aria-current="true">Menu</a> <a
						href="<c:url value='/add'></c:url>"
						class="list-group-item list-group-item-action">Add TODO</a> <a
						href="<c:url value='/home'></c:url>"
						class="list-group-item list-group-item-action">View TODO</a>
				</div>

			</div>

			<div class="col-md-10">

				<c:if test="${page == 'home' }">

					<div class="card mb-3">
						<div class="card-header">
							<h4 class="text-center">All TODOs</h4>
						</div>
					</div>

					<c:if test="${not empty allTodo}">

						<c:forEach items="${ allTodo}" var="t">

							<div class="card mb-3">
								<div class="card-header">
									<h5>
										<c:out value="${t.getTitle()}"></c:out>
									</h5>
								</div>

								<div class="card-body">
									<p class="card-text">
										<c:out value="${t.getContent()}"></c:out>
									</p>
								</div>

								<div class="card-footer d-flex justify-content-center">
									<a href="<c:url value='/edit/${t.getId()}'></c:url>"
										class="btn btn-primary mx-2">Edit</a> <a
										href="<c:url value='/delete/${t.getId()}'/>"
										class="btn btn-danger mx-2"
										onclick="return confirm('Are you sure?')">Delete</a>
								</div>
							</div>

						</c:forEach>

					</c:if>


				</c:if>

				<c:if test="${page == 'add' }">
					<h2 class="text-center">Add TODO</h2>

					<form:form action="saveTodo" method="post" modelAttribute="todo">

						<div class="form-group">
							<form:input path="title" cssClass="form-control"
								placeholder="Enter your Todo title" />
						</div>

						<br />

						<div class="form-group">
							<form:textarea path="content" cssClass="form-control"
								placeholder="Enter your Todo content" cssStyle="height:200px" />
						</div>

						<br />

						<div class="container text-center">
							<button class="btn btn-outline-success">Add Todo</button>
						</div>

					</form:form>

				</c:if>

				<c:if test="${page == 'edit' }">
					<h2 class="text-center">Update TODO</h2>

					<form:form action="/ToDoApp/updateTodo" method="post"
						modelAttribute="todo">

						<form:hidden path="id" />

						<div class="form-group">
							<form:input path="title" cssClass="form-control"
								placeholder="Enter your Todo title" />
						</div>

						<br />

						<div class="form-group">
							<form:textarea path="content" cssClass="form-control"
								placeholder="Enter your Todo content" cssStyle="height:200px" />
						</div>

						<br />

						<div class="container text-center">
							<button class="btn btn-outline-success">Update Todo</button>
						</div>

					</form:form>

				</c:if>
			</div>

		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
		crossorigin="anonymous"></script>
</body>
</html>