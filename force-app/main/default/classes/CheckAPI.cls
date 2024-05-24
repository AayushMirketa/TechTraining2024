/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-09-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class CheckAPI {
    public static void CheckAPI() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://gorest.co.in/public/v2/users/6897445');
        request.setMethod('DELETE');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setHeader('Authorization', 'Bearer e736f7ff24ffc6319e424da30bc1eb9822ce8072834f8392b3ce0bbdbcadfcf8');
        // request.setBody('{"name":"A Gupta","email":"devang@gmail.com","gender":"male","status":"inactive"}');
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if(response.getStatusCode() < 200 || response.getStatusCode()>300) {
            System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }


    }
}