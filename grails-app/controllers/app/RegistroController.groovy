package app



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RegistroController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Registro.list(params), model:[registroInstanceCount: Registro.count()]
    }

    def show(Registro registroInstance) {
        respond registroInstance
    }

    def create() {
        respond new Registro(params)
    }

    @Transactional
    def save(Registro registroInstance) {
        if (registroInstance == null) {
            notFound()
            return
        }

        if (registroInstance.hasErrors()) {
            respond registroInstance.errors, view:'create'
            return
        }

        registroInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'registro.label', default: 'Registro'), registroInstance.id])
                redirect registroInstance
            }
            '*' { respond registroInstance, [status: CREATED] }
        }
    }

    def edit(Registro registroInstance) {
        respond registroInstance
    }

    @Transactional
    def update(Registro registroInstance) {
        if (registroInstance == null) {
            notFound()
            return
        }

        if (registroInstance.hasErrors()) {
            respond registroInstance.errors, view:'edit'
            return
        }

        registroInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Registro.label', default: 'Registro'), registroInstance.id])
                redirect registroInstance
            }
            '*'{ respond registroInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Registro registroInstance) {

        if (registroInstance == null) {
            notFound()
            return
        }

        registroInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Registro.label', default: 'Registro'), registroInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'registro.label', default: 'Registro'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
