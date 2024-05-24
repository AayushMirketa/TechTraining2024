@RestResource(urlMapping='/Cases/*')
global with sharing class CaseManager {
    @HttpGet
    global static Case getCaseById(){
        RestRequest request= RestContext.request;
        String caseId=request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Case result=[SELECT Id,CaseNumber,Subject,Status,Origin,Priority FROM Case WHERE Id=:caseId];
        return result;
    }
    @HttpPost
    global static Id createCase(String subject, String status, String origin, String priority){
        Case newCase=new Case(Subject=subject,
                Status=status,
                Origin=origin,
                Priority=priority
                )
        insert newCase;
        return newCase.Id;
    }
}