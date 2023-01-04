import 'package:alhumiri_frist_project/Shared/componens/componens.dart';
import 'package:alhumiri_frist_project/Shared/componens/constants.dart';
import 'package:alhumiri_frist_project/Shared/network/local/cache_helper.dart';
import 'package:alhumiri_frist_project/layout/shop_app/shope_layout.dart';
import 'package:alhumiri_frist_project/modules/shope_app/register/cubit/cubit.dart';
import 'package:alhumiri_frist_project/modules/shope_app/register/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ShopRegisterScreen extends StatelessWidget
{
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (context, state)
        { if (state is ShopRegisterSuccessState){
          if(state.loginModel.status){
            ShowTosast(masseg: state.loginModel.message!,color: Colors.green);
            CacheHelper.PutData('token', state.loginModel.data.token).then((value) {
              if(value){
                token=state.loginModel.data.token;
                NavagatorAndFainsh(context, ShopeLayout());
                print(''''''''''''''''''''''=============================rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr''');

              }
            });
          }
          else{
            ShowTosast(masseg: state.loginModel.message!,color: Colors.red);
          }
        }

        },
        builder: (context, state)
        {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Register now to browse our hot offers',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defultTextFormFaild(
                            contloler: nameController,
                            textInputType:  TextInputType.name,
                            prefixicon:  Icons.person,
                            labelText: 'Name',
                            textValidator: 'name must not be empty'),
                        SizedBox(
                          height: 15.0,
                        ),
                        defultTextFormFaild(
                            contloler: emailController,
                            textInputType:  TextInputType.emailAddress,
                            prefixicon:  Icons.email_sharp,
                            labelText: 'Email',
                            textValidator: 'Email must not be empty'),
                        SizedBox(
                          height: 15.0,
                        ),
                        defultTextFormFaild(
                            contloler: passwordController,
                            obscureText:ShopRegisterCubit.get(context).isPassword,
                            suffixicon: ShopRegisterCubit.get(context).suffix,
                            textValidator: 'password is\'t be empty',
                            textInputType: TextInputType.visiblePassword,
                            prefixicon: Icons.lock_person,
                            onPrefixIconCleic: (){
                              ShopRegisterCubit.get(context).changePasswordVisibility();
                            },
                            labelText: 'password'),
                        SizedBox(
                          height: 15.0,
                        ),
                        defultTextFormFaild(
                            contloler: phoneController,
                            textInputType:  TextInputType.phone,
                            prefixicon:  Icons.phone_iphone,
                            labelText: 'Phone',
                            textValidator: 'Phone must not be empty'),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopRegisterLoadingState,
                          builder: (context) => defultBoutton(function: (){
                            if (formKey.currentState!.validate()) {
                     ShopRegisterCubit.get(context).userRegister(
                         name: nameController.text,
                         email: emailController.text,
                         password: passwordController.text,
                         phone: phoneController.text);

                            }
                          }, text:'register'),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
