package pruebaSeguridad



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.plugins.jasper.JasperExportFormat
import org.codehaus.groovy.grails.plugins.jasper.JasperReportDef

@Transactional//(readOnly = true)
class TicketController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    
   def springSecurityService
   def ticketService
   
    def index(Integer max) {
        
        params.max = Math.min(max ?: 10, 100)
        respond Ticket.list(params), model:[ticketInstanceCount: Ticket.count()]
    }

    def show(Ticket ticketInstance) {
        respond ticketInstance
    }

    def create() {
        respond new Ticket(params)
    }

    @Transactional
    def save(Ticket ticketInstance) {
        if (ticketInstance == null) {
            notFound()
            return
        }

        if (ticketInstance.hasErrors()) {
            respond ticketInstance.errors, view:'create'
            return
        }
        def us = springSecurityService.currentUser.username
        ticketInstance.registradoPor = Usuario.findByUsername(us)
        ticketInstance.estatus = Estatus.get(1 as long)
        ticketInstance.save flush:true
        def inf = ticketService.guardarFlujo(us,1,ticketInstance)
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ticket.label', default: 'Ticket'), ticketInstance.id])
                redirect ticketInstance
            }
            '*' { respond ticketInstance, [status: CREATED] }
        }
    }

    def edit(Ticket ticketInstance) {
        respond ticketInstance
    }

    @Transactional
    def update(Ticket ticketInstance) {
        if (ticketInstance == null) {
            notFound()
            return
        }

        if (ticketInstance.hasErrors()) {
            respond ticketInstance.errors, view:'edit'
            return
        }

        ticketInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Ticket.label', default: 'Ticket'), ticketInstance.id])
                redirect ticketInstance
            }
            '*'{ respond ticketInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Ticket ticketInstance) {

        if (ticketInstance == null) {
            notFound()
            return
        }

        ticketInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Ticket.label', default: 'Ticket'), ticketInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'ticket.label', default: 'Ticket'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    def asignar (){
        def data = [:]
        data.tickets = ticketService.obtenerTickets("SinAsignar" , springSecurityService.currentUser.username)
        data.usuarios = ticketService.obtenerUsuarios( springSecurityService.currentUser.username)
        println "D A T A :::::::::::::::::::::::::::"+data
        render (view:"asignar", model: [detalle: data])
        
    }
     def asignarTicket (){
        def ticket = Ticket.get(params.ticket as long)
        ticket.asignadoA = Usuario.get(params.asignadoA as long )
        ticket.estatus = Estatus.get(2 as long)
        ticket.fechaAsignacion = new Date()
        ticket.save()
        def gf = ticketService.guardarFlujo(springSecurityService.currentUser.username,2,ticket)
    }
    
   def listarAsignados(){
       def tickets = ticketService.obtenerTickets("Asignados",springSecurityService.currentUser.username)
       println "/////////////////////////////   " + tickets 
       render (view:"listarAsignados", model: [asignados: tickets])
    }
    
    def detalleRevisar(){
        def respuesta = Ticket.get(params.id as long )
        render (view:"detalleRevisar", model: [detalle: respuesta])
    }
   
    
    def printReport(){
     println params
     def mapa = []
     def datos= Ticket.get(params.idTicket as long)
     def respuesta = [:]
     respuesta.folio=datos.folio
     respuesta.estatus=datos.estatus
     respuesta.descripcion= datos.descripcion
     respuesta.fechaRegistro=datos.fechaRegistro
     respuesta.registradoPor=datos.registradoPor.username
     mapa<<respuesta
     println mapa
     params._format="PDF"
     
      
       chain(controller:"jasper",action:"index",model:[data:mapa], params :params)
     
    }
}
