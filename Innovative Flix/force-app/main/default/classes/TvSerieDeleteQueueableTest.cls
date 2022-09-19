@isTest
public with sharing class TvSerieDeleteQueueableTest {

    @isTest
    static void deleteTvSerieTest(){

        List<Tv_Serie__c> tvSerieList = new List<Tv_Serie__c>();

        Tv_Serie__c serie1 = TestDataFactory.getSerie('Test1', 'family');
        tvSerieList.add(serie1);
        
        insert tvSerieList;
        
        Season__c season1 = TestDataFactory.getSeason(serie1, 1);
        Season__c season2 = TestDataFactory.getSeason(serie1, 2);
        insert season1;
        insert season2;

        Episode__c episode1 = TestDataFactory.getEpisode(season1,1);
        insert episode1;

        List<Episode__c> episodes = new List<Episode__c>();

        for(Integer i = 1 ; i <= 999; i++){

            episodes.add(TestDataFactory.getEpisode(season2, i));

        }
        insert episodes;

        Test.startTest();

        TvSerieDeleteQueueable deleteTvSerie = new TvSerieDeleteQueueable(tvSerieList);
        System.enqueueJob(deleteTvSerie);
        Test.stopTest();

        System.assertEquals(0, [select count() FROM Season__c WHERE Tv_Serie__c = :serie1.Id ]);
        System.assertEquals(0, [select count() FROM Tv_Serie__c ]);

    }   
       
    }