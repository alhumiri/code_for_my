import 'package:alhumiri_frist_project/Shared/componens/componens.dart';
import 'package:alhumiri_frist_project/layout/news/cubit/cubit.dart';
import 'package:alhumiri_frist_project/layout/news/cubit/steats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Sports extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsState>(builder: (context,state){
      var list =NewsCubit.get(context).Sport;
      return  list.length > 0 ? ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,index)=>BulidArticalItime(list[index],context) ,
          separatorBuilder: (context ,index)=>Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[200],
          ),
          itemCount:list.length) : BulidScrenNewsApp ();
    }, listener: (context,state){});
  }
}
