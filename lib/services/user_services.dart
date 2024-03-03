part of "services.dart";

class UserServices {
  static final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("users");

  // static Future<DocumentReference> addUser(User user) async {
  //   return await _userCollection.add({
  //     'email': user.email,
  //     'name': user.name,
  //     'role': user.role,
  //     'profilePicture': user.profilePicture,
  //     'username': user.username
  //   });
  // }

  static Future<void> updateUser(User user) async {
    await _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'role': user.role,
      'profilePicture': user.profilePicture,
      'username': user.username
    });
  }

  static Future<User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();
    return User(
      id: id,
      email: snapshot.get('email'),
      name: snapshot.get('name'),
      role: snapshot.get('role'),
      profilePicture: snapshot.get('profilePicture'),
      username: snapshot.get('username'),
    );
  }
}