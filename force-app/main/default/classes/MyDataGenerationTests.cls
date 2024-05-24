/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-17-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
private class MyDataGenerationTests {
    @TestSetup
    static void MyDataGenerationTests (){
        List<sObject> accTestList= Test.loadData(Account.SObjectType, 'otherAccountData');

    }
    @isTest
    static void testLoadOtherAccountsFromStaticResource(){
        List<Account> accList=[Select Id, Name from Account];
        Assert.areEqual(15,accList.size());
    }
    
}