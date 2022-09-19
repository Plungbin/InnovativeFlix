public with sharing class AddEpisodes {
    public static addEpisodesSync() {

        List<Season> season = [SELECT Id 
                                FROM Season__c 
                                WHERE Number__c = 1 
                                AND Tv_Serie__r.Name__c = 'The Bold and the Beautiful' 
                                LIMIT 1];

        Season__c season = seasonList.get(0);
        List<Episode__c> episodes = new List<Episode__c>();

        for(Integer i = 1; i <=1000; i++){
            Episode__c episode = new Episode__c(Number__c = i, Season__c = season.Id );
            episodes.add(episode);
        }
        insert(episodes); 
    }
}
