public class SendMailHandler {
    public static void sendMail(List<GitPushEvent__c> pushEventsList){
        String pushId = pushEventsList[0].Id;
        String contactId = pushEventsList[0].Contact__c;
        //System.debug(pushId);
        //System.debug(contactId); 
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        Id templateId = [select id from EmailTemplate where DeveloperName='CommitterEmailTemplate'].id;
        mail.setTemplateId(templateId);
        mail.setWhatId(pushId);  //push recordId
		mail.setTargetObjectId(contactId); //contact recordId
        mail.setSaveAsActivity(false);
        //mail.setTreatBodiesAsTemplate(true);
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
    }
}