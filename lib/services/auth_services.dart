part of "services.dart";

class AuthServices {
  static final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(
      String email, String password, String role, String name ) async {
    try {
      auth.UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = User.fromFirebaseUser(userCredential, role, name);
      await UserServices.updateUser(user);

      return SignInSignUpResult(user: user); 
    } catch (e) {
      return SignInSignUpResult(message: e.toString().split("]")[1]);
    }
  }

  static Future<SignInSignUpResult> signIn(String email, String password) async {
    try {
      auth.UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = await User.fromFireStore(userCredential.user!.uid);
      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString().split("]")[1]);
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Stream<auth.User?> get userStream => _auth.authStateChanges();
}

class SignInSignUpResult {
  final User? user;
  final String? message;

  SignInSignUpResult({this.user, this.message});
}