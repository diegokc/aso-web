<%@ page language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>


<head>
    <title>Crear Socio</title>
<script>
function cargarNuevo(){
	documet.getElementById("grillaSocioForm").submit();
}
</script>
</head>


<body>
    <h1>Crear Socio</h1>
    <form action="socio-servlet" method="POST" class="row g-3">
    	<input type="hidden" id="id-socio" name="id-socio" value="" />
    	<input type="hidden" id="ACCION" name="INSERTAR" value="" />
    	
    	<div class="col-md-6">
        <label for="nombres-socio" class="form-label">Nombres:</label>
        <input type="text" id="nombres-socio" name="nombres-socio" class="form-control" aria-describedby="nombresHelp"/>
        <div class="nombresHelp" class="form-text">No compartimos tu nombre con nadie</div>
        </div>
 
     	<div class="col-md-6">
        <label for="apellidos-socio" class="form-label">Apellidos:</label>
        <input type="text" id="apellidos-socio" name="apellidos-socio" class="form-control" aria-describedby="apellidosHelp" />
        <div class="apellidosHelp" class="form-text">No compartimos tu apellido con nadie</div>
        </div>
        
     	<div class="col-md-6">
        <label for="email-socio" class="form-label">E-mail:</label>
        <input type="text" id="email-socio" name="email-socio" class="form-control" aria-describedby="emailHelp" />
        <div class="emailHelp" class="form-text">No compartimos tu correo con nadie</div>
        </div>
        
        <div class="col-md-6">
        <label for="nro-socio-usuario" class="form-label">Nro de Socio:</label>
        <input type="text" id="nro-socio-usuario" name="nro-socio-usuario" class="form-control" aria-describedby="nrosocioHelp" />
        <div class="nrosocioHelp" class="form-text">No compartimos tu nro de socio con nadie</div>
        </div>

        <div class="col-md-6">
        <label for="cedula-socio" class="form-label">Cedula:</label>
        <input type="text" id="cedula-socio" name="cedula-socio" class="form-control" />
        </div>

        <div class="col-md-6">
        <label for="fecha-ingreso-socio" class="form-label">Fecha ingreso :</label>
        <input type="text" id="fecha-ingreso-socio" name="fecha-ingreso-socio" class="form-control" />
        </div>
        
        <div class="col-md-12">
        <label for="socio-proponente" class="form-label">Socio proponente:</label>
        <select id="socio-proponente" name="socio-proponente" class="form-control" aria-label="Seleccione el socio proponente">
        <c:forEach var="socioProp" items="${SOCIOS}">
        	<option value="${socioProp.id}">${socioProp.nombres} ${socioProp.apellidos}</option>
        </c:forEach>
        </select>
        </div>

        <div class="col-md-6">
        <label for="tipo-socio" class="form-label">Tipo de socio:</label>
        <select id="tipo-socio" name="tipo-socio" class="form-control" aria-label="Seleccione el tipo de socio">
        <c:forEach var="tipoSocio" items="${TIPOS_SOCIO}">
        	<option value="${tipoSocio.id}">${tipoSocio.descripcion}</option>
        </c:forEach>
        </select>
        </div>
        
        <div class="col-md-2">
        <label for="estado-actual" class="form-label">Estado actual:</label>
        <select id="estado-actual" name="estado-actual" class="form-control" aria-label="Seleccione el estado actual">
        <c:forEach var="estadoSocio" items="${ESTADOS_SOCIOS}">
        	<option value="${estadoSocio.id}">${estadoSocio.descripcion}</option>
        </c:forEach>
        </select>
        </div>
 
        <div class="col-md-12 form-check" >
        <label for="estado-actual" class="form-check-label">Socio fundador?:</label>
        <input type="checkbox" id="estado-actual" name="estado-actual" class="form-check-input" id="fundador" name="fundador" />
        </div>
                               
		<div class="col-md-12" >
        <input type="submit" clas="btn btn-primary mb-3" value="Guardar" />
        </div>
    </form>
    
</body>
</html>
