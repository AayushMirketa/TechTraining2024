/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-10-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AccountTriggerHandler {
    public static void AccountTriggerHandler(System.TriggerOperation sysTrigger, List<Account> newTrigger, List<Account> oldTrigger, Map<Id, Account> oldMap) {

        List<Persondetail__c> perList=new List<Persondetail__c>();
        switch on sysTrigger{
            when AFTER_INSERT{

                for(Account acc:newTrigger)
                {
                    perList.add(new Persondetail__c(Name=acc.Name,
                    Person_phone__c=acc.Phone,
                    Description__c=acc.Description,
                    Person_Email__c=acc.Phone+'@gmail.com',
                    Person_EmployeeID__c=acc.Id,
                    Parent_Account__c=acc.Id
                    ));
                }
                insert perList;
            }

            when AFTER_DELETE{
                
                perList=[select Id, Name from Persondetail__c where Person_EmployeeID__c in :oldMap.keyset()];
                if(perList.size()>0){
                delete perList;
            
                }
            }
        }
    }
    }