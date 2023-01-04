abstract class NewsState{}
class InisaliesState extends NewsState{}

class ChingBottonNaveStat extends NewsState{}

class ChingDarkModeStat extends NewsState{}

class NewsgetbusenesLoadingState extends NewsState{}
class NewsgetbusenesScsefalState extends NewsState{}
class NewsgetbusenesErorrState extends NewsState{
  final String erorr ;
  NewsgetbusenesErorrState(this.erorr);
}



class NewsgetSportsLoadingState extends NewsState{}
class NewsgetSportsScsefalState extends NewsState{}
class NewsgetSportsErorrState extends NewsState{
  final String erorr ;
  NewsgetSportsErorrState(this.erorr);



}




class NewsgetScineceLoadingState extends NewsState{}
class NewsgetScineceScsefalState extends NewsState{}
class NewsgetScineceErorrState extends NewsState{
  final String erorr ;
  NewsgetScineceErorrState(this.erorr);



}

class NewsgetSersheLoadingState extends NewsState{}
class NewsgetSersheScsefalState extends NewsState{}
class NewsgetSersheErorrState extends NewsState{
  final String erorr ;
  NewsgetSersheErorrState(this.erorr);
}