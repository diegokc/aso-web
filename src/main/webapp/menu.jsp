<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html data-bs-theme="light">
<head>
	<title>Menu principal del sistema</title>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>Demo</title>
	<meta name="description" content="" />
	<meta name="viewport" content="width=device-width" />
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	
	<!-- 	<script src="js/bootstrap.min.js"></script> -->
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
	     </script>
	<script>
		function cambioTema(){
		    if (document.documentElement.getAttribute('data-bs-theme') == 'dark') {
		        document.documentElement.setAttribute('data-bs-theme','light');
		    }
		    else {
		        document.documentElement.setAttribute('data-bs-theme','dark');
		    }
		}
	</script>
</head>
<body>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link" href="#">Inicio</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Expo</a></li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Parametros</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="OpcionServlet">Listar Opciones</a></li>
            <li><a class="dropdown-item" href="#">Expo</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Socios</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Pago de cuotas</a></li>
            <li><a class="dropdown-item" href="#">Consultar cuotas pendientes</a></li>
            <li><a class="dropdown-item" href="SocioServlet">Registrar socio</a></li>
            <li><a class="dropdown-item" href="listar-socio.jps">Listar socio</a></li>
            
          </ul>
        </li>
      </ul>

	<button class="btn" type="button" onclick="javascript:cambioTema();" id="cambioTema" name="cambioTema">dark/ligth</button>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>



  </body>