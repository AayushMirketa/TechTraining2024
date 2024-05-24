/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-17-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public inherited sharing class InheritedSharing {
	public static void performDML() {
        Account a = [Select Id from Account where Name = 'System Admin Created' LIMIT 1];
        Contact con=new Contact();
        con.LastName='Check';
        con.AccountId=a.Id;
        insert con;
    }
}