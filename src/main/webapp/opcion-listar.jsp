<%@ page language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>

<%@ include file="menu.jsp" %> 
<head>
	<title>Opciones</title>
<script>
function cargarNuevo(){
	document.getElementById("grillaSocioForm").submit();
}
function editar(id){
	document.getElementById("ACCION").value="EDITAR";
	document.getElementById("ID").value=id;
	document.getElementById("grillaSocioForm").submit();
}
</script>
</head>

<link href="https://cdn.datatables.net/v/dt/dt-1.13.7/datatables.min.css" rel="style"></link>
<body>

<div class="container">

<h1>Opciones</h1>

<hr />
<form action="OpcionServlet" method="GET" id="grillaSocioForm" name="grillaSocioForm">
	<input type="hidden" name="ACCION" id="ACCION" value="NUEVO" />
	<input type="hidden" name="ID" id="ID" value="" />
</form>

<div class="container text-center">
  <div class="row">
    <div class="col">
	
	<div class="input-group">    
 	<select class="form-select" id="id-dominio" name="id-dominio">
		<c:forEach var="dominio" items="${DOMINIOS}">
			<option value="${dominio.id}"  ${dominio.id == OPCION.dominio.id ? 'selected="selected"' : ''}>${dominio.descripcion}</option>
		</c:forEach>
	</select>
	<button class="btn btn-outline-primary" type="button">Filtrar</button>
    </div>
        
    </div>
    <div class="col">


	<button type="button" onclick="javascript:cargarNuevo();" class="btn btn-primary">Nuevo Socio</button>


    </div>
  </div>

<hr />

<table class="table" id="tabla-opciones">
  <thead>
    <tr>
		<th scope="col">id</th>
		<th scope="col">Codigo</th>
		<th scope="col">Descripcion</th>
		<th scope="col">Padre</th>
		<th scope="col">Dominio</th>
		<th scope="col">Estado</th>
		<th scope="col">Acción</th>		
    </tr>
  </thead>
  <tbody>
    <c:forEach var="opcion" items="${OPCIONES}">
    <tr>
      <td><c:out value="${opcion.id}"></c:out></td>
      <td><c:out value="${opcion.codigo}"></c:out></td>
      <td><c:out value="${opcion.descripcion}"></c:out></td>
      <td><c:out value="${opcion.opcionPadre.codigo}"></c:out>&nbps;</td>
       <td><c:out value="${opcion.dominio.descripcion}"></c:out></td>
      <td><c:out value="${opcion.estado}"></c:out></td>
      <td>
      <button type="button" onclick="javascript:editar(${opcion.id});" class="btn btn-warning mb-3">editar</button>
      </td>
    </tr>
 	</c:forEach>

  </tbody>

</table>

</div>

</body>
<script type="text/javascript" src="js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.datatables.net/v/dt/dt-1.13.7/datatables.min.js"></script>
<script type="text/javascript">
	var tablaOpciones;

	var columns = [{
	    "title": "Id",
	    "data": "id"
	}, {
	    "title": "Codigo",
	    "data": "codigo"
	},{
	    "title": "Descripcion",
	    "data": "descripcion"
	},{
	    "title": "Estado",
	    "data": "estado"
	},{
	    "title": "Dominio",
	    "data": "dominio.descripcion"
	},{
	    "title": "Opcion Padre",
	    "data": "opcionPadre.descripcion"
	},{
	    "title": "Acciones",
	    "name": "Acciones", 
	    "sWidth": 30, 
	    "render": function(data,type,full,meta){
	    	var botones = "<input type=\"button\" value=\"Editar\" onclick=\"editar("
		    			+data.id+");\" class=\"btn btn-info\">";
		    botones += '<button type="button" class="btn btn-danger mb-3"'
		    			+' data-bs-toggle="modal" data-bs-id="' + data.id + '"'
						+' data-bs-target="#eliminarModal">Eliminar</button>';
			return botones;
		},
	    "bSortable": false, 
	    "bSearchable": false,
	    "data":null
	}];
	
	$(document).ready( function () {
		tablaOpciones = $('#tabla-opciones').DataTable({
			"columns": columns,
			"ajax": {"url":'/aso-web/OpcionServlet?ACCION=LISTAR&FORMATO=JSON',"dataSrc":""}
		});
	} );
	
	$('#id-dominio').on('change',function () {
	    var id = $('#id-dominio').val();
		var ajax_source = '/aso-web/OpcionServlet?ACCION=LISTAR&FORMATO=JSON&ID-DOMINIO=' +id;
		var table = $("#tabla-opciones").DataTable(); // get api instance
	    // load data using api
	    table.ajax.url(ajax_source).load();
    
	});
</script>

</html>