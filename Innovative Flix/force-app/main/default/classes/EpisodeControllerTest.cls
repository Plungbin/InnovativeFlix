@isTest
private with sharing class EpisodeControllerTest {
    @isTest static void getEpisodesTest() {
        Tv_Serie__c  serie = TestDataFactory.getSerie('Test', 'family');
        insert serie;

        Season__C season1 = TestDataFactory.getSeason(serie, 1);
        insert season1;

        Episode__c episode1 = TestDataFactory.getEpisode(season1, 1);
        Episode__c episode2 = TestDataFactory.getEpisode(season1, 2);
        insert episode1;
        insert episode2;

        String seasonId = String.valueOf(season1.Id);

        Test.startTest();
        List<Episode__c> episodeList = EpisodeController.getEpisodes(seasonId);
        Test.stopTest();

        System.assertEquals(2, episodeList.size());
    }
}