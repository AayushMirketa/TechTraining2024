/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-09-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger HelloWorldTrigger on Account (after update) {
    // StringArrayTest.triggerHandler(trigger.old,trigger.new);
    system.debug('Hello');

}