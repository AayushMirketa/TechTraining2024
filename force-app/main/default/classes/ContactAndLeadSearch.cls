/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-05-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class ContactAndLeadSearch {
    public static List<List< sObject>> searchContactsAndLeads(string name) {
        List<List<sObject>> searchList=[FIND :name IN NAME FIELDS RETURNING Contact, Lead]; 
        return searchList;

    }
}