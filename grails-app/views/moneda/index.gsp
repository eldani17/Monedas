
<%@ page import="app.Moneda" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'moneda.label', default: 'Moneda')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-moneda" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-moneda" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="siglas" title="${message(code: 'moneda.siglas.label', default: 'Siglas')}" />
					
						<g:sortableColumn property="valorActual" title="${message(code: 'moneda.valorActual.label', default: 'Valor Actual')}" />
					
						<th><g:message code="moneda.usuario.label" default="Usuario" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${monedaInstanceList}" status="i" var="monedaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${monedaInstance.id}">${fieldValue(bean: monedaInstance, field: "siglas")}</g:link></td>
					
						<td>${fieldValue(bean: monedaInstance, field: "valorActual")}</td>
					
						<td>${fieldValue(bean: monedaInstance, field: "usuario")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${monedaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
