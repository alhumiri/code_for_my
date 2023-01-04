import 'package:alhumiri_frist_project/Shared/componens/componens.dart';
import 'package:alhumiri_frist_project/Shared/componens/constants.dart';
import 'package:alhumiri_frist_project/Shared/network/local/cache_helper.dart';
import 'package:alhumiri_frist_project/Shared/stylses/steles.dart';
import 'package:alhumiri_frist_project/layout/shop_app/cubit/cubit.dart';
import 'package:alhumiri_frist_project/layout/shop_app/shope_layout.dart';
import 'package:alhumiri_frist_project/modules/shope_app/register/shop_register_screen.dart';
import 'package:alhumiri_frist_project/modules/shope_app/shope_login/cubitforlogin/cubit.dart';
import 'package:alhumiri_frist_project/modules/shope_app/shope_login/cubitforlogin/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SopeLogin extends StatelessWidget {
  var emailControler = TextEditingController();
  var passControler = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        builder: (BuildContext context,ShopLoginStates state){
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Login',
                            style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text('Login Now to browser our hot offers',
                              style: Theme.of(context).textTheme.bodyText2),
                          SizedBox(
                            height: 30,
                          ),
                          defultTextFormFaild(
                              contloler: emailControler,
                              textValidator: 'email is\'t be empty',
                              textInputType: TextInputType.emailAddress,
                              prefixicon: Icons.email_rounded,
                              labelText: 'email'),
                          SizedBox(
                            height: 20,
                          ),
                          defultTextFormFaild(
                              contloler: passControler,
                              obscureText: ShopLoginCubit.get(context).isPassword,
                              suffixicon: ShopLoginCubit.get(context).suffix,
                              textValidator: 'password is\'t be empty',
                              textInputType: TextInputType.visiblePassword,
                              prefixicon: Icons.lock_person,
                              onPrefixIconCleic: (){
                                ShopLoginCubit.get(context).changePasswordVisibility();
                              },
                              labelText: 'password'),

                          SizedBox(
                            height: 20,
                          ),
                          ConditionalBuilder(
                            condition: state is! ShopLoginLoadingState,
                            builder: (context) => defultBoutton(
                              background: defultColor,
                              heght: 45,
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  ShopLoginCubit.get(context).userLogin(
                                    email: emailControler.text,
                                    password: passControler.text,
                                  );


                                }
                              },
                              text: 'login',
                              isupercase: true,
                            ),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have anacount'),
                              defultTextBoutton(function: () {
                                NavagaorToAntherPage(context, ShopRegisterScreen());
                              }, text: 'singin'),
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          );},
        listener: (BuildContext context,ShopLoginStates state){
          if (state is ShopLoginSuccessState){
            if(state.loginModel.status){
              ShowTosast(masseg: state.loginModel.message!,color: Colors.green);
              CacheHelper.PutData('token', state.loginModel.data.token).then((value) {
                if(value){
                  token=state.loginModel.data.token;
                  NavagatorAndFainsh(context, ShopeLayout());

                }
              });
          }
          else{
              ShowTosast(masseg: state.loginModel.message!,color: Colors.red);
          }}
        });

  }
}
