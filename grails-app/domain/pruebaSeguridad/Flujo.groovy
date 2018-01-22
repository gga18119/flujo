package pruebaSeguridad

class Flujo {
    Usuario usuarioMovimiento
    Ticket ticket
    Estatus estatus
    Date fechaMovimiento = new Date()
   
    static constraints = {
    }
    
     static mapping = {
        
        id generator: 'sequence', column: 'id_flujo', params:[sequence:'sec_id_flujo']
        
    }
}
