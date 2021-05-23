

/** 是否是手机号*/
bool isPhoneNum(String phoneNum) {
  return RegexpUtil.isPhoneNum(phoneNum);
}

/** 是否是密码数字、字母、下划线*/
bool isPassword(String password){
  return RegexpUtil.isPassword(password);
}


class RegexpUtil {

  static bool isPhoneNum(String phoneNum){
    RegExp regExp = RegExp(r"^1[345789]\d{9}");
    return regExp.hasMatch(phoneNum);
  }


  static bool isPassword(String password){
    RegExp regExp = RegExp(r"^\w+$");
    return regExp.hasMatch(password);
  }


}
