package app



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UsuarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Usuario.list(params), model:[usuarioInstanceCount: Usuario.count()]
    }
    
    //De la vista llamo a esta accion, que verifica el logueo
    def login(){
        def usuario= Usuario.findByPasswordAndEmail(params.email,params.password)        
        //Si no existe el usuario
        if(!usuario){
            // para el caso de que el login sea incorrecto. se qda en el mismo index, deberiamos agregar un cartel
            // mostrando el error
            //redirect(uri:"/")
            
            // esto es para poder crear el usuario admin por unica vez.
            redirect(uri:"/usuario/create")
        }
        else{
            //creeria que debe funcionar asi
            if(usuario.Grupo.IsAdmin==True){
            //Aca deberiamos redireccionar a /usuario/administrador --> es el htlm q debe contener todos los link para poder
            // crear las cosas
            redirect(action: "show")
            flash.message="Tengo Usuario Administrador"
            //Dani Aca debemos crear el Layout para el Administrador
            }else{
                //Chicos deben fijarse donde envio la vista
                // aca hay q enviar a la vista usuario
                redirect(controller:"Moneda",action: "show")
    // Control para deslogueo
    def logout() {
                    if (session.user){
                        session.user = null
                        render(view:'login')
                    }
                }
                
    def show(Usuario usuarioInstance) {
        respond usuarioInstance
    }

    def create() {
        respond new Usuario(params)
    }

    @Transactional
    def save(Usuario usuarioInstance) {
        if (usuarioInstance == null) {
            notFound()
            return
        }

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view:'create'
            return
        }

        usuarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect usuarioInstance
            }
            '*' { respond usuarioInstance, [status: CREATED] }
        }
    }

    def edit(Usuario usuarioInstance) {
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
