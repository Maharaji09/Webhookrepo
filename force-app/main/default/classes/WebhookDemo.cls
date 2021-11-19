@RestResource(urlMapping='/webhooksdemo/*')
global with sharing class WebhookDemo {
    @HttpPost
    global static void handleChanges(){
        try{
            RestRequest request = RestContext.request;
            RestResponse response = RestContext.response; 
        }
        catch(Exception e){
            System.debug('Exception occured'+e.getMessage());
        }
    }
}
