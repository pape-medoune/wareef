import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
 final FirebaseAuth _auth = FirebaseAuth.instance;

 Future<String> registration({
    required String prenom,
    required String nom,
    required String email,
    required String password,
 }) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return 'Success';
    } catch (e) {
      print('Error: $e');
      return 'Error: $e';
    }
 }
}
