import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daretoyouapp/core/model/user.dart';
import 'package:daretoyouapp/core/service/i_auth_service.dart';
import 'package:daretoyouapp/core/service/mixin_user.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService with ConvertUser implements IAuthService{

final FirebaseAuth _authInstance = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final currentuser = FirebaseAuth.instance.currentUser;

MyappUser _getUser(User? user){
  return MyappUser(userId: user!.uid, userMail: user.email!);
}


@override
  Future<MyappUser> createEmailAndPassword({required name,required surname,required String email,required phone, required String password}) async {
  var _tempUser = await _authInstance.createUserWithEmailAndPassword(
      email: email, password: password);
  await _firestore.collection('Users').doc(_tempUser.user?.uid).set({'Name':name,'surname':surname,'phone':phone,'userEmail':email,'userPassword':password});
  await currentuser?.sendEmailVerification();
  return convertUser(_tempUser);
  }

@override
Future<void> RecoverPassword({required String email}) async {
  await _authInstance.sendPasswordResetEmail(
    email: email,);
}

  @override
  Future<MyappUser> signInEmailAndPassword({required String email, required String password}) async {
    var _tempUser = await _authInstance.signInWithEmailAndPassword(
        email: email, password: password);
    return convertUser(_tempUser);
  }
@override
Stream<MyappUser?> get onAuthStateChanged => _authInstance.authStateChanges().map(_getUser);

@override
  Future<void> SignOut() async {
   await _authInstance.signOut();

  }
}