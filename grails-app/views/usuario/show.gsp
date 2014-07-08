<%@ page import="app.Usuario" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="${session.admin?'administrador':'usuario'}"/>
  <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />	        
</head>
<body>        
  <div class="row">
    <div class="col-md-12">
      <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
      </g:if>
    </div>            
  </div>  
  <div class="row">
    <div class="col-md-6">                
      <g:if test="${user?.monedas}">
        <table class="table table-hover">
          <tr>
            <th>Siglas</th>
            <th>Cambio</th>
            <th>Acciones</th>
          </tr>

          <g:each in="${user.monedas}" var="m">
            <tr>
              <td>${m.siglas}</td>
              <td>${m.valorActual}</td>
              <td>
                <!-- Falta arreglar los formularios de edicion y eliminacion 
<g:form name="editar_moneda" url="[controller:'book',action:'list']"><button type="button" class="btn btn-info btn-xs">Editar</button></g:form>
<g:form name="eliminar_moneda" url="[controller:'book',action:'list']"><button type="button" class="btn btn-danger btn-xs">Eliminar</button></g:form> -->
              </td>
            </tr>
          </g:each>

        </table>
      </g:if>  
      <g:else>
        <p>No hay monedas!</p>                    
      </g:else>                
      <g:select name="monedas" from="${monedas}" noSelection="['':'-Elige una moneda-']"/>
      <g:actionSubmit value="Cargar Monedas" controller='Moneda' action="create" />      
    </div>
    <div class="col-md-6">
      <g:if test="${user?.registros}">
        <g:each in="${user.registros}" var="r">
          <g:link controller="registro" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link>
          
        </g:each>
      </g:if> 
    </div>
  </div>  
<g:link class="edit" action="edit" resource="${user}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
<g:link class="delete" action="delete" resource="${user}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><g:message code="default.button.delete.label" default="Delete" /></g:link>
</body>
</html>