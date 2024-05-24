/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-09-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class PersondetailTriggerHandler {
    public static void PersondetailTriggerHandler(system.TriggerOperation sysTrigger, Map<Id,Persondetail__c> newTriggerMap, Map<Id,Persondetail__c> oldTriggerMap) {
        // Map<Id, Account> accMap=new Map<Id, Account>();
        switch on sysTrigger{
            when BEFORE_UPDATE{
                for(Id persondet: newTriggerMap.keyset()){
                    if(newTriggerMap.get(persondet).Person_phone__c!=oldTriggerMap.get(persondet).Person_phone__c)
                    {
                        newTriggerMap.get(persondet).Description__c='Phone Number is updated from '+oldTriggerMap.get(persondet).Person_phone__c+' to '+newTriggerMap.get(persondet).Person_phone__c;
                    }
                    else if(newTriggerMap.get(persondet).Person_Email__c!=oldTriggerMap.get(persondet).Person_Email__c)
                    {
                        newTriggerMap.get(persondet).Description__c='Mail is updated from '+oldTriggerMap.get(persondet).Person_Email__c+' to '+newTriggerMap.get(persondet).Person_Email__c;
                    }
                    
                    // Id accId=newTriggerMap.get(persondet).Person_EmployeeID__c;
                    // Account acc=[Select Id, Name from Account where Id=:accId];
                    // accMap.put(accId,acc);
                    // accMap.get(accId).Description='Changed Description';
                    // update accMap;
                }
                
            }
            when AFTER_DELETE{
                system.debug('hi');

                // List<Account> accList=new List<Account>();
                // for(Id persondet: oldTriggerMap.keyset()){
                //     Id accId=oldTriggerMap.get(persondet).Person_EmployeeID__c;
                //     system.debug(accId);
                //     Account acc=[select Id,Name from Account where Id=:accId];
                //     accList.add(acc);
                // }
                // delete accList;
            }
            
        }

    }
}