
<%@ page import="app.Usuario" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <link rel="stylesheet" type="text/css" href="/css/main.css" />
        <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
	<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>                
    </head>
	<body class="centrarCuerpo">            
                <a href="#list-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                            <ul class="nav nav-pills nav-justified" role="tablist">
                                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                            </ul>
                </div>
           
	    <div id="list-usuario" class="content scaffold-list" role="main">
	    		<!--<h1><g:message code="default.list.label" args="[entityName]" /></h1>-->
                <h1>Listado de Usuarios </h1>
	    		<g:if test="${flash.message}">
	    			<div class="message" role="status">${flash.message}</div>
	    		</g:if>                  
			<table class="table">
			<thead>
					<tr>					
						<g:sortableColumn property="nombre" title="${message(code: 'usuario.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="apellido" title="${message(code: 'usuario.apellido.label', default: 'Apellido')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'usuario.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="dni" title="${message(code: 'usuario.dni.label', default: 'Dni')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'usuario.email.label', default: 'Email')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "apellido")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "password")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "dni")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "email")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${usuarioInstanceCount ?: 0}" />
			</div>
		
            </div>
	</body>
</html>
