public class SendMailHandler {
    public static void sendMail(List<GitPushEvent__c> pushEventsList){
        String name = pushEventsList[0].Committer_Name__c;
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        EmailTemplate emailTemplate = [Select Id, Subject, HtmlValue, Body from EmailTemplate where DeveloperName='CommitterEmailTemplate'];
        String body = emailTemplate.Body;
        body = body.replace('{!GitPushEvent__c.Committer_Name__c}', name);
        mail.setSubject(emailTemplate.Subject);
        mail.setPlainTextBody(body);
        mail.setTargetObjectId('0055g000006PCUKAA4');
        mail.setSaveAsActivity(false);
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail}); 
    }
}