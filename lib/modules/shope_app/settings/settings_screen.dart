import 'package:alhumiri_frist_project/Shared/componens/componens.dart';
import 'package:alhumiri_frist_project/Shared/componens/constants.dart';
import 'package:alhumiri_frist_project/Shared/network/local/cache_helper.dart';
import 'package:alhumiri_frist_project/Shared/stylses/steles.dart';
import 'package:alhumiri_frist_project/layout/shop_app/cubit/cubit.dart';
import 'package:alhumiri_frist_project/layout/shop_app/cubit/states.dart';
import 'package:alhumiri_frist_project/modules/shope_app/register/cubit/cubit.dart';
import 'package:alhumiri_frist_project/modules/shope_app/shope_login/shope_login.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SettingsScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {

        var model  = ShopCubit.get(context).userModel!;
        nameController.text = model.data.name.toString();
        emailController.text = model.data.email.toString();
        phoneController.text = model.data.phone.toString();

        return Scaffold(
          appBar: AppBar(),
          body: ConditionalBuilder(
            condition: ShopCubit.get(context).userModel !=null,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children:
                      [
                        if(state is ShopLoadingUpdateUserState)
                        LinearProgressIndicator(),
                        SizedBox(
                          height: 20.0,
                        ),
                        defultTextFormFaild(
                            contloler: nameController,
                            textInputType:  TextInputType.name,
                            prefixicon:  Icons.person,
                            labelText: 'Name',
                            textValidator: 'name must not be empty'),
                        SizedBox(
                          height: 20.0,
                        ),
                        defultTextFormFaild(
                            contloler: emailController,
                            textInputType:  TextInputType.emailAddress,
                            prefixicon:  Icons.email_sharp,
                            labelText: 'Email',
                            textValidator: 'Email must not be empty'),
                        SizedBox(
                          height: 20.0,
                        ),
                        defultTextFormFaild(
                            contloler: phoneController,
                            textInputType:  TextInputType.phone,
                            prefixicon:  Icons.phone_iphone,
                            labelText: 'Phone',
                            textValidator: 'Phone must not be empty'),
                        SizedBox(
                          height: 20.0,
                        ),
                        defultBoutton(function: (){
                          if (formKey.currentState!.validate()) {
                            ShopCubit.get(context).updateUserData(name: nameController.text, email: emailController.text, phone: phoneController.text);
                          }
                        }, text: 'Update',isupercase: true,heght: 48,background: defultColor),
                        SizedBox(
                          height: 20.0,
                        ),
                      defultBoutton(function: (){
                        NavagatorAndFainsh(context, SopeLogin());
                        CacheHelper.removeData('token').then((value) {
                          token='';

                        });
                      }, text: 'LogOut',heght: 48,background: defultColor),


                      ],
                    ),
                  ),
                ),
              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
