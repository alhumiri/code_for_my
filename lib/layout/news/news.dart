import 'package:alhumiri_frist_project/Shared/componens/componens.dart';
import 'package:alhumiri_frist_project/layout/news/cubit/cubit.dart';
import 'package:alhumiri_frist_project/layout/news/cubit/steats.dart';
import 'package:alhumiri_frist_project/modules/news_app/sershe_fail/sershe_screan.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsState>(
      builder: (BuildContext context ,state){
        NewsCubit cubit = NewsCubit.get(context);
        return  Scaffold(
          appBar: AppBar(title: Text('NewsApp'),
            actions: [
              IconButton(onPressed: (){
                NavagaorToAntherPage(context, SershScrean(),);
              },
                  icon: Icon(Icons.search_rounded)),
              IconButton(onPressed: (){
                cubit.chingDarkmode();
              },
                  icon: Icon(Icons.brightness_4_outlined)),
            ],
          ),
          body: cubit.Screns[cubit.curintindex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.BottonNavigshBar,
            currentIndex:cubit.curintindex ,
            onTap: (index){
              cubit.chingCurintIndex(index);
            },
          ),
        );
      },
      listener:(BuildContext context ,state){} ,
    );
  }
}
