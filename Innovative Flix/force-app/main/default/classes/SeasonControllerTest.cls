@isTest
private with sharing class SeasonControllerTest {
    @isTest static void getSeasonsTest() {
        Tv_Serie__c  serie = TestDataFactory.getSerie('Test', 'family');
        insert serie;

        Season__C season1 = TestDataFactory.getSeason(serie, 1);
        Season__C season2 = TestDataFactory.getSeason(serie, 2);
        insert season1;
        insert season2;

        String serieId = String.valueOf(serie.Id);

        Test.startTest();
        List<Season__c> seasonList = SeasonController.getSeasons(serieId);
        Test.stopTest();

        System.assertEquals(2, seasonList.size());

    }
}