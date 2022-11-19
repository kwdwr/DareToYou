import 'package:daretoyouapp/view/loginpage.dart';
import 'package:daretoyouapp/view/uygulamaiciekran.dart';
import 'package:daretoyouapp/core/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Errorpage.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key,required this.snapshot}) : super(key: key);

  final AsyncSnapshot<MyappUser?> snapshot;
  @override
  Widget build(BuildContext context) {
    if(snapshot.connectionState==ConnectionState.active){
      return snapshot.hasData ? const Uygulamaiciekran():const LoginPage();
    }
    return Errorpage();
  }
}



