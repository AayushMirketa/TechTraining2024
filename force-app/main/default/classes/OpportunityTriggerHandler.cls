/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-07-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class OpportunityTriggerHandler {
    public static void OpportunityTriggerHandler(System.TriggerOperation sysTrigger, List<Opportunity> newTrigger) {

        List<Task> taskList=new List<Task>();

        switch on sysTrigger{
            when AFTER_INSERT{
                for(Opportunity opp:newTrigger)
                {
                    if(opp.StageName=='Closed Won')
                    {
                        taskList.add(new Task(WhatId=opp.Id,
                                                Subject='Follow Up Test Task'

                        ));
                    }
                }
            }
        
            when AFTER_UPDATE{
                for(Opportunity opp:newTrigger)
                {
                    if(opp.StageName=='Closed Won')
                    {
                        integer a=[select WhatId from task where WhatId=:opp.Id].size();
                        if(a<1){

                        taskList.add(new Task(WhatId=opp.Id,
                                                Subject='Follow Up Test Task'

                        ));
                        }
                    }
                }
            }
        }

        if(taskList.size()>0)
        {
            insert taskList;
        }
    }

    }