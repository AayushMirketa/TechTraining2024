@IsTest
private class AccountWrapperTests {
  @TestSetup
  static void loadTestData() {
    // GIVEN
    Account acct = new Account(Name = 'ACME');
    insert acct;
    List<Opportunity> opps = TestFactory.generateOppsForAccount(acct.id, 20000000.00, 5);
    insert opps;
  }
  @IsTest
  static void testPositiveRoundedAveragePrice() {
    // WHEN
    Account acct = [SELECT Id FROM Account LIMIT 1];
    AccountWrapper acctWrapper = new AccountWrapper(acct);
    // THEN
    Test.startTest();
      Assert.areEqual(
        acctWrapper.getRoundedAvgPriceOfOpps(),
        1000.00,
        'Expected to get 1000.00');
    Test.stopTest();
  }
  @IsTest
  static void testIsHighPriority(){
    Account act= [SELECT id from Account Limit 1];
    AccountWrapper actWrap= new AccountWrapper(act);

    Test.startTest();
    Assert.areEqual(actWrap.isHighPriority(),false,'Expected to get False');
    Test.stopTest();
  }

}