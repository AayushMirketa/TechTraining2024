trigger SameEventSpeaker on EventSpeaker__c (before insert, before update) {    
    EventSpeakerHandler.SameSpeaker(trigger.operationType, trigger.new);


}