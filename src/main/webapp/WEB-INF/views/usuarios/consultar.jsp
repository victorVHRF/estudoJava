<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">
<meta charset="utf-8">
<meta http-equiv="cache-control" content="public" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=yes">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<!-- 
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 -->
<script src="https://code.jquery.com/jquery-2.1.4.min.js"
	integrity="sha256-8WqyJLuWKRBVhxXIL1jBDD7SDxU936oZkCnxQbWwJVw="
	crossorigin="anonymous"></script>


<!-- Toastr -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>


<div class="container">
	<br>
	<div class="row">
		<div class="col-md-12">
			<div class="card strpied-tabled-with-hover">
				<div class="card-header ">
					<h4 class="card-title">Consulta Usuários</h4>
				</div>
				<div class="card-body">
					<form:form method="POST" cssClass='form-horizontal'>
						<div class="row">
							<div class="col-md-8">
								<div class="form-group">
									<label>Nome</label> <input type="text" name="userName"
										value='${(fn:escapeXml(param.userName))}' id="userName"
										placeholder="Informe o Nome" class="form-control">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label>Login</label> <input type="text" name="userLogin"
										id="userLogin" value='${(fn:escapeXml(param.userLogin))}'
										placeholder="Informe o Login" class="form-control">
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-5">
								<div class="form-group">
									<label>Email</label> <input type="text" name="email" id="email"
										value='${(fn:escapeXml(param.email))}'
										placeholder="Informe o Login" class="form-control">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 text-right">
								<button type="submit" id="btnSubmit" name="btnSubmit"
									class="btn btn-primary btn-fill ">
									<i class="fa fa-search"></i> Pesquisar
								</button>
								<a class="btn btn-info btn-fill" href="/SpringMVCJava/users"
									role="button">Limpar</a> <a class="btn btn-success btn-fill"
									href="/SpringMVCJava/users/cadastrar" role="button">Cadastrar
									Novo Usuário</a>
							</div>
						</div>
					</form:form>
					<br>
					<div class="row">
						<div class="col-md-12">
							<h4>Resultado da Pesquisa</h4>
						</div>
					</div>
					<br>
					<div class="row" style="margin: 0px;">
						<div class="col-md-12">
							<table class="table table-striped table-responsive"
								id="tabelaConsulta">
								<thead>
									<tr>
										<th>ID</th>
										<th>Nome</th>
										<th>Login</th>
										<th>Email</th>
										<th class="text-center">Ação</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="it" items="${lista}" varStatus="status">
										<tr>
											<td>${it.id}</td>
											<td>${it.userName}</td>
											<td>${it.userLogin}</td>
											<td>${it.email}</td>
											<td><a class="btn btn-warning btn-fill"
												href="/SpringMVCJava/users/editar/${it.id}" role="button">Editar</a>
												<button type="button" class="btn btn-danger"
													onclick="excluirRegistro(${it.id})">Excluir</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<br>
</body>
<script>

 	function excluirRegistro(id) {
		$.ajax({
			url:'/SpringMVCJava/users/delete/'+id,
			type:'DELETE'
		}).done(function(data){
			toastr.success(data);
			setTimeout(function(){location.reload(); }, 1500);
		}).fail(function(data){
				toastr.warning(data);
		});	
	}

		
// Aguarda carregamento do JSP para execução da função auto executável
$(document)
			.ready(
					function() {
						var table = $('#tabelaConsulta')
								.DataTable(
										{
											responsive : true,
											bFilter : false,
											bLengthChange : false,
											bAutoWidth : false,
											iDisplayLength : 10,
											columnDefs : [ {
												"width" : "5%",
												"targets" : 0
											}, {
												"width" : "35%",
												"targets" : 1
											}, {
												"width" : "20%",
												"targets" : 2
											}, {
												"width" : "20%",
												"targets" : 3
											}, {
												"width" : "20%",
												"targets" : 4
											}, ],
											order : [ [ 0, "desc" ] ],
											language : {
												"sEmptyTable" : "Nenhum registro encontrado",
												"sInfo" : "Mostrando de _START_ até _END_ de _TOTAL_ registros",
												"sInfoEmpty" : "Mostrando 0 até 0 de 0 registros",
												"sInfoFiltered" : "(Filtrados de _MAX_ registros)",
												"sInfoPostFix" : "",
												"sInfoThousands" : ".",
												"sLengthMenu" : "_MENU_ resultados por página",
												"sLoadingRecords" : "Carregando...",
												"sProcessing" : "Processando...",
												"sZeroRecords" : "Nenhum registro encontrado",
												"sSearch" : "Pesquisar por CPF: ",
												"oPaginate" : {
													"sNext" : "Próximo",
													"sPrevious" : "Anterior",
													"sFirst" : "Primeiro",
													"sLast" : "Último"
												},
												"oAria" : {
													"sSortAscending" : ": Ordenar colunas de forma ascendente",
													"sSortDescending" : ": Ordenar colunas de forma descendente"
												}
											}
										});
					});

	var sucessoMessage = "${message}";
	if (sucessoMessage != "") {
		toastr.success(sucessoMessage);
	}
</script>
</body>
</html>