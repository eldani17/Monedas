<%@ page import="app.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="usuario.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${usuarioInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellido', 'error')} required">
	<label for="apellido">
		<g:message code="usuario.apellido.label" default="Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellido" required="" value="${usuarioInstance?.apellido}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="usuario.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${usuarioInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'dni', 'error')} required">
	<label for="dni">
		<g:message code="usuario.dni.label" default="Dni" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="dni" type="number" value="${usuarioInstance.dni}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="usuario.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${usuarioInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'grupos', 'error')} ">
	<label for="grupos">
		<g:message code="usuario.grupos.label" default="Grupos" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'monedas', 'error')} ">
	<label for="monedas">
		<g:message code="usuario.monedas.label" default="Monedas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${usuarioInstance?.monedas?}" var="m">
    <li><g:link controller="moneda" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="moneda" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'moneda.label', default: 'Moneda')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'registros', 'error')} ">
	<label for="registros">
		<g:message code="usuario.registros.label" default="Registros" />
		
	</label>
	<g:select name="registros" from="${app.Registro.list()}" multiple="multiple" optionKey="id" size="5" value="${usuarioInstance?.registros*.id}" class="many-to-many"/>

</div>

