class ShopLoginModel
{
  late bool status;
   String? message;
  late UserData data;

  ShopLoginModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    if( json['data'] != null)
    data =  UserData.fromJson(json['data']);
  }
}


class UserData
{
  late int id;
  late  String name;
  late String email;
  late String phone;
  late  String image;
   int? points;
   int? credit;
  late String token;


  // named constructor

  UserData.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}