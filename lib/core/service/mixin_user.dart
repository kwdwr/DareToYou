import 'package:firebase_auth/firebase_auth.dart';

import '../model/user.dart';

mixin ConvertUser{
  MyappUser convertUser(UserCredential user){
    return MyappUser(userId: user.user!.uid, userMail: user.user!.email!);
  }
}