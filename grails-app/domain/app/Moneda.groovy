package app

class Moneda 
{
    String siglas
    Float valorActual

    static constraints = 
    {
        siglas(blank:false)
        valorActual(blank:false)
    } 
    static belongsTo=[usuario:Usuario]        
}