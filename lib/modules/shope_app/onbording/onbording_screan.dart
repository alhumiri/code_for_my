import 'package:alhumiri_frist_project/Shared/componens/componens.dart';
import 'package:alhumiri_frist_project/Shared/network/local/cache_helper.dart';
import 'package:alhumiri_frist_project/Shared/stylses/steles.dart';
import 'package:alhumiri_frist_project/layout/news/cubit/steats.dart';
import 'package:alhumiri_frist_project/modules/shope_app/shope_login/cubitforlogin/cubit.dart';
import 'package:alhumiri_frist_project/modules/shope_app/shope_login/shope_login.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class BordingModel{
  final String image;
  final String titel;
  final String body;
  BordingModel({
    required this.image,
    required this.titel,
    required this.body,});

}

class BordingScrean extends StatefulWidget {
  @override
  State<BordingScrean> createState() => _BordingScreanState();

}

class _BordingScreanState extends State<BordingScrean> {
  List< BordingModel> bordinmodel=[
    BordingModel(
      image: 'assets/images/onbording2.png',
      titel: 'on bording titel',
      body: 'onbording bode',),
    BordingModel(
      image: 'assets/images/onbording1.png',
      titel: 'on bording titel',
      body: 'onbording bode',),
    BordingModel(
      image: 'assets/images/onbording3.png',
      titel: 'on bording titel',
      body: 'onbording bode',),
  ];

  var pageViewControler=PageController();
  bool islast=false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          defultTextBoutton(function: (){
            onSubmit();
           },
            text: 'skipe',

          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(

          children: [

           Expanded(
             child: PageView.builder(
               controller: pageViewControler,
               physics: BouncingScrollPhysics(),
               onPageChanged: (index){
                 if(bordinmodel.length-1==index){
                   islast=true;
                 }
                 else{islast=false;}
               },
               itemBuilder:(context,index)=>buluditame(bordinmodel[index]),
             itemCount: bordinmodel.length,),
           ),
            SizedBox(height: 40,),
            Row(
              children: [
              SmoothPageIndicator(
                effect: ExpandingDotsEffect(
                  activeDotColor: defultColor,
                  dotColor: Colors.blueGrey,
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 5,
                  expansionFactor: 4,

                ),
                  controller: pageViewControler,
                  count: bordinmodel.length),
                Spacer(),
                FloatingActionButton(onPressed: (){
                  if(islast){
                    onSubmit();
                  }
                  else{
                    pageViewControler.nextPage(duration: Duration(
                      milliseconds: 750,
                    ), curve: Curves.fastLinearToSlowEaseIn);
                  }


                },child: Icon(Icons.arrow_forward_ios_rounded),)
              ],
            ),
          ],
        ),
      ),
    );
  }
  void onSubmit(){
    CacheHelper.PutData('onbording', true).then((value) {
      NavagatorAndFainsh(context, SopeLogin());

    });
  }

  Widget buluditame( BordingModel list)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: Image(image: AssetImage('${list.image}'),)),
      SizedBox(height: 50,),
      Text('${list.titel}',
        style: TextStyle(
          fontSize: 30,
        ),),
      SizedBox(height: 40,),
      Text('${list.body}',
        style: TextStyle(
          fontSize: 20,
        ),),

    ],
  );
}
