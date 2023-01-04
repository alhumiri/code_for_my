import 'package:alhumiri_frist_project/Shared/componens/componens.dart';
import 'package:alhumiri_frist_project/Shared/componens/constants.dart';
import 'package:alhumiri_frist_project/Shared/network/local/cache_helper.dart';
import 'package:alhumiri_frist_project/Shared/stylses/steles.dart';
import 'package:alhumiri_frist_project/layout/shop_app/cubit/cubit.dart';
import 'package:alhumiri_frist_project/layout/shop_app/cubit/states.dart';
import 'package:alhumiri_frist_project/modules/shope_app/search/search_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopeLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
        builder: (context,stat){
          var cubit=ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(
                        'https://scontent.fsah1-1.fna.fbcdn.net/v/t1.6435-9/117818387_729713590907520_8962198268758668364_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=pk18jhhBOuAAX9MsWZM&_nc_oc=AQmxcm2Tw7vE5JZttNDx8sKXAbdfJW7Xf5gPNhohBq95nV_EqVsiGgme_lC3Mdn6CDY&_nc_ht=scontent.fsah1-1.fna&oh=00_AT92qBue6hG5VvJYVgjld9e5881bUxsJojVnQOdGZssZBQ&oe=630B84BC'),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    'ziadalhumiri',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),

                ],
              ),
              actions: [IconButton(onPressed: (){
              NavagaorToAntherPage(context, SearchScreen());
              }, icon: Icon(Icons.search_rounded))],
            ),
            body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: CurvedNavigationBar(
              height: 60.0,
              color: Colors.white,
              backgroundColor: defultColor,
              animationCurve:Curves.easeInOut ,
              // index: cubit.currentIndex,
              onTap: (index){
                cubit.changeBottom(index);
              },
              items: [
                Icon(
                  Icons.home,
                ),
                Icon(
                  Icons.apps,
                ),
                Icon(
                  Icons.favorite,
                ),
                Icon(
                  Icons.settings,
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(
                //     Icons.home,
                //   ),
                //   label: 'Home',
                // ),
                // BottomNavigationBarItem(
                //   icon: Icon(
                //     Icons.apps,
                //   ),
                //   label: 'Categories',
                // ),
                // BottomNavigationBarItem(
                //   icon: Icon(
                //     Icons.favorite,
                //   ),
                //   label: 'Favorites',
                // ),
                // BottomNavigationBarItem(
                //   icon: Icon(
                //     Icons.settings,
                //   ),
                //   label: 'Settings',
                // ),
              ],
            ),
          );
        },
        listener: (context,stat){});
  }
}
