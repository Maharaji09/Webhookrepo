public class SendMailHandler {
    public static void sendMail(List<GitPushEvent__c> pushEventsList){
        String pushId = '0055g000006PCUKAA4';     
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        Id templateId = [select id from EmailTemplate where DeveloperName='CommitterEmailTemplate'].id;
        mail.setTemplateId(templateId);
		mail.setTargetObjectId(pushId);
        mail.setSaveAsActivity(false);
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
    }
}