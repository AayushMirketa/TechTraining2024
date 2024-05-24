/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-13-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger CurrencyConversionTrigger on Currency_Conversion__c (before insert) {
    switch on trigger.operationType{
        when BEFORE_INSERT{
            List<string> nameList=new List<string>();
            for(Currency_Conversion__c curr: trigger.new){
                nameList.add(curr.name);
            }
            CurrencyConversion.CurrencyConversion(nameList);
        }
    }
    // CurrencyConversion.CurrencyConversion(trigger.operationType, trigger.new);

}