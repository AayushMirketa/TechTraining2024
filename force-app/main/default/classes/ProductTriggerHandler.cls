/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-10-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class ProductTriggerHandler {
    public static void ProductTriggerHandlerUpdate(system.TriggerOperation sysTrigger, List<Product2> newTrigger) {
        List<New_Product_Entry__e> npeList=new List<New_Product_Entry__e>();
        switch on sysTrigger{
            when AFTER_INSERT{
                for(Product2 prod : newTrigger){
                    New_Product_Entry__e npe= New New_Product_Entry__e();
                    npe.Product_Name__c=prod.Name;
                    npe.Product_ID__c=prod.Id;
                    npe.Product_Price__c=prod.Product_Price__c;
                    npe.Product_Cateogry__c=prod.Family;
                    npeList.add(npe);
                    // insert npe;
                }
                system.debug('--npeLisy--'+npeList);
                List<Database.SaveResult> results= EventBus.publish(npeList);
            }
        }

    }
}