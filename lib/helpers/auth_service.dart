import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<UserCredential?> signInWithGoogle() async {
  try {
    // 1. Google-р нэвтрэхийн тулд токен авах
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return null; // Хэрэглэгч цуцалсан

    // 2. Ажилтан баталгаажуулалт
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // 3. Firebase-руу credential илгээх
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // 4. Firebase-д нэвтрэх
    final UserCredential userCredential = await _auth.signInWithCredential(credential);
    print("Google-р амжилттай нэвтэрлээ: ${userCredential.user?.displayName}");
    return userCredential;
  } on FirebaseAuthException catch (e) {
    print("Firebase auth алдаа: ${e.code} - ${e.message}");
    return null;
  } catch (e) {
    print("Ерөнхий алдаа: $e");
    return null;
  }
}
