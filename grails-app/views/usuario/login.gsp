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
        
    <div class="container">
        <!--<form class="form-signin" role="form"> -->
        <g:form name="FormularioLogin" url="[controller:'Usuario',action:'chequin']">    
            <h2 class="form-signin-heading">Please sign in</h2>
            <input type="email" class="form-control" placeholder="Email address" required autofocus>
            <input type="password" class="form-control" placeholder="Password" required>
            <label class="checkbox">
              <input type="checkbox" value="remember-me"> Remember me
            </label>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        </g:form>            
       <!-- </form> -->
    </div> <!-- /container 
        
        
        
        
            <label for="usuario">Usuario:</label> <g:textField name="Usuario" />
            <label for="Contraseña">Contraseña:</label> <g:textField name="Contraseña"/>
            <g:actionSubmit value="Enviar" />    
            
        
          -->
    </body>
</html>
