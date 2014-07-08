<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
    <title>Usuario</title>
    <r:layoutResources />
  </head>
  <body>
      
  <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#"><img src="http://sia1.subirimagenes.net/img/2014/07/08/140708015154648518.png"></a>
          <a class="brand" href="#">System Monedas</a>          
          <div class="nav-collapse collapse">
            <p class="navbar-text pull-right">
              Usuario: 
             <g:link controller="Usuario" action="logout"><g:message code="${session.user} Salir" /></g:link></a> 
            </p>
            
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
    
    
    <!--  
    <div class="row">
      <div class="col-md-12">Header usuario
      </div>
    </div>
                
    <div class="row">
      <div class="col-md-3">Menu
-->

        <!-- MENU DE MONEDAS -->  
     <div class="span9">
          <div class="hero-unit">
            <g:layoutBody/>
          </div>
    </div>
    
      <footer>
        <p align="center">Copyright &copy; 2014 UNTDF - Alumnos LYP 2014 - Todos los derechos reservados</p>
      </footer>
    <r:layoutResources />
  </body>
</html>
