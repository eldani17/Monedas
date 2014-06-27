package app

class Usuario
{
    String nombre
    String apellido
    String password
    int dni
    String email

    static constraints =
    {
        nombre(blank:false)
        apellido(blank:false)
        password(blank:false,password:true)
        dni(blank:false, matches: "[/d/d./d/d/d./d/d/d]") //corregir
        email(blank:false, email:true)
    }
    static hasMany=[registros:Registro, monedas:Moneda,grupos:Grupo]
    static belongsTo = Grupo
}
