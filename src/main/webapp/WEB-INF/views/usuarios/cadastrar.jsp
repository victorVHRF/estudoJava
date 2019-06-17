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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

<div class="container">
	<br>
	<div class="row">
		<div class="col-md-12">
			<div class="card strpied-tabled-with-hover">
				<div class="card-header ">
					<h4 class="card-title">Cadastrar Usuário</h4>
				</div>
				<div class="card-body">
					<form:form method="POST" modelAttribute="obj"
						cssClass='form-horizontal'>
						<div class="row">
							<div class="col-md-8">
								<div class="form-group">
									<label>Nome</label> <input type="text" name="userName"
										id="userName" placeholder="Informe o Nome" required
										class="form-control">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label>Login</label> <input type="text" name="userLogin"
										id="userLogin" placeholder="Informe o Login" required
										class="form-control">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label>E-mail</label> <input type="text" name="email"
										id="email" placeholder="Email" required class="form-control">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<button type="submit" type="button"
									class="btn btn-success btn-fill">
									<i class="nc-icon nc-send"></i> Salvar Cadastro
								</button>
								<button type="button" onclick="limparCampos()"
									class="btn btn-info btn-fill">
									<i class="nc-icon nc-refresh-02"></i> Limpar Campos
								</button>
								<a class="btn btn-warning btn-fill" href="/SpringMVCJava/users"
									role="button">Voltar à Consulta de Usuários</a>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script>
	function limparCampos() {
		document.getElementById("userName").value = "";
		document.getElementById("userLogin").value = "";
		document.getElementById("email").value = "";
	}

	// Limpar Campos
	var sucessoMessage = "${message}";
	if (sucessoMessage != "") {
		toastr.info(sucessoMessage);
	}
</script>
</body>
</html>