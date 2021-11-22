@RestResource(urlMapping='/webhooksdemo/*')
global with sharing class WebhookDemo {
    @HttpPost
    global static void handleChanges(){
            RestRequest request = RestContext.request;
            RestResponse response = RestContext.response; 
            System.debug(request.requestBody);
            response.responseBody = Blob.valueOf('Success');
    }
}
