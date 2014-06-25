
<%@ page import="app.Registro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'registro.label', default: 'Registro')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-registro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-registro" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="cambio" title="${message(code: 'registro.cambio.label', default: 'Cambio')}" />
					
						<g:sortableColumn property="fechaActualizacion" title="${message(code: 'registro.fechaActualizacion.label', default: 'Fecha Actualizacion')}" />
					
						<g:sortableColumn property="siglas" title="${message(code: 'registro.siglas.label', default: 'Siglas')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${registroInstanceList}" status="i" var="registroInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${registroInstance.id}">${fieldValue(bean: registroInstance, field: "cambio")}</g:link></td>
					
						<td><g:formatDate date="${registroInstance.fechaActualizacion}" /></td>
					
						<td>${fieldValue(bean: registroInstance, field: "siglas")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${registroInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
