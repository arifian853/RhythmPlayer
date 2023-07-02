// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:rhythm_player/auth.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   String? errorMesage = '';
//   bool isLogin = true;
//   final TextEditingController _controllerEmail = TextEditingController();
//   final TextEditingController _controllerPassword = TextEditingController();
//   Future<void> signInWithEmailAndPassword() async {
//     try {
//       await Auth().signInWithEmailPassword(
//         email: _controllerEmail.text,
//         password: _controllerPassword.text,
//       );
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         errorMesage = e.message;
//       });
//     }
//   }

//   Future<void> createUserWithEmailAndPassword() async {
//     try {
//       await Auth().createUserWithEmailAndPassword(
//         email: _controllerEmail.text,
//         password: _controllerPassword.text,
//       );
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         errorMesage = e.message;
//       });
//     }
//   }

//   Widget _entryField(
//     String title,
//     TextEditingController controller,
//   ) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: const Color.fromARGB(255, 20, 22, 20),
//         hintText: '',
//         hintStyle: Theme.of(context)
//             .textTheme
//             .bodyMedium!
//             .copyWith(color: Colors.white),
//         suffixIcon: const Icon(
//           Icons.search,
//           color: Colors.white,
//         ),
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(7.0),
//             borderSide: BorderSide.none),
//       ),
//     );
//   }

//   Widget _errorMessage() {
//     return Text(errorMesage == '' ? '' : 'Oops, $errorMesage');
//   }

//   Widget _submitButton() {
//     return ElevatedButton(
//       onPressed:
//           isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
//       child: Text(isLogin ? 'Login' : 'Register'),
//     );
//   }

//   Widget _loginOrRegisterBtn() {
//     return TextButton(
//       onPressed: () {
//         setState(() {
//           isLogin = !isLogin;
//         });
//       },
//       child: Text(isLogin
//           ? 'Doesnt have an account ? Register here'
//           : 'Already has an account ? Login here'),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.only(right: 30.0, left: 30.0),
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           color: Color.fromRGBO(36, 131, 21, 1),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Welcome!',
//               style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//             ),
//             const SizedBox(height: 20),
//             const Image(
//               image: AssetImage('assets/images/tone.png'),
//               height: 30,
//               width: 20,
//             ),
//             Text(
//               isLogin ? 'Login' : 'Register',
//               style: Theme.of(context)
//                   .textTheme
//                   .titleLarge!
//                   .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
//             ),
//             Text(
//               'Email!',
//               style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//             ),
//             SizedBox(
//               height: 20,
//               child: _entryField('Email', _controllerEmail),
//             ),
//             Text(
//               'Password!',
//               style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//             ),
//             SizedBox(
//               height: 20,
//               child: _entryField('Password', _controllerPassword),
//             ),
//             _errorMessage(),
//             _submitButton(),
//             _loginOrRegisterBtn(),
//           ],
//         ),
//       ),
//     );
//   }
// }
