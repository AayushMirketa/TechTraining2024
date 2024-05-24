/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-06-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class StringArrayTest {
    public static List<string> generateStringArray(integer n) {
        List<string> testString=new List<string>();
        for(integer start=0;start<n;start++)
        {
            testString.add('Test '+start);
        }
        System.debug(testString);
        return testString;
    }

    // public static void triggerHandler(List<Account> oldTrigger, List<Account> newTrigger){

    //     if(Trigger.isinsert)
    //     {
    //         if(Trigger.isbefore)
    //         {
    //             for(Account a:newTrigger)
    //             {
    //                 a.rating='Hot';
    //             }
    //         }
    //     }
    //     if(Trigger.isupdate)
    //     {

    //         for(Account a:oldTrigger)
    //         {
    //             a.rating='Hot';
    //         }

    //     }
    //}
}