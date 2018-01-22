package pruebaSeguridad



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional//(readOnly = true)
class EstatusController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Estatus.list(params), model:[estatusInstanceCount: Estatus.count()]
    }

    def show(Estatus estatusInstance) {
        respond estatusInstance
    }

    def create() {
        respond new Estatus(params)
    }

    @Transactional
    def save(Estatus estatusInstance) {
        if (estatusInstance == null) {
            notFound()
            return
        }

        if (estatusInstance.hasErrors()) {
            respond estatusInstance.errors, view:'create'
            return
        }

        estatusInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'estatus.label', default: 'Estatus'), estatusInstance.id])
                redirect estatusInstance
            }
            '*' { respond estatusInstance, [status: CREATED] }
        }
    }

    def edit(Estatus estatusInstance) {
        respond estatusInstance
    }

    @Transactional
    def update(Estatus estatusInstance) {
        if (estatusInstance == null) {
            notFound()
            return
        }

        if (estatusInstance.hasErrors()) {
            respond estatusInstance.errors, view:'edit'
            return
        }

        estatusInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Estatus.label', default: 'Estatus'), estatusInstance.id])
                redirect estatusInstance
            }
            '*'{ respond estatusInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Estatus estatusInstance) {

        if (estatusInstance == null) {
            notFound()
            return
        }

        estatusInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Estatus.label', default: 'Estatus'), estatusInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'estatus.label', default: 'Estatus'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
