
import 'package:alhumiri_frist_project/modules/buesc_learn_fultter/counter/cubit/cubit.dart';
import 'package:alhumiri_frist_project/modules/buesc_learn_fultter/counter/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class counter extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context)=> countercubit(),
    child: BlocConsumer<countercubit ,counterstate >(
      listener:(context ,state){} ,
      builder: (context ,state)=>Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
                'continer'
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: (){


                countercubit.get(context).plues();

              }, child: Text(
                'plues',

              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0,),
                child: Text(
                  '  ${countercubit.get(context).count}',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                  ),
                ),
              ),
              TextButton(onPressed: (){

                countercubit.get(context).menus();

              }, child: Text(
                'Munes',

              )),
            ],
          ),
        ),

      ),
    ),);
  }
}
