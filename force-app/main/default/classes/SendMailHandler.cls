public class SendMailHandler {
    public static void sendMail(List<GitPushEvent__c> pushEventsList){
        String email;
        String name;
        for(GitPushEvent__c pushEvent : pushEventsList){
         	email = pushEvent.Committer_Email__c;  
            name = pushEvent.Committer_Name__c;
        }
        System.debug(email);
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        Id templateId = [select id from EmailTemplate where DeveloperName='CommitterEmailTemplate'].id;
        String[] toAddress = new String[] {email}; 
        String subject = 'Handling push events notifications';
        String body = 'Hii ' +name+ ', Welcome to Salesforce...You are integrated with Salesforce successfully.';
        mail.setToAddresses(toAddress);
        mail.setSubject(subject);
        mail.setHtmlBody(body);
        //mail.setTemplateId('2F00X5g000000RI1t');
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
    }
}