package app

import grails.transaction.Transactional
import groovy.json.*

@Transactional
class MonedasService 
{
    URL url = new URL("http://openexchangerates.org/api/latest.json?app_id=4d7bc29f943f4018b32c151420a88c4b&base=USD");
    Map value=[:]
    List monedas=[]
    
    def MonedasService
    {
        InputStream urlStream = url.openStream();
        BufferedReader reader = new BufferedReader(new InputStreamReader(urlStream));
        JsonSlurper jsonSlurper = new JsonSlurper();
        Object result = jsonSlurper.parse(reader);
        Map jsonResult = (Map) result;
        value = (Map) jsonResult.get("rates");  
        value.each () { k, v -> monedas << v } 
    }
    
    def getCurrency(String c)
    {
        this.value[c]
    }
    
    def getMonedas(String[] siglas)
    {        
        return this.monedas.intersect(siglas)        
    }   
}