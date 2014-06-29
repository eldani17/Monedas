<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <!--<meta name="layout" content="main"/>-->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'administrador.css')}">
    <title>Saaample title</title>
  </head>
          
  <body>
      <header class="header">           
            <h1>Administrador de Usuarios y Grupos</h1>          
      </header>
    <div id="wrap"> <!-- envolvente general de nuestra página --> 
      <main class="content">
          <ul class="nav nav-tabs" role="tablist">
               <li><g:link controller="Usuario" action="create">Usuarios</g:link></li>
              <li><g:link controller="Grupo" action="create">Grupos</g:link></li>
          </ul>
      </main>
     </div>        
       <div id="footer"> <p>Facultad San Juan Bosco - Laboratorio de Lenguajes 2014 </p> </div> 
   </body> 
</html>
        
        