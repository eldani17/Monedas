<%@ page import="app.Moneda" %>



<div class="fieldcontain ${hasErrors(bean: monedaInstance, field: 'siglas', 'error')} required">
	<label for="siglas">
		<g:message code="moneda.siglas.label" default="Siglas" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="siglas" required="" value="${monedaInstance?.siglas}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: monedaInstance, field: 'valorActual', 'error')} required">
	<label for="valorActual">
		<g:message code="moneda.valorActual.label" default="Valor Actual" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valorActual" value="${fieldValue(bean: monedaInstance, field: 'valorActual')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: monedaInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="moneda.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${app.Usuario.list()}" optionKey="id" required="" value="${monedaInstance?.usuario?.id}" class="many-to-one"/>

</div>

