
import 'package:alhumiri_frist_project/modules/buesc_learn_fultter/counter/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class countercubit extends Cubit< counterstate>{

  countercubit():super(intisiles_state());

  static countercubit get(BuildContext context)=>BlocProvider.of(context);
  int count=1;

  void plues(){
    count++;
    emit(ching_state());
  }
  void menus(){
    count--;
    emit(ching_state());
  }
}