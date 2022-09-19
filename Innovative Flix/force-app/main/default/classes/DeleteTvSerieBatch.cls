public with sharing class DeleteTvSerieBatch implements Database.Batchable<sObject>, Database.Stateful{
    

    List<Tv_Serie__c> tvSerieList = new List<Tv_Serie__c>();
    public DeleteTvSerieBatch(List<Tv_Serie__c> tvSerie){
        tvSerieList = tvSerie;
    }
    
    public List<Tv_Serie__c> start(Database.BatchableContext bc) {
        
        return tvSerieList;
    }

    public void execute (Database.BatchableContext bc, List<Tv_Serie__c> tvSerieList){

        List<Season__c> seasonList = [SELECT Id FROM Season__c WHERE TV_Serie__c = :tvSerieList];
        List<Episode__c> episodeList = [SELECT Id FROM Episode__c WHERE Season__c = :seasonList];
        
        delete episodeList;
        delete seasonList;
        delete tvSerieList;

    }
    public void finish(Database.BatchableContext bc){
    }
}