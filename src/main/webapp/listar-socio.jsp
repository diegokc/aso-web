<%@ page language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>

<%@ include file="menu.jsp" %> 
<head>
	<title>Menu Hola mundo</title>
<script>
function cargarNuevo(){
	documet.getElementById("grillaSocioForm").submit();
}
</script>
</head>


<body>


<form action="SocioServlet" method="GET" id="grillaSocioForm" name="grillaSocioForm">
<input type="hidden" name="ACTION" id="ACTION" />
<input type="hidden" name="ID" id="ID" value="" />

</form>
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Handle</th>
    </tr>
  </thead>
  <tbody>
    <tr>
		<th scope="col">id</th>
		<th scope="col">Nro Socio</th>
		<th scope="col">Nombre y Apellido</th>
		<th scope="col">Estado</th>
		<th scope="col">Ult couta pag</th>
		<th scope="col">Acciones</th>
    </tr>
    
    <c:forEach var="socio" items="${SOCIOS}">
    <tr>
      <td><c:out value="${socio.id}"></c:out></td>
      <td><c:out value="${socio.nroSocio}"></c:out></td>
      <td><c:out value="${socio.nombres} ${socio.nombres}"></c:out></td>
      <td><c:out value="${socio.estadoActual.descripcion}"></c:out></td>
      <td>ultima cuota</td>
      <td>accion</td>
    </tr>
 	</c:forEach>

  </tbody>
  <tfoot>
  	<tr>
  		<td colspan="6" align=""right>
  			<div class="col-auto">
  				<button type="button" onclick="" class="btn btn-primary mb-3">Nuevo Socio</button>
  			</div>
  		</td>
  	</tr>
  </tfoot>
</table>

</body>
</html>