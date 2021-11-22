@RestResource(urlMapping='/webhooksdemo/*')
global with sharing class WebhookDemo {
    @HttpPost
    global static void handleChanges(){
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response; 

        Map<String,Object> mapResponse = (Map<String,Object>)JSON.deserializeUntyped(request.requestBody.toString());
        List<Object> commitObj = (List<Object>)mapResponse.get('commits');
        Map<String,Object> commitMap = (Map<String,Object>)commitObj[0];
        Map<String,Object> committerDetails = (Map<String,Object>)commitMap.get('committer');

        String dat = commitMap.get('timestamp').toString();
        DateTime dateTim = (DateTime)Json.deserialize('"'+dat+'"', DateTime.class);  

        GitPushEvent__c gitRecord = new GitPushEvent__c();
        gitRecord.Committer_Name__c = committerDetails.get('name').toString();
        gitRecord.Committer_Email__c = committerDetails.get('email').toString();
        gitRecord.Commit_Message__c = commitMap.get('message').toString();
        gitRecord.Committed_URL__c = commitMap.get('url').toString();
        gitRecord.Committed_Timestamp__c = dateTim;
        insert gitRecord;

        response.statusCode = 200;
        response.responseBody = Blob.valueOf('Success');
    }
}
