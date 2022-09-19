public with sharing class TvSerieDeleteQueueable implements Queueable{
    
    private List<Tv_Serie__c> tvSerieList;
    
    
    public TvSerieDeleteQueueable(List<Tv_Serie__c> tvSerie) {
        this.TvSerieList = tvSerie ;
        
    }

    public void execute(QueueableContext context) {

        Set<Id> tvSerieId = new Set<Id>(new Map<Id, Tv_Serie__c>(TvSerieList).keySet());
        
       List<Season__c> seasonList = [SELECT ID FROM Season__c WHERE Tv_Serie__c =: tvSerieId];
       
       Set<Id> seasonsId = new Set<Id>(new Map<Id, Season__c>(seasonList).keySet());

       List<Episode__c> episodeList = [SELECT ID FROM Episode__c WHERE Season__c =: seasonsId];

       delete episodeList;

       delete seasonList;

       //delete TvSerieList;

       System.enqueueJob(new TvSerieDeleteQueueable2(tvSerieId));
        
    }

}