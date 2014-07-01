import app.Grupo
import app.Usuario


class BootStrap
{
    def init = { servletContext ->   
            new Grupo
            (
                nombre:'publico',
                isAdmin:false
            ).addToUsuarios(new Usuario
            (
                  nombre:'Jonatan',
                  apellido:'Quintero',
                  password: "12345678",
                  dni: 36303191,
                  email: 'joni1692@hotmail.com'
            )).save()
            new Grupo
            (
                nombre:'Administradores',
                isAdmin:true
            ).addToUsuarios(new Usuario
            (
                  nombre:'Kukagres',
                  apellido:'Salkute',
                  password: "1234567",
                  dni: 38087818,
                  email: 'kukagres07@hotmail.com'
            )).save()
    }
    
    def destroy = {
    }
}