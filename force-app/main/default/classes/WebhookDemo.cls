@RestResource(urlMapping='/webhooksdemo/*')
global with sharing class WebhookDemo {
    @HttpPost
    global static void handleChanges(){
            RestRequest request = RestContext.request;
            RestResponse response = RestContext.response; 

            JSONparser parser = JSON.createParser(request.requestBody.toString());
            String repo;
            if(parser.nextToken() != null){
                if(parser.getText() == 'full_name'){
                    parser.nextToken();
                    repo = parser.getText();
                }
            }
            GitPushEvent__c gitRecord = new GitPushEvent__c();
            gitRecord.Name = 'gitRecord';
            gitRecord.Repository_Name__c = repo;
            insert gitRecord;

            response.statusCode = 200;
            response.responseBody = Blob.valueOf('Success');
    }
}
