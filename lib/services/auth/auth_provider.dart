import 'package:notes_app/services/auth/auth_user.dart';

//INTERFACE FOR OTHER PROVIDERS TO IMPLEMENT
abstract class AuthProvider {
  //ANY AUTH PROVIDE (FB, GITHUB...) NEEDS TO BE ABLE TO RETURN THE CURRENT USER
  AuthUser? get currentUser;


  //A FUNC THAT COMPLETES IN THE FUTURE
  Future<AuthUser> logIn({
    required String email,
    required String password,
  });

  Future<void> initialize();
  //A FUNC THAT COMPLETES IN THE FUTURE
  Future<AuthUser> createUser({
    required String email,
    required String password,
  });
  Future<void> logOut();
  Future<void> sendEmailVerification();
}