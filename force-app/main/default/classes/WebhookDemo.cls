@RestResource(urlMapping='/webhooksdemo/*')
global with sharing class WebhookDemo {
    @HttpPost
    global static void handleChanges(){
            RestRequest request = RestContext.request;
            RestResponse response = RestContext.response; 

            JSONparser parser = JSON.createParser(request.requestBody.toString());
            Committ committ;
            //String repo;
            if(parser.nextToken() != null){
                if(parser.getText() == 'commits'){
                   // parser.nextToken();
                    committ = (Committ)parser.readValueAs(Committ.class);
                }
              /*   if(parser.getText() == 'full_name'){
                    repo = parser.getText();
                }    */
            }
            GitPushEvent__c gitRecord = new GitPushEvent__c();
           // gitRecord.Name = 'gitRecord';
           // gitRecord.Repository_Name__c = repo;
            gitRecord.Committer_Name__c = committ.name;
            gitRecord.Committer_Email__c = committ.email;
            insert gitRecord;

            response.statusCode = 200;
            response.responseBody = Blob.valueOf('Success');
        } 
    public class Committ{
        public String name;
        public String email;
        public String url;
        public String commitMessage;
        public String addedComp;
        public String removedComp;
        public String modifiedComp;

        public Committ(String name, String email, String url, String commitMessage, String addedComp, String removedComp, String modifiedComp){
            this.name = name;
            this.email = email;
            this.url = url;
            this.commitMessage = commitMessage;
            this.addedComp = addedComp;
            this.removedComp = removedComp;
            this.modifiedComp = modifiedComp;
        }
    }

}
