<%@ page import="app.Grupo" %>



<div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="grupo.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${grupoInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'isAdmin', 'error')} ">
	<label for="isAdmin">
		<g:message code="grupo.isAdmin.label" default="Is Admin" />
		
	</label>
	<g:checkBox name="isAdmin" value="${grupoInstance?.isAdmin}" />

</div>

<div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'usuarios', 'error')} ">
	<label for="usuarios">
		<g:message code="grupo.usuarios.label" default="Usuarios" />
		
	</label>
	<g:select name="usuarios" from="${app.Usuario.list()}" multiple="multiple" optionKey="id" size="5" value="${grupoInstance?.usuarios*.id}" class="many-to-many"/>

</div>

