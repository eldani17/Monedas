package app

class Registro 
{   
    Float cambio
    Date fechaActualizacion
    String siglas

    static constraints =
    {
        cambio(blank:false, scale:2)
        fechaActualizacion(blank:false)
        siglas(blank:false)        
    }
    static belongsTo=Usuario    
}