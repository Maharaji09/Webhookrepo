trigger SendMail on GitPushEvent__c (after insert) {
    if(trigger.isInsert){
        if(trigger.isAfter){
			List<GitPushEvent__c> pushEventList = Trigger.new;
            SendMailHandler.sendMail(pushEventList);            
        }
    }
}