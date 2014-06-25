<%@ page import="app.Registro" %>



<div class="fieldcontain ${hasErrors(bean: registroInstance, field: 'cambio', 'error')} required">
	<label for="cambio">
		<g:message code="registro.cambio.label" default="Cambio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cambio" value="${fieldValue(bean: registroInstance, field: 'cambio')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: registroInstance, field: 'fechaActualizacion', 'error')} required">
	<label for="fechaActualizacion">
		<g:message code="registro.fechaActualizacion.label" default="Fecha Actualizacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaActualizacion" precision="day"  value="${registroInstance?.fechaActualizacion}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: registroInstance, field: 'siglas', 'error')} required">
	<label for="siglas">
		<g:message code="registro.siglas.label" default="Siglas" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="siglas" required="" value="${registroInstance?.siglas}"/>

</div>

