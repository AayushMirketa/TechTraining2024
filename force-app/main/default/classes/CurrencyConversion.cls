/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-13-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class CurrencyConversion {
    @future(callout=true)
    public static void CurrencyConversion(List<string> nameList) {
        List<Currency_Conversion__c> currList=[Select From__c,To__c,From_Amount__c from Currency_Conversion__c where Name in :nameList];
        for(Currency_Conversion__c curr:currList){
            Http http=new Http();
            HttpRequest request= new HttpRequest();
            string fromCode=curr.From__c;
            string toCode=curr.To__c;
            integer fromAmount=(integer)curr.From_Amount__c;
            string endpoint='https://currency-conversion-and-exchange-rates.p.rapidapi.com/convert?from='+fromCode+'&to='+toCode+'&amount='+fromAmount;
            request.setEndpoint(endpoint);
            request.setMethod('GET');
            request.setHeader('X-RapidAPI-Key','99948307a9msh2e7a30196f4448bp132fb1jsn250d0ac46385');
            request.setHeader('X-RapidAPI-Host','currency-conversion-and-exchange-rates.p.rapidapi.com');
            HttpResponse response= http.send(request);
            if(response.getStatusCode()!=200){
                system.debug('The status code returned was not expected: '+ response.getStatusCode()+' '+response.getStatus());
            }
            else{
                Map<string,object> jsonResponse=(Map<string,object>) JSON.deserializeUntyped(response.getBody());
                curr.To_Amount__c=(Decimal)jsonResponse.get('result');
                system.debug(curr.To_Amount__c);
            }
        }
        update currList;
        
        
    

        
    }
}