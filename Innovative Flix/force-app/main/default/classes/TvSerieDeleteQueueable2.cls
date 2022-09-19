public with sharing class TvSerieDeleteQueueable2 implements Queueable{

private Set<Id> tvSerieId;

public TvSerieDeleteQueueable2(Set<Id> tvSerieId) {
    this.tvSerieId = tvSerieId ;

}
public void execute(QueueableContext context){
    delete [SELECT Id FROM Tv_serie__c WHERE Id =:tvSerieId ];
    
    // private List<Tv_Serie__c> tvSerieList;

    // public TvSerieDeleteQueueable2(List<Tv_Serie__c> tvSerie) {
    //     this.TvSerieList = tvSerie ;

    // }
    // public void execute(QueueableContext context){
    //     delete tvSerieList;
    // }
}

}