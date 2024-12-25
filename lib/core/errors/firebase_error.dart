import 'package:firebase_auth/firebase_auth.dart';

class ErrorFirebase {
  final String errorMessage;

  ErrorFirebase({required this.errorMessage});

  factory ErrorFirebase.fromFirebase(FirebaseAuthException error) {
    switch (error.code) {
      case 'user-not-found':
        return ErrorFirebase(
            errorMessage: 'No user found for the provided email.');
      case 'wrong-password':
        return ErrorFirebase(errorMessage: 'The password is incorrect.');
      case 'email-already-in-use':
        return ErrorFirebase(
            errorMessage: 'The email address is already in use.');
      case 'invalid-email':
        return ErrorFirebase(errorMessage: 'The email address is not valid.');
      case 'weak-password':
      case 'operation-not-allowed':
        return ErrorFirebase(errorMessage: 'This operation is not allowed.');
      case 'network-request-failed':
        return ErrorFirebase(
            errorMessage: 'A network error occurred. Please try again.');
      default:
        return ErrorFirebase(errorMessage: "Invalid email or password");
    }
  }
}
