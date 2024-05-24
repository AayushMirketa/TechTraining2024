/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-15-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AssignmetQueries {
    public string fieldApiName;
    public string operator;
    public string value;
    public string dataType;

    
    public void populateBind(string apiName,string opr, string val,string type){
        this.fieldApiName=apiName;
        this.operator=opr;
        this.value=val;
        this.dataType=type;
    }

   
    public static List<sObject> yourClass(string sOb, List<AssignmetQueries> conditions){
        string query= 'Select Id from '+ sOb+' where ';
        Map<string,object> nameBind=new Map<string,object>();
        system.debug(conditions);
        for(integer i=0;i<conditions.size();i++){
            query+=conditions[i].fieldApiName+' '+conditions[i].operator+' '+':bind'+i;
            List<string> part=conditions[i].value.split(';');
            if(conditions[i].dataType=='string'){
                nameBind.put('bind'+i,part);
            }
            else{
                List<Integer> intList = new List<Integer>();
                for (String str : part) {
                    intList.add(Integer.valueOf(str));
                }
                nameBind.put('bind'+i,intList);
            }
            if(i<conditions.size()-1){
                query+=' AND ';
            }
            
        }
        system.debug(nameBind);
        List<sObject> res=Database.queryWithBinds(query, nameBind , AccessLevel.USER_MODE);
        system.debug(res);
        return res;

    }

    


    public static void Queries() {
        // Account acc=new Account(Name='New Tech Inc',
        //                         Industry='Technology' ,
        //                         AnnualRevenue=2000000
        //                         );
        // insert acc;
        
        // Contact con=new Contact(FirstName='Emily',
        //                         LastName='Johnson',
        //                         Email='emily.johnson@example.com',
        //                         AccountId=acc.Id
        //                         );
        // insert con;

        // Account acc=[Select Id,AnnualRevenue from Account where Name='New Tech Inc' Limit 1];
        // acc.AnnualRevenue=3000000;
        // update acc;

        // Contact con=[Select Id,Email from Contact where Name='Emily Johnson' Limit 1];
        // con.Email='emily.johnson.updated@example.com';
        // update con;

        // List<Account> accList= [Select Id, Name, Country__c from Account];
        // for(Account acc: accList){
        //     acc.Country__c='India';
        // }
        // accList.add(new Account(Name='New Upsert'));
        // Upsert accList;

        // Contact con=[Select Id,Email from Contact where Name='Emily Johnson' Limit 1];
        // delete con;

        // List<Contact> conList=[Select Id,Email from Contact where Name='Emily Johnson' ALL ROWS];
        // undelete conList;

        // List<Contact> conList=[Select Id,Email from Contact where Name='Emily Johnson' ALL ROWS];
        // Database.undelete(conList,False);


    }
}