package flujo

import grails.transaction.Transactional
import static org.springframework.http.HttpStatus.*
import pruebaSeguridad.*

@Transactional
class TicketService {
    def springSecurityService
    
    def obtenerTickets(def tipo , def usuario) {
        def datos = []
        if (tipo == 'SinAsignar'){
            def consulta = Ticket.executeQuery("SELECT t FROM Ticket t WHERE t.estatus = :estatus AND t.registradoPor = :user ",[estatus: Estatus.get(1 as long) , user: Usuario.findByUsername(usuario) ])
            consulta.each{
                def ticket = [:]
                ticket.id = it.id
                ticket.folio = it.folio
                ticket.fechaRegistro = it.fechaRegistro
                datos << ticket
            }
            return datos
        }else if(tipo == "Asignados"){            
            consulta = Ticket.executeQuery("SELECT t FROM Ticket t WHERE t.estatus = :estatus AND t.asignadoA = :user ",[estatus: Estatus.get(2 as long) , user: Usuario.findByUsername(usuario) ])
            consulta.each{
                def ticket = [:]
                ticket.id = it.id
                ticket.folio = it.folio
                ticket.descripcion = it.descripcion
                ticket.fechaAsignacion = it.fechaAsignacion
                ticket.registradoPor = it.registradoPor
                datos << ticket
            }
            return datos
        }
    }
    def obtenerUsuarios(def usuario){
        def datos = []
        def consulta = Usuario.executeQuery("SELECT u FROM Usuario u Where u.username <> '$usuario'")
        consulta.each{
            def user =[:]
            user.id = it.id
            user.username = it.username
            datos << user
        }
        return datos 
    }
    
     def guardarFlujo(def usuario , def estatus , def folio){
        
        def flujo = new Flujo ()
        flujo.usuarioMovimiento = Usuario.findByUsername(usuario)
        flujo.ticket = folio
        flujo.estatus = Estatus.get(estatus as long)
        flujo.save()
        println "46 ::::::::  " + flujo
    }
    
}
