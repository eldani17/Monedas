<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sample title</title>
    </head>
    <body>
        <g:form name="FormularioLogin" url="[controller:'Usuario',action:'chequin']">
            <label for="usuario">Usuario:</label> <g:textField name="Usuario" />
            <label for="Contraseña">Contraseña:</label> <g:textField name="Contraseña"/>
            <g:actionSubmit value="Enviar" />    
            
        </g:form>
    </body>
</html>
