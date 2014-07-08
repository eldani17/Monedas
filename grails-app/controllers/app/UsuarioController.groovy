package app
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UsuarioController
{
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def monedasService
        
    def index(Integer max)
    {
        params.max = Math.min(max ?: 10, 100)
        respond Usuario.list(params), model:[usuarioInstanceCount: Usuario.count()]
    }
    
    //De la vista llamo a esta accion, que verifica el logueo
    def login()
    {
        if(params.email)
        {
            def u=Usuario.findWhere(email:params.email)
            if (u.password==params.password)
            {
                //Busco en grupos si es administrador
                //Seteo Session por email
                session.user=params.email                
                //Seteo la sesion por defecto que es usuario comun
                //- Administrador - Es admin   Publico- No es Admin
                session.admin="false"
                u.grupos.each
                {
                    if (it.isAdmin)
                    {                       
                       session.admin="true"
                    }
                }                
                //Dependiendo si es administrador o no, elige el layout
                redirect(controller:"Usuario", action:"show")      
            }                     
        }        
    }
    
    def logout()
    {
        if (session.user)
        {
            session.user = null
            redirect(controller:'Principal', action: 'index')
        }
    }
                
    def show(Usuario usuarioInstance) 
    {                   
        def pepito=Usuario.findWhere(email:session.user)            
        def m=monedasService.getMonedas(pepito)        
        //def model=['user':pepito, 'monedas':m]
        //respond model
        render(view:'show', model:['user':pepito, 'monedas':m])
    }

    def create() 
    {
        respond new Usuario(params)        
    }

    @Transactional
    def save(Usuario usuarioInstance) 
    {
        if (usuarioInstance == null) {
            notFound()
            return
        }

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view:'create'
            return
        }
        //Le agrego un tipo Publico    
        def grupo= Grupo.findByNombre("publico")
        //Agrego al Nueso Usuario
        grupo.addToUsuarios(usuarioInstance).save(flush:true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect usuarioInstance
            }
            '*' { respond usuarioInstance, [status: CREATED] }
        }
        

    }

    def edit(Usuario usuarioInstance)
    {
        respond usuarioInstance
    }

    @Transactional
    def update(Usuario usuarioInstance) {
        if (usuarioInstance == null) {
            notFound()
            return
        }

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view:'edit'
            return
        }

        usuarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect usuarioInstance
            }
            '*'{ respond usuarioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Usuario usuarioInstance) {

        if (usuarioInstance == null) {
            notFound()
            return
        }

        usuarioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
