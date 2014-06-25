package app

import grails.transaction.Transactional
import groovy.json.*

@Transactional
class MonedasService 
{
    URL url = new URL("http://openexchangerates.org/api/latest.json?app_id=4d7bc29f943f4018b32c151420a88c4b&base=USD");
    def value
    def getcurrency(String c)
    {
        InputStream urlStream = null;
        try 
        {
            urlStream = url.openStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(urlStream));
            JsonSlurper jsonSlurper = new JsonSlurper();
            Object result = jsonSlurper.parse(reader);
            Map jsonResult = (Map) result;
            Map currency = (Map) jsonResult.get("rates");
            this.value = currency[c]
        }
        finally 
        {
            if (urlStream != null)
            {
                urlStream.close();
            }
        }
        this.value
    }
}