<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <!-- Bootstrap core CSS -->
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'signin.css')}">
    <title>Bienvenido a Monedas</title>		
  </head>
  <body>		
    <!--<div id="page-body" role="main">
      <h1>Welcome to Grails</h1>
      <p>Congratulations, you have successfully started your first Grails application! At the moment
         this is the default page, feel free to modify it to either redirect to a controller or display whatever
         content you may choose. Below is a list of controllers that are currently deployed in this application,
         click on each to execute its default action:</p>

      <div id="controller-list" role="navigation">
        <h2>Available Controllers:</h2>
        <ul>
          <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                  <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
          </g:each>
        </ul>
      </div>
    </div>-->
    <div id="page-body" role="main" class="container">
      <form class="form-signin" role="form" action ="usuario/login">
        <h4 class="form-signin-heading">Inicia sesión para acceder a Monedas</h4>
        <input name="email" type="email" class="form-control" placeholder="Correo Electronico" required autofocus>
        <input name="password" type="password" class="form-control" placeholder="Contraseña" required>
        <label class="checkbox">
          <input type="checkbox" value="remember-me"> No cerrar sesión
        </label>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Iniciar sesión</button>
      <form>
    </div>
  </body>
</html>
