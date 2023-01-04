import 'dart:ffi';

import 'package:alhumiri_frist_project/Shared/componens/componens.dart';
import 'package:alhumiri_frist_project/layout/news/cubit/cubit.dart';
import 'package:alhumiri_frist_project/layout/news/cubit/steats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SershScrean extends StatelessWidget {

var sershconteroer=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
        builder: (context,state){
          var list =NewsCubit.get(context).sershe;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defultTextFormFaild(
                    onChanged: (value){
                  NewsCubit.get(context).getSersh(value.toString());
                    },
                      contloler: sershconteroer,
                      textInputType:  TextInputType.text ,
                      prefixicon: Icons.search,
                      labelText: 'sershe'),



                ),
                Expanded(child:   ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index)=>BulidArticalItime(list[index],context) ,
                    separatorBuilder: (context ,index)=>Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey[200],
                    ),
                    itemCount:list.length),)   ,         ],
            ),
          );
        },
        listener:(context,state){});
  }
}
