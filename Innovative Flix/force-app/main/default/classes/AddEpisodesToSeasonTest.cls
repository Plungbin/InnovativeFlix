@isTest
public with sharing class AddEpisodesToSeasonTest {
    @isTest
    static void addepisodesTest() {

        Tv_Serie__c serie = TestDataFactory.getSerie('The Bold and the Beautiful', 'comedy');
        insert serie;
        Season__c season = TestDataFactory.getSeason(serie, 1);
        insert season;

        
        Test.startTest();
        AddEpisodesToSeason episodes = new AddEpisodesToSeason();
        Id batchId = Database.executeBatch(episodes);
        Test.stopTest();

        System.assertEquals(1000, [SELECT count() FROM Episode__c WHERE Season__c =: season.Id]);

    }
}