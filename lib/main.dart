import 'package:alhumiri_frist_project/Shared/bloc_observer.dart';
import 'package:alhumiri_frist_project/Shared/componens/constants.dart';
import 'package:alhumiri_frist_project/Shared/network/local/cache_helper.dart';
import 'package:alhumiri_frist_project/Shared/network/remote/dio_helper.dart';
import 'package:alhumiri_frist_project/Shared/stylses/themes.dart';
import 'package:alhumiri_frist_project/layout/news/cubit/cubit.dart';
import 'package:alhumiri_frist_project/layout/news/cubit/steats.dart';
import 'package:alhumiri_frist_project/layout/news/news.dart';
import 'package:alhumiri_frist_project/layout/shop_app/cubit/cubit.dart';
import 'package:alhumiri_frist_project/modules/shope_app/onbording/onbording_screan.dart';
import 'package:alhumiri_frist_project/modules/shope_app/shope_login/cubitforlogin/cubit.dart';
import 'package:alhumiri_frist_project/modules/shope_app/shope_login/shope_login.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


void main() async{
  BlocOverrides.runZoned(
      () async {
    // Use cubits...

        //هاذ الدالة تضمن لي انه التطبيق ما رح يشتغل الا وقد اكتملين الذي قبله
        WidgetsFlutterBinding.ensureInitialized();
        DioHelper.init();
       await CacheHelper.init();
       token=CacheHelper.getData('token')??'';
       print(token);
        runApp(MyApp());
  },
  blocObserver: MyBlocObserver(),
);

}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return MultiBlocProvider(
      providers: [
      BlocProvider(create:(BuildContext context)=> ShopLoginCubit(),),
     BlocProvider(create:(BuildContext context)=> NewsCubit(),),
        BlocProvider(create:(BuildContext context)=> ShopCubit()..getHomeData()..getCategoriesData()..getFavorites()..getUserData()),
       ],
      child: BlocConsumer<NewsCubit,NewsState>(
          builder: (context,state){ return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: ShopLoginCubit.get(context).TestOnbording() ,
            theme: LightTheme ,
            darkTheme:DarkTheme ,
            themeMode: NewsCubit.get(context).darkThem?ThemeMode.light:ThemeMode.dark,

          );},
          listener: (context,state){}),
  );
  }


}