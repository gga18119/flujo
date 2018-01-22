package pruebaSeguridad

class Estatus implements Serializable{
    
    String tipo_estatus
    
    static mapping = {
        id generator: 'sequence', column: 'id_estatus', params:[sequence:'sec_id_estatus']
    }
    static constraints = {
        tipo_estatus blank: false
    }
    
    String toString () {
        "${tipo_estatus}"     
    }
}