import 'dart:convert';

import 'package:alhumiri_frist_project/Shared/componens/constants.dart';
import 'package:alhumiri_frist_project/Shared/network/endpoint.dart';
import 'package:alhumiri_frist_project/Shared/network/remote/dio_helper.dart';
import 'package:alhumiri_frist_project/layout/shop_app/cubit/states.dart';
import 'package:alhumiri_frist_project/model/shope_app/categories_model.dart';
import 'package:alhumiri_frist_project/model/shope_app/change_favorites_model.dart';
import 'package:alhumiri_frist_project/model/shope_app/favorites_model.dart';
import 'package:alhumiri_frist_project/model/shope_app/home_model.dart';
import 'package:alhumiri_frist_project/model/shope_app/shopelogin_model.dart';
import 'package:alhumiri_frist_project/modules/shope_app/cateogries/categories_screen.dart';
import 'package:alhumiri_frist_project/modules/shope_app/favorites/favorites_screen.dart';
import 'package:alhumiri_frist_project/modules/shope_app/products/products_screen.dart';
import 'package:alhumiri_frist_project/modules/shope_app/settings/Setting_home.dart';
import 'package:alhumiri_frist_project/modules/shope_app/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingHome(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

    HomeModel?  homeModel;
  late ChangeFavoritesModel favoritesModel;
  Map<int, bool> ? favorites = {};

  void getHomeData() {

    emit(ShopLoadingHomeDataState());

    DioHelper.getDataWithOutquwry(
      url: HOME,
      token: token!,
    ).then((value) {

      homeModel = HomeModel.fromJson(value.data);

      homeModel!.data.products.forEach((element) {
        favorites!.addAll({
          element.id:element.inFavorites,
        });
      });

      // print(homeModel.data.banners[0].image);
      // print(homeModel.status);
      print(favorites.toString());
      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

  CategoriesModel?  categoriesModel;

  void getCategoriesData() {
    DioHelper.getDataWithOutquwry(
      url: Categories,
      token: token!,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);

      emit(ShopSuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoriesState());
    });
  }

  void ChingFavorit(int idmodel){

favorites![idmodel]=!favorites![idmodel]!;
emit(ShopChangeFavoritesState());
    DioHelper.PostData(
    url: Favorites,
        data: {
          'product_id': idmodel,
        },
        token: token!,
      ).then((value) {

      favoritesModel = ChangeFavoritesModel.fromJson(value.data);

        // print(value.data);

        if (!favoritesModel.status) {
          favorites![idmodel] = !favorites![idmodel]!;
        }
        else {
          getFavorites();
        }
        emit(ShopSuccessChangeFavoritesState(model: favoritesModel));
      }).catchError((error) {
        favorites![idmodel] = !favorites![idmodel]!;
        emit(ShopErrorChangeFavoritesState());
        print(error.toString());
      });

  }
  //

  FavoritesModel ? FoavretModel;

  void getFavorites() {
    emit(ShopLoadingGetFavoritesState());

    DioHelper.getDataWithOutquwry(
      url: Favorites,
      token: token!,
    ).then((value) {
      FoavretModel = FavoritesModel.fromJson(value.data);
      //printFullText(value.data.toString());

      emit(ShopSuccessGetFavoritesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetFavoritesState());
    });
  }
  //
  ShopLoginModel? userModel;

  void getUserData() {
    emit(ShopLoadingUserDataState());
    DioHelper.getDataWithOutquwry(
      url: 'profile',
      token: token!,
      lang: 'ar'
    ).then((value) {
      userModel= ShopLoginModel.fromJson(value.data);
// print(userModel.data.email.toString());
//       print(userModel.data.phone.toString());
//       print('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz');
//       print(value.data.toString());
      emit(ShopSuccessUserDataState(userModel!));
    }).catchError((error) {
      print('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz');
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }
  //
  void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(ShopLoadingUpdateUserState());

    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token!,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);

      emit(ShopSuccessUpdateUserState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUpdateUserState());
    });
  }
}
