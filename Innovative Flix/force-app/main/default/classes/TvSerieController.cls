public with sharing class TvSerieController {

    public String serieId{get;set;}
    public Tv_Serie__c serieObj{get;set;}
    public TvSerieController(){
        serieObj = new Tv_Serie__c();
    }

    @AuraEnabled(cacheable = true)
    public static List<Tv_Serie__c> getSeries() {

        return[SELECT Id, Name__c FROM  Tv_Serie__c];

    }
    @AuraEnabled(cacheable = true scope='global')
    public static List<Tv_Serie__c> getSerieSearch(String searchTerm){
        searchTerm = searchTerm.trim();
        
        if(searchTerm == ''){
            return[SELECT Id, Name__c, Logo_URL__c FROM  Tv_Serie__c];
        }
        searchTerm = '%' + searchTerm + '%';
        return [SELECT Id, Name__c, Logo_URL__c FROM  Tv_Serie__c WHERE Name__c LIKE :searchTerm];
        
    }

    @AuraEnabled(cacheable = true)
    public static void deleteTvSerie(String tvSerieId){
        
        List<Tv_Serie__c> tvSerieList = [SELECT Id FROM Tv_Serie__c WHERE Id = :tvSerieId];
        
        DeleteTvSerieBatch bc = new DeleteTvSerieBatch(tvSerieList);
		database.executeBatch(bc);
    }


}