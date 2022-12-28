import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/foundation.dart';

//THIS CLASS OF ANY SUBCLASS INTERNALS ARE NEVER GONNA BE CHANGED UPON INIT

@immutable
class AuthUser {
  final String? email;
  final bool isEmailVerified;
  const AuthUser({
    required this.email,
    required this.isEmailVerified,
  });

  factory AuthUser.fromFirebase(User user) => AuthUser(
    email: user.email,
    isEmailVerified: user.emailVerified,
  );
}