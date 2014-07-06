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
                <g:if test="${usuarioInstance?.monedas}">
                    <table class="table table-hover">
                        <tr>
                            <th>Siglas</th>
                            <th>Cambio</th>
                            <th>Acciones</th>
                        </tr>
                                
                        <g:each in="${usuarioInstance.monedas}" var="m">
                            <tr>
                                <td>${m.siglas}</td>
                                <td>${m.valorActual}</td>
                                <td>
                                    <!-- Falta arreglar los formularios de edicion y eliminacion -->
                                    <g:form name="editar_moneda" url="[controller:'book',action:'list']"><button type="button" class="btn btn-info btn-xs">Editar</button></g:form>
                                    <g:form name="eliminar_moneda" url="[controller:'book',action:'list']"><button type="button" class="btn btn-danger btn-xs">Eliminar</button></g:form>
                                </td>
                            </tr>
                        </g:each>
                        
                    </table>
                </g:if>  
                <g:else>
                    <p>No hay monedas!</p>
                </g:else>
                <!-- Falta agregar el codigo para agregar monedas al usuario -->
                <!-- <g:select name="monedas" from="${metodo}" noSelection="['':'-Elige una moneda-']"/> -->
            </div>
            <div class="col-md-6">
            <!--    <g:if test="${usuarioInstance?.registros}">
                    <g:each in="${usuarioInstance.registros}" var="r">
                        <g:link controller="registro" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link>
                    </g:each>
		</g:if> -->
            </div>
        </div>  
	<g:form url="[resource:usuarioInstance, action:'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit" resource="${usuarioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
	</g:form>
        
    </body>
</html>
