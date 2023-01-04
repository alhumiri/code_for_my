import 'package:alhumiri_frist_project/Shared/componens/constants.dart';
import 'package:alhumiri_frist_project/Shared/network/endpoint.dart';
import 'package:alhumiri_frist_project/Shared/network/local/cache_helper.dart';
import 'package:alhumiri_frist_project/Shared/network/remote/dio_helper.dart';
import 'package:alhumiri_frist_project/layout/shop_app/shope_layout.dart';
import 'package:alhumiri_frist_project/modules/shope_app/onbording/onbording_screan.dart';
import 'package:alhumiri_frist_project/modules/shope_app/shope_login/cubitforlogin/states.dart';
import 'package:alhumiri_frist_project/modules/shope_app/shope_login/shope_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/shope_app/shopelogin_model.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

 late ShopLoginModel loginModel;
  void userLogin({
    required String email,
    required String password,
  })
  {
    emit(ShopLoginLoadingState());

    DioHelper.PostData(
      url: LOGIN,
      data:
      {
        'email': email,
        'password': password,
      },
    ).then((value)
    {
      // print(value.data);
       loginModel = ShopLoginModel.fromJson(value.data);
      emit(ShopLoginSuccessState(loginModel));
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.remove_red_eye;
  bool isPassword = true;

  Widget TestOnbording(){
    if(CacheHelper.getData('onbording')!=null) {
      if (CacheHelper.getData('token')!=null)
        return ShopeLayout();
        else  return SopeLogin();
    }
    else
      return BordingScrean();


  }


  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.remove_red_eye : Icons.visibility_outlined ;

    emit(ShopChangePasswordVisibilityState());
  }
}