public with sharing class AddEpisodesToSeason implements Database.Batchable<sObject>, Database.Stateful{

    public Integer count = 0;

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id FROM Season__c WHERE Number__c = 1 AND Tv_Serie__r.Name__c = \'The Bold and the Beautiful\' LIMIT 1'
        );

    }
    public void execute(Database.BatchableContext bc, List<Season__c> seasonList){

        Season__c season = seasonList.get(0);
        List<Episode__c> episodes = new List<Episode__c>();

        for(Integer i = 1; i <=1000; i++){
            Episode__c episode = new Episode__c(Number__c = i, Season__c = season.Id );
            episodes.add(episode);
            count++;
        }
       // try{
            insert(episodes); 
       // }
       // catch(exception e){
       //     system.debug('Exception:'+e.getMessage());
       //    }
        
    }
    public void finish(Database.BatchableContext bc){
        system.debug('total:'+count);
    }
}