package pruebaSeguridad

class Ticket {

    String descripcion
    Date fechaRegistro = new Date()
    String folio
    Estatus estatus 
    Usuario registradoPor
    Usuario asignadoA
    Date fechaAsignacion // = new Date()
    
    static constraints = {
        descripcion blank: false
        estatus (nullable: true)
        folio blank: false
        registradoPor (nullable: true)
        asignadoA  (nullable: true)
        fechaAsignacion  (nullable: true)
        estatus defaultValue: 'Nuevo'
    }
    
    static mapping = {
        
        id generator: 'sequence', column: 'id_ticket', params:[sequence:'sec_id_ticket']
        
    }
    
    String toString () {
        "${descripcion}"     
        "${folio}"     
    }
}
