package app

class Grupo
{
    String nombre
    boolean isAdmin

    static constraints =
    {
        nombre(blank: false)
        isAdmin()
    }
    
    static hasMany = [usuarios:Usuario]
}