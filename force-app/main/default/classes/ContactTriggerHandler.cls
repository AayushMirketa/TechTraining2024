/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-12-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class ContactTriggerHandler {


    public static void ContactTriggerCountHandler(system.TriggerOperation sysTrigger, List<Contact> newTrigger, List<Contact> oldTrigger, Map<Id,Contact> oldMap) {
        Set<Id> accId=new Set<Id>();

        Map<Id, integer> conCount=new Map<Id, integer>();

        switch on sysTrigger{
            when AFTER_INSERT{
                for(Contact con: newTrigger){
                    accId.add(con.AccountId);
                }
                List<AggregateResult> aggRes=[select AccountId,count(id)countCon from Contact where AccountId in:accId group by AccountId];
                for(AggregateResult agg: aggRes){
                    Id accntId=(Id)agg.get('AccountId');
                    integer count=(integer)agg.get('countCon');
                    conCount.put(accntId,count);
                }
                List<Account> accList = [select Id,name,Count_Contact__c from Account where id in :accId];
                for(Account acc:accList){
                    acc.Count_Contact__c=conCount.get(acc.Id);
                }
                update accList;
            }
            when AFTER_UPDATE{
                for(Contact con: newTrigger){
                    if(con.AccountId!=oldMap.get(con.Id).AccountId){
                        accId.add(con.AccountId);
                        accId.add(oldMap.get(con.Id).AccountId);
                    }
                }
                List<AggregateResult> aggRes=[select AccountId,count(id)countCon from Contact where AccountId in:accId group by AccountId];
                for(AggregateResult agg: aggRes){
                    Id accntId=(Id)agg.get('AccountId');
                    integer count=(integer)agg.get('countCon');
                    conCount.put(accntId,count);
                }
                
                List<Account> accList = [select Id,name,Count_Contact__c from Account where id in :accId];
                for(Account acc:accList){
                    acc.Count_Contact__c=conCount.get(acc.Id);
                }
                update accList;
            }
            when AFTER_DELETE{
                for(Contact con: oldTrigger){
                    accId.add(con.AccountId);
                }
                List<AggregateResult> aggRes=[select AccountId,count(id)countCon from Contact where AccountId in:accId group by AccountId];
                for(AggregateResult agg: aggRes){
                    Id accntId=(Id)agg.get('AccountId');
                    integer count=(integer)agg.get('countCon');
                    conCount.put(accntId,count);
                }
                List<Account> accList = [select Id,name,Count_Contact__c from Account where id in :accId];
                for(Account acc:accList){
                    acc.Count_Contact__c=conCount.get(acc.Id);
                }
                update accList;
            }
        }

    }
}