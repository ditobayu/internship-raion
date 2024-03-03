part of "models.dart";

class User extends Equatable {
  final String id;
  final String username;
  final String email;
  final String name;
  final String role;
  final String profilePicture;

  const User({required this.id, required this.email,
       required this.name,
       required this.profilePicture,
       required this.role,
       required this.username});

       @override
  String toString() {
    // TODO: implement toString
    return "[$id] - $username, $email";
  }

  @override
  List<Object> get props => [id, username, email, name, role, profilePicture];

   static User fromFirebaseUser(auth.UserCredential userCredential, String role, String name) {
    return User(
      id: userCredential.user!.uid,
      email: userCredential.user!.email!,
      name: name,
      profilePicture: userCredential.user!.photoURL ?? "link foto",
      role: role,
      username: name,
    );

  }
    static Future<User> fromFireStore(String id)  => UserServices.getUser(id);
  
  // User copyWith({String name, String profilePicture, List<String> selectedGenres, s selectedLanguage, int balance}) => User(this.id, this.email,
  //     name: name ?? this.name,
  //     profilePicture: profilePicture ?? this.profilePicture,
  //     selectedGenres: selectedGenres ?? this.selectedGenres,
  //     selectedLanguage: selectedLanguage ?? this.selectedLanguage,
  //     balance: balance ?? this.balance);
}