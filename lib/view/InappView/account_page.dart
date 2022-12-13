import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage>  createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage>{
  @override

  Widget build(BuildContext context){
    return Scaffold(backgroundColor: Colors.grey[300],
        body: SizedBox.expand(
          child: Container(
          decoration: const BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.cyan,
            Color(0xFFB64355),
          ],
        )),
    child: SafeArea(
    child: SingleChildScrollView(
    child:Column(
    children: const [
      Text("Account page")
    ],
    ),
    ),
    ),
    ),
    ),
    );

  }
}