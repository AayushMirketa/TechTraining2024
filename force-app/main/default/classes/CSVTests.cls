/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-17-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@IsTest
private class CSVTests {
  @TestSetup
  static void loadTestDataFromStaticResource() {
    // GIVEN
    List<sObject> accounts = Test.loadData(Account.SObjectType, 'accountData');
  }
  @IsTest
  static void testLoadAccountsFromStaticResources() {
    // WHEN
    List<Account> accts = [SELECT ID FROM Account];
    // THEN
    Assert.isTrue(accts.size() == 3, 'Expected 3 accounts');
  }
}