import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Register user
  Future<String?> registerUser({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String placeOfBirth,
    required String dateOfBirth,
    required String address,
  }) async {
    try {
      // Create user in Firebase Authentication
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save user details in Firestore with role as "pengguna"
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'email': email,
        'phone': phone,
        'placeOfBirth': placeOfBirth,
        'dateOfBirth': dateOfBirth,
        'address': address,
        'role': 'pengguna', // Default role
      });

      return null; // Success
    } on FirebaseAuthException catch (e) {
      return e.message; // Return error message
    }
  }

  // Login user
  Future<String?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      // Sign in user
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Fetch role from Firestore
      DocumentSnapshot userDoc = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (userDoc.exists && userDoc['role'] == 'pengguna') {
        return null; // Success
      } else {
        return 'Access denied: Unauthorized role';
      }
    } on FirebaseAuthException catch (e) {
      return e.message; // Return error message
    }
  }

  // Send password reset email
  Future<String?> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return null; // Success
    } on FirebaseAuthException catch (e) {
      return e.message; // Return error message
    }
  }
}
