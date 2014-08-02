<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>      
    <meta charset="utf-8">
    <title>Usuario - System Monedas</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">    
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
    <style type="text/css">
      body {
        padding-top: 120px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }
      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }
    </style>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-responsive.css')}" type="text/css">
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
          <a class="brand" href="#">System Monedas Bienvenido Usuario</a>          
          <div class="nav-collapse collapse">
            <p class="navbar-text pull-right">
             Usuario: 
             <a><g:message code="${session.user}"/></a>
            <a><g:link controller="Usuario" action="logout"><g:message code="Salir"/></g:link></a> 
            </p>
            
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header">Menu</li>
              <li class="nav-header">+Monedas</li>
              <li><g:link controller="Monedas" action="show"><g:message code="&nbsp&nbspListar Monedas" args="[entityName]"/></g:link></li>
              <li><g:link controller="Monedas" action="create"><g:message code="&nbsp&nbspAgregar Moneda" args="[entityName]" /></g:link></li>  
              <li class="nav-header">+Registros</li>       
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
        <div class="span9">
          <div class="hero-unit">
            <g:layoutBody/>
          </div>
        </div><!--/span-->
      </div><!--/row-->
      <hr>
      <footer>
        <p align="center">Copyright &copy; 2014 UNTDF - Alumnos LYP 2014 - Todos los derechos reservados</p>
      </footer>
    </div>
  </body>
</html>