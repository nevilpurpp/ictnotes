import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ictnotes/screens/Home_ict.dart';
import '../models/user_model.dart';
import '../screens/login.dart';
import 'auth_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  UserModel userModel =
      UserModel(email: '', uid: '', displayName: '', timestamp: DateTime.now());
  final userRef = FirebaseFirestore.instance.collection('users');
  //handle AuthState()

//users
  addUserToDB(
      {required String uid,
      required String displayName,
      required String email,
      required DateTime timestamp}) async {
    userModel = UserModel(
        uid: uid, displayName: displayName, email: email, timestamp: timestamp);
    var data = userModel.toMap(UserModel(
        email: email,
        uid: uid,
        displayName: displayName,
        timestamp: timestamp));
    await userRef.doc(uid).set(data.cast());
  }

  //signInWithEmailAndPassword

  // signInWithGoogle()

  /*Future<Map<String, dynamic>> signInWithGoogle() async {
    // Trigger the authentication  flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    //saving the user data to shared preferences

    //sign in method
    try {
      UserCredential user =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('users')
          .where('id', isEqualTo: user.user!.uid)
          .get();
      Map<String, dynamic> userdata = {
        'useremail': user.user!.email,
        'displayName': user.user!.displayName,
        'photoUrl': user.user!.photoURL,
        'userid': user.user!.uid
      };
      return userdata;
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
    throw credential;
  }*/

  signOut() {
    FirebaseAuth.instance.signOut();
  }
  //signOut()
}
