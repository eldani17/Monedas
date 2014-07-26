package app

import grails.transaction.Transactional
import groovy.json.*

@Transactional
class MonedasService 
{
    URL url = new URL("http://openexchangerates.org/api/latest.json?app_id=4d7bc29f943f4018b32c151420a88c4b&base=USD");
    Map monedas=[:]   
    
    def MonedasService
    {
        InputStream urlStream = url.openStream();
        BufferedReader reader = new BufferedReader(new InputStreamReader(urlStream));
        JsonSlurper jsonSlurper = new JsonSlurper();
        Object result = jsonSlurper.parse(reader);
        Map jsonResult = (Map) result;
        monedas = (Map) jsonResult.get("rates"); 
        monedas = monedas.sort { it.key }
    }
    
    def getCurrency(String c)
    {
        this.monedas[c]
    }
    
    def getMonedas(Usuario user)
    {                  
        def monedasUsuario=user.monedas.collect()
        Map monedasCombo=this.monedas
        monedasUsuario.each{
            it -> if (monedasCombo.containsKey(it.siglas))
            {
                monedasCombo.remove(it.siglas)                
            }          
        }
        return monedasCombo       
    }   
}