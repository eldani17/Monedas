<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Administrador</title>
    <r:layoutResources />
  </head>
  <body>
    <div class="row">
      <div class="col-md-12">Header</div>
      </div>
      <div class="row">
        <div class="col-md-3">Menu
        
            <div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"> <g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="Listar Usuarios" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="Crear Nuevo Usuario" args="[entityName]" /></g:link></li>
			</ul>
        </div> 
        
        </div>
        <div class="col-md-9"><g:layoutBody/></div>
      </div>
      <div class="row">
        <div class="col-md-12">Footer</div>                    
      </div>
    <r:layoutResources />
  </body>
</html>
