@RestResource(urlMapping='/webhooksdemo/*')
global with sharing class WebhookDemo {
    @HttpPost
    global static void handleChanges(){
            RestRequest request = RestContext.request;
            RestResponse response = RestContext.response; 
            response.statusCode = 200;
            response.responseBody = Blob.valueOf('Success');

            JSONparser parser = JSON.createParser(request.requestBody.toString());
    }
}
