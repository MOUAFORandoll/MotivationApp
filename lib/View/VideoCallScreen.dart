// // Copyright 2013 The Flutter Authors. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.

// // ignore_for_file: public_member_api_docs

// import 'dart:async';
// import 'dart:convert' show json;

// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:http/http.dart' as http;

// GoogleSignIn _googleSignIn = GoogleSignIn(
//   // Optional clientId
//   // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
//   scopes: <String>[
//     'email',
//     'https://www.googleapis.com/auth/contacts.readonly',
//   ],
// );

// void main() {
//   runApp(
//     MaterialApp(
//       title: 'Google Sign In',
//       home: SignInDemo(),
//     ),
//   );
// }

// class SignInDemo extends StatefulWidget {
//   @override
//   State createState() => SignInDemoState();
// }

// class SignInDemoState extends State<SignInDemo> {
//   GoogleSignInAccount? _currentUser;
//   String _contactText = '';

//   @override
//   void initState() {
//     super.initState();
//     _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
//       setState(() {
//         _currentUser = account;
//       });
//       if (_currentUser != null) {
//         _handleGetContact(_currentUser!);
//       }
//     });
//     _googleSignIn.signInSilently();
//   }

//   Future<void> _handleGetContact(GoogleSignInAccount user) async {
//     setState(() {
//       _contactText = 'Loading contact info...';
//     });
//     final http.Response response = await http.get(
//       Uri.parse('https://people.googleapis.com/v1/people/me/connections'
//           '?requestMask.includeField=person.names'),
//       headers: await user.authHeaders,
//     );
//     if (response.statusCode != 200) {
//       setState(() {
//         _contactText = 'People API gave a ${response.statusCode} '
//             'response. Check logs for details.';
//       });
//       print('People API ${response.statusCode} response: ${response.body}');
//       return;
//     }
//     final Map<String, dynamic> data =
//         json.decode(response.body) as Map<String, dynamic>;
//     final String? namedContact = _pickFirstNamedContact(data);
//     setState(() {
//       if (namedContact != null) {
//         _contactText = 'I see you know $namedContact!';
//       } else {
//         _contactText = 'No contacts to display.';
//       }
//     });
//   }

//   String? _pickFirstNamedContact(Map<String, dynamic> data) {
//     final List<dynamic>? connections = data['connections'] as List<dynamic>?;
//     final Map<String, dynamic>? contact = connections?.firstWhere(
//       (dynamic contact) => contact['names'] != null,
//       orElse: () => null,
//     ) as Map<String, dynamic>?;
//     if (contact != null) {
//       final Map<String, dynamic>? name = contact['names'].firstWhere(
//         (dynamic name) => name['displayName'] != null,
//         orElse: () => null,
//       ) as Map<String, dynamic>?;
//       if (name != null) {
//         return name['displayName'] as String?;
//       }
//     }
//     return null;
//   }

//   Future<void> _handleSignIn() async {
//     try {
//       await _googleSignIn.signIn();
//     } catch (error) {
//       print(error);
//     }
//   }

//   Future<void> _handleSignOut() => _googleSignIn.disconnect();

//   Widget _buildBody() {
//     final GoogleSignInAccount? user = _currentUser;
//     if (user != null) {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           ListTile(
//             leading: GoogleUserCircleAvatar(
//               identity: user,
//             ),
//             title: Text(user.displayName ?? ''),
//             subtitle: Text(user.email),
//           ),
//           const Text('Signed in successfully.'),
//           Text(_contactText),
//           ElevatedButton(
//             child: const Text('SIGN OUT'),
//             onPressed: _handleSignOut,
//           ),
//           ElevatedButton(
//             child: const Text('REFRESH'),
//             onPressed: () => _handleGetContact(user),
//           ),
//         ],
//       );
//     } else {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           const Text('You are not currently signed in.'),
//           ElevatedButton(
//             child: const Text('SIGN IN'),
//             onPressed: _handleSignIn,
//           ),
//         ],
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Google Sign In'),
//         ),
//         body: ConstrainedBox(
//           constraints: const BoxConstraints.expand(),
//           child: _buildBody(),
//         ));
//   }
// }

// GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: [
//     'email',
//     'https://www.googleapis.com/auth/contacts.readonly',
//   ],
// );

// Future<void> _handleSignIn() async {
//   try {
//     await _googleSignIn.signIn();
//   } catch (error) {
//     print(error);
//   }
// }



// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final plugin = FacebookLogin(debug: true);

//   MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHome(plugin: plugin),
//     );
//   }
// }

// class MyHome extends StatefulWidget {
//   final FacebookLogin plugin;

//   const MyHome({Key? key, required this.plugin}) : super(key: key);

//   @override
//   _MyHomeState createState() => _MyHomeState();
// }

// class _MyHomeState extends State<MyHome> {
//   String? _sdkVersion;
//   FacebookAccessToken? _token;
//   FacebookUserProfile? _profile;
//   String? _email;
//   String? _imageUrl;

//   @override
//   void initState() {
//     super.initState();

//     _getSdkVersion();
//     _updateLoginInfo();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isLogin = _token != null && _profile != null;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login via Facebook example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
//         child: Center(
//           child: Column(
//             children: <Widget>[
//               if (_sdkVersion != null) Text('SDK v$_sdkVersion'),
//               if (isLogin)
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 10),
//                   child: _buildUserInfo(context, _profile!, _token!, _email),
//                 ),
//               isLogin
//                   ? OutlinedButton(
//                       child: const Text('Log Out'),
//                       onPressed: _onPressedLogOutButton,
//                     )
//                   : OutlinedButton(
//                       child: const Text('Log In'),
//                       onPressed: _onPressedLogInButton,
//                     ),
//               if (!isLogin && Platform.isAndroid)
//                 OutlinedButton(
//                   child: const Text('Express Log In'),
//                   onPressed: () => _onPressedExpressLogInButton(context),
//                 )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildUserInfo(BuildContext context, FacebookUserProfile profile,
//       FacebookAccessToken accessToken, String? email) {
//     final avatarUrl = _imageUrl;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (avatarUrl != null)
//           Center(
//             child: Image.network(avatarUrl),
//           ),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             const Text('User: '),
//             Text(
//               '${profile.firstName} ${profile.lastName}',
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//         const Text('AccessToken: '),
//         Text(
//           accessToken.token,
//           softWrap: true,
//         ),
//         if (email != null) Text('Email: $email'),
//       ],
//     );
//   }

//   Future<void> _onPressedLogInButton() async {
//     await widget.plugin.logIn(permissions: [
//       FacebookPermission.publicProfile,
//       FacebookPermission.email,
//     ]);
//     await _updateLoginInfo();
//   }

//   Future<void> _onPressedExpressLogInButton(BuildContext context) async {
//     final res = await widget.plugin.expressLogin();
//     if (res.status == FacebookLoginStatus.success) {
//       await _updateLoginInfo();
//     } else {
//       await showDialog<Object>(
//         context: context,
//         builder: (context) => const AlertDialog(
//           content: Text("Can't make express log in. Try regular log in."),
//         ),
//       );
//     }
//   }

//   Future<void> _onPressedLogOutButton() async {
//     await widget.plugin.logOut();
//     await _updateLoginInfo();
//   }

//   Future<void> _getSdkVersion() async {
//     final sdkVersion = await widget.plugin.sdkVersion;
//     setState(() {
//       _sdkVersion = sdkVersion;
//     });
//   }

//   Future<void> _updateLoginInfo() async {
//     final plugin = widget.plugin;
//     final token = await plugin.accessToken;
//     FacebookUserProfile? profile;
//     String? email;
//     String? imageUrl;

//     if (token != null) {
//       profile = await plugin.getUserProfile();
//       if (token.permissions.contains(FacebookPermission.email.name)) {
//         email = await plugin.getUserEmail();
//       }
//       imageUrl = await plugin.getProfileImageUrl(width: 100);
//     }

//     setState(() {
//       _token = token;
//       _profile = profile;
//       _email = email;
//       _imageUrl = imageUrl;
//     });
//   }
// }
