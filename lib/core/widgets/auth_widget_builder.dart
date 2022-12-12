import 'package:daretoyouapp/core/service/i_auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';

class AuthWidgetBuilder extends StatelessWidget{
  const AuthWidgetBuilder({Key?key,required this.onPageBuilder}) : super(key:key);
  final Widget Function(BuildContext context, AsyncSnapshot<MyappUser?> snapshot) onPageBuilder;

  @override
  Widget build(BuildContext context){
    final _authService = Provider.of<IAuthService>(context,listen:false);
    return StreamBuilder<MyappUser?>(
        stream: _authService.onAuthStateChanged,
        builder: (context,AsyncSnapshot<MyappUser?> snapshot){
        final _userData = snapshot.data;
        if(_userData!=null){
          return MultiProvider(
              providers: [
                Provider.value(value: _userData),
              ],
              child: onPageBuilder(context,snapshot)
          );
          }
        return onPageBuilder(context,snapshot);
    },
    );
  }
}
