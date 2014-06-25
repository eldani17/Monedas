
<%@ page import="app.Registro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'registro.label', default: 'Registro')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-registro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-registro" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list registro">
			
				<g:if test="${registroInstance?.cambio}">
				<li class="fieldcontain">
					<span id="cambio-label" class="property-label"><g:message code="registro.cambio.label" default="Cambio" /></span>
					
						<span class="property-value" aria-labelledby="cambio-label"><g:fieldValue bean="${registroInstance}" field="cambio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${registroInstance?.fechaActualizacion}">
				<li class="fieldcontain">
					<span id="fechaActualizacion-label" class="property-label"><g:message code="registro.fechaActualizacion.label" default="Fecha Actualizacion" /></span>
					
						<span class="property-value" aria-labelledby="fechaActualizacion-label"><g:formatDate date="${registroInstance?.fechaActualizacion}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${registroInstance?.siglas}">
				<li class="fieldcontain">
					<span id="siglas-label" class="property-label"><g:message code="registro.siglas.label" default="Siglas" /></span>
					
						<span class="property-value" aria-labelledby="siglas-label"><g:fieldValue bean="${registroInstance}" field="siglas"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:registroInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${registroInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
