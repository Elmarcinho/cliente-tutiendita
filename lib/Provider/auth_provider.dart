import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';




class AuthProvider{

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  
  

  Future<UserCredential> signInWithGoogle() async{
 
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();


    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;


    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<String> insertClient( String name, String email, String cellphone) async{ 
    
    try {
      final idClient = await _firestore.collection('client').get().then((value) => value.docs.length + 1);

      return await _firestore.collection('client')
                  .doc(email)
                  .set({
                    'idClient': idClient,
                    'name' : name,
                    'email': email,
                    'cellphone' : cellphone
                  }).then((value) => 'ok');

    }catch (e) {

      return e.toString();
      
    }

  }

  Future<DocumentSnapshot> searchClientForEmail(String email) async{

    return await _firestore.collection('client').doc(email.toLowerCase()).get();

  }

  Future<void> logout() async {

    await _auth.signOut();

  }




}