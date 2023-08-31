class Profile {
  String username; 
  String email;
  String password;
  String confirmpassword;

  Profile({
    required this.username, 
    required this.email,
    required this.password,
    required this.confirmpassword,
  });
}

// void main() {
//   Profile user = Profile(
//     username: "username", 
//     email: "example@example.com",
//     password: "secured_password",
//     confirm_password: "secured_password",
//   );


// }
