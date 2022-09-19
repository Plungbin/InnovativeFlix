public with sharing class EpisodeTriggerHandler {
    public static void checkDuplicateEpisodeNumber(List<Episode__c> newListOfEpisodes) {

        //Set of Seasons Ids, where new episodes is going to be added
        Set<Id> seasonIdsSet = new Set<Id>();

        for(Episode__c episode : newListOfEpisodes) {
            seasonIdsSet.add(episode.Season__c);
    
    	}
        //List of episodes from seasons, where new episode is going to be added
        List<Episode__c> oldListOfEpisodes = [SELECT Number__c, Season__c FROM Episode__c WHERE Season__c IN :  seasonIdsSet];
        
        
        if(!oldListOfEpisodes.isEmpty()){
            for(Episode__c episodeOld : oldListOfEpisodes){
                for(Episode__c episodeNew : newListOfEpisodes)
                    if(episodeOld.Number__c == episodeNew.Number__c && episodeOld.Season__c == episodeNew.Season__c && episodeOld.Id != episodeNew.Id ){
                        episodeNew.addError('Episode with this number already exists');
                    }
            }  
        }
    }
}