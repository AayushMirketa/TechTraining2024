public with sharing class ErrorLogInsertion {
    public static void LogInsertion(DateTime logDateTime, string logDetails, string processName) {

        Error_Log__c errorLog = new Error_Log__c(
            Log_DateTime__c=logDateTime,
            Log_Details__c=logDetails,
            Process_Name__c=processName
        );
        try{
            insert errorLog;
        }
        catch(Exception e){
            system.debug('Error occured while inserting Error Log'+e.getMessage());
        }

    }
}