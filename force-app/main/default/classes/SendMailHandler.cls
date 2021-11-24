public class SendMailHandler {
    public static void sendMail(List<GitPushEvent__c> pushEventsList){
        
        Contact con = [Select Id from Contact where Name='Hari Rubesh'];
        pushEventsList[0].Contact__c = con.Id;
        
        String pushId = pushEventsList[0].Id;
        //String contactId = pushEventsList[0].Contact__c;
        System.debug(pushId);
        System.debug(con.Id); 
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        Id templateId = [select id from EmailTemplate where DeveloperName='CommitterEmailTemplate'].id;
        mail.setTemplateId(templateId);
        mail.setWhatId(pushId);  //push recordId
		mail.setTargetObjectId(con.Id); //contact recordId
        mail.setSaveAsActivity(false);
        //mail.setTreatBodiesAsTemplate(true);
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
    }
}