<%@ page language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>

<%@ include file="menu.jsp" %> 
<head>
	<title>ABM de Opciones</title>
<script>
function cancelar(){
	window.location.assign("OpcionServlet");
}
</script>
</head>


<body>
<div class="container">

<h1>Nueva Opción</h1>

 			
<form action="OpcionServlet" method="POST" id="opcionabm" name="opcionabm">

<input type="hidden" id="id-opcion" name="id-opcion" value="${OPCION != null && OPCION.id != null ? OPCION.id : ''}">
<input type="hidden" id="ACCION" name="ACCION" value="${OPCION != null && OPCION.id != null ? 'ACTUALIZAR' : 'INSERTAR'}">
						
  <div class="form-row align-items-center">

    <div class="col-sm-6 mb-3">
      <label for="dominio" class="form-label">Dominio</label>
		 <select class="form-select" id="dominio" name="dominio">
					<c:forEach var="dominio" items="${DOMINIOS}">
						<option value="${dominio.id}"  ${dominio.id == OPCION.dominio.id ? 'selected="selected"' : ''}>${dominio.descripcion}</option>
					</c:forEach>
				</select>
    </div>
    
  <div class="col-sm-6 mb-3">
    <label for="codigo" class="form-label">Codigo</label>
    <input type="text" class="form-control" id="codigo" aria-describedby="codigoHelp" placeholder="" name="codigo" value="${OPCION != null && OPCION.codigo != null ? OPCION.codigo : ''}">
    <small id="codigoHelp" class="form-text text-muted">Ingrese el codigo de la opción</small>
  </div>
  
 
   <div class="col-sm-6 mb-3">
    <label for="descripcion" class="form-label">Descripción</label>
    <input type="text" class="form-control" id="descripcion" aria-describedby="descripcionHelp" placeholder="" name="descripcion" value="${OPCION != null && OPCION.descripcion != null ? OPCION.descripcion : ''}">
    <small id="descripcionHelp" class="form-text text-muted">Ingrese la descripción de la opción</small>
  </div>
  
      <div class="col-sm-6 mb-3">
      <label for="estado" class="form-label">Estado</label>
      <select class="form-select" id="estado" name="estado">
         
       		 <option value="A" ${OPCION != null && OPCION.estado == "A" ? 'selected="selected"' : ''} >ACTIVO</option>
       		 <option value="I" ${OPCION != null && OPCION.estado == "I" ? 'selected="selected"' : ''}>INACTIVO</option>

      </select>
    </div>
    
    
        <div class="col-sm-6 mb-3">
      <label for="opcionpadre class="form-label">Opción Padre</label>
      <select class="form-select" id="opcionpadre" name="opcionpadre">
        <option value="">Choose...</option>
            <c:forEach var="opciones" items="${OPCIONES}">
       		 <option value="${opciones.id}" ${opciones.id == OPCION.opcionPadre.id ? 'selected="selected"' : ''} >${opciones.descripcion}</option>
 			</c:forEach>
      </select>
    </div>

    <div class="col-auto mb-3">
      <button type="submit" class="btn btn-primary">Grabar</button> <button type="button" class="btn btn-primary" onclick="javascript:cancelar();">Cancelar</button>
    </div>
    
  </div>
  
</form>

  </div>

</body>
</html>