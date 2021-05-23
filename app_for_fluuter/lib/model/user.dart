
import 'dart:convert';


class User {
   String name;
   String email;

   User(this.name, this.email);


  // var dynamic object。三个的区别。var 并不是类型， dynamic和object是类型。 var 声明的，当赋值后就会进行类型
  // 腿短，而且然后，不能再次进行赋值。
  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];


  }

  Map<String, dynamic> toJson() {

    return {'name':name, 'email':email};
  }

}


