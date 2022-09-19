public with sharing class TriggerSeasonHandler {
    public static void checkDuplicateSeasonNumber(List<Season__c> newListOfSeasons) {

        //Set of Series Ids, where new season is going to be added
        Set<Id> tvSerieIdsSet = new Set<Id>();

        for(Season__c season : newListOfSeasons) {
            tvSerieIdsSet.add(season.Tv_Serie__c);
        }

        //List of season from series, where new season is going to be added
        List<Season__c> oldListOfSeason = [SELECT Number__c, Tv_Serie__c FROM Season__c WHERE Tv_Serie__c IN :  tvSerieIdsSet];

      

        if(!oldListOfSeason.isEmpty()){
            for(Season__c seasonOld : oldListOfSeason){
                for(Season__c seasonNew : newListOfSeasons)
                    if(seasonOld.Number__c == seasonNew.Number__c && seasonOld.Tv_Serie__c == seasonNew.Tv_Serie__c && seasonOld.Id != seasonNew.Id ){
                        seasonNew.addError('Season with this number already exists');
                  }
              }
        }
      }    
}