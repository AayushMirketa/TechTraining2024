/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-06-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class ContactSearch {
    public static List<Contact> searchForContacts(string lname, string pcode) {
        List<Contact> contactList= [Select Id,Name from Contact where LastName=:lname AND MailingPostalCode=:pcode WITH SECURITY_ENFORCED];
        return contactList;
    }
}