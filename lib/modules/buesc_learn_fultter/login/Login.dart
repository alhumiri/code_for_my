import 'package:alhumiri_frist_project/Shared/componens/componens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Log extends StatefulWidget {
  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  @override
   void  initState() {
    // TODO: implement initState
    super.initState();
  }
  var email = TextEditingController();

  var pass = TextEditingController();

  var formKey=GlobalKey<FormState>();
  bool isPassword=true;
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key:formKey ,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                 defultTextFormFaild(contloler: email, textInputType: TextInputType.emailAddress,  labelText: 'email',prefixicon:  Icons.email,textValidator: 'email most be not null'),
                  SizedBox(
                    height: 20,
                  ),
                  defultTextFormFaild(contloler: pass, textInputType: TextInputType.text, suffixicon: isPassword ? Icons.remove_red_eye_rounded : Icons.remove_red_eye_outlined, labelText: 'password',textValidator: 'password most be not null',obscureText: isPassword,prefixicon: Icons.lock,onPrefixIconCleic: (){
                    setState(() {
                      isPassword=!isPassword;
                    });
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  defultBoutton(
                    function: (){
                      if(formKey.currentState!.validate()){
                      print(email.text);
                      print(pass.text);
                      print('ziad -------------------------------------------------------------------------');
                    }},
                    text: 'login',
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have account?',
                      ),
                      TextButton(
                        onPressed: () {

                        },
                        child: Text('SingNow'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
