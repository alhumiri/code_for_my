import 'package:alhumiri_frist_project/Shared/network/local/cache_helper.dart';
import 'package:alhumiri_frist_project/Shared/network/remote/dio_helper.dart';
import 'package:alhumiri_frist_project/layout/news/cubit/steats.dart';
import 'package:alhumiri_frist_project/modules/news_app/busens/busenes.dart';
import 'package:alhumiri_frist_project/modules/news_app/scinence/scinence.dart';
import 'package:alhumiri_frist_project/modules/news_app/sports/sports.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(InisaliesState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int curintindex = 0;
  List<BottomNavigationBarItem> BottonNavigshBar = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Busnes',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Scinece',
    ),

  ];
  void chingCurintIndex(index) {
    curintindex = index;
    if (index == 1)
      getSport();
    else
      getScinece();
    emit(ChingBottonNaveStat());
  }

  List Screns = [Busenes(), Sports(), Scinence(),];

  List<dynamic> busenes = [];
  void getbusenes() {
    if (busenes.length == 0) {
      emit(NewsgetbusenesLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '9a61192b090a45b0b0a88a602d96b43e',
      }).then((value) {
        busenes = value.data['articles'];
        emit(NewsgetbusenesScsefalState());
      }).catchError((err) {
        print(err.toString());
        emit(NewsgetbusenesErorrState(err.toString()));
      });
    } else
      emit(NewsgetbusenesScsefalState());
  }

  List<dynamic> Sport = [];
  void getSport() {
    if (Sport.length == 0) {
      emit(NewsgetSportsLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'Sports',
        'apiKey': '9a61192b090a45b0b0a88a602d96b43e',
      }).then((value) {
       Sport = value.data['articles'];

        emit(NewsgetSportsScsefalState());
      }).catchError((err) {
        print(err.toString());
        emit(NewsgetSportsErorrState(err.toString()));
      });
    } else
      emit(NewsgetSportsScsefalState());
  }

  List<dynamic> Scinece = [];
  void getScinece() {
    if (Scinece.length == 0) {
      emit(NewsgetScineceLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '9a61192b090a45b0b0a88a602d96b43e',
      }).then((value) {
       Scinece = value.data['articles'];
        emit(NewsgetScineceScsefalState());
      }).catchError((err) {
        print(err.toString());
        emit(NewsgetScineceErorrState(err.toString()));
      });
    } else
      emit(NewsgetScineceScsefalState());
  }

  bool darkThem=true;
  void chingDarkmode(){

    darkThem=!darkThem;
    CacheHelper.PutData('darkMode', darkThem).then((value) {
      emit( ChingDarkModeStat());
    });

  }

  void TestDarkMode (){

    if (CacheHelper.getData('darkMode')!=null)
    darkThem=CacheHelper.getData('darkMode');

  }


  List<dynamic> sershe = [];
  void getSersh(String value) {
    sershe=[];
      emit(NewsgetSersheLoadingState());
      DioHelper.getData(url: 'v2/everything', query: {
      'q':'${value}',
        'apiKey': '9a61192b090a45b0b0a88a602d96b43e',
      }).then((value) {
        sershe = value.data['articles'];
        emit(NewsgetSersheScsefalState());
      }).catchError((err) {
        print(err.toString());
        emit(NewsgetSersheErorrState(err.toString()));
      });

      emit(NewsgetSersheScsefalState());
  }

}
