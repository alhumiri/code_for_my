import 'package:alhumiri_frist_project/Shared/componens/componens.dart';
import 'package:alhumiri_frist_project/Shared/network/local/cache_helper.dart';
import 'package:alhumiri_frist_project/modules/shope_app/shope_login/shope_login.dart';

void signOut(context) {
  CacheHelper.removeData(
    'token',
  ).then((value) =>
  {
    if (value)
      {
        defultTextBoutton(text: "singout ", function: () {
          NavagatorAndFainsh(context, SopeLogin());
        })
      }
  });

  void printFullText(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }}

  String ? token='';
