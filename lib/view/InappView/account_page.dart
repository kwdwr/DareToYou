import 'package:flutter/cupertino.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage>  createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage>{
  @override

  Widget build(BuildContext context){
    return Container(
      child: const Text("Account Page"),
    );
  }
}