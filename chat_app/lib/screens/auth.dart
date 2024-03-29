import 'dart:io';

import 'package:chat_app/widgets/user_image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebaseAuth = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLogin = true;
  bool _isAuthenticating = false;
  final _form = GlobalKey<FormState>();

  var _userEmail = '';
  var _userPassword = '';
  var _userUsername = '';
  File? _selectedImage;

  void _submit() async {
    final isValid = _form.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (!isValid) {
      return;
    }

    if (!isValid || !_isLogin && _selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Input valid data or pick an image.'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
      return;
    }

    _form.currentState!.save();

    try {
      setState(() {
        _isAuthenticating = true;
      });
      if (_isLogin) {
        UserCredential credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: _userEmail,
          password: _userPassword,
        );
      } else {
        final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: _userEmail,
          password: _userPassword,
        );

        // submits an selected image to firebase storage
        final ref = FirebaseStorage.instance.ref().child('user_images').child('${userCredential.user!.uid}.jpg');
        await ref.putFile(_selectedImage!);
        final String imageUrl = await ref.getDownloadURL();

        FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
          'email': _userEmail,
          'username': _userUsername,
          'image_url': imageUrl,
        });
      }
    } on FirebaseAuthException catch (error) {
      String message = 'An error occurred, please check your credentials!';
      if (error.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else if (error.code == 'INVALID_LOGIN_CREDENTIALS') {
        message = 'Email or password is incorrect.';
      } else if (error.message != null) {
        message = error.message!;
      }

      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    } catch (error) {
      print(error);
    }

    setState(() {
      _isAuthenticating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      // appBar: AppBar(
      //   title: const Text('FlutterChat'),
      // ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 30,
                bottom: 20,
                left: 20,
                right: 20,
              ),
              width: 200,
              child: Image.asset('assets/images/chat.png'),
            ),
            Card(
              margin: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _form,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (!_isLogin) UserImagePicker(onPickImage: (pickedImage) => _selectedImage = pickedImage),
                        TextFormField(
                          key: const ValueKey('email'),
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email address',
                          ),
                          validator: (value) {
                            return value == null || value.trim().isEmpty || !value.contains('@')
                                ? 'Please enter a valid email address.'
                                : null;
                          },
                          onSaved: (newValue) {
                            _userEmail = newValue!;
                          },
                        ),
                        if (!_isLogin)
                          TextFormField(
                            key: const ValueKey('username'),
                            validator: (value) => value == null || value.trim().isEmpty || value.trim().length < 4
                                ? 'Please enter at least 4 characters.'
                                : null,
                            decoration: const InputDecoration(
                              labelText: 'Username',
                            ),
                            enableSuggestions: false,
                            onSaved: (newValue) => _userUsername = newValue!,
                          ),
                        TextFormField(
                          key: const ValueKey('password'),
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                          validator: (value) {
                            return value == null || value.trim().isEmpty || value.length < 6
                                ? 'Password must be at least 6 characters long.'
                                : null;
                          },
                          onSaved: (newValue) {
                            _userPassword = newValue!;
                          },
                        ),
                        const SizedBox(height: 12),
                        if (_isAuthenticating) const CircularProgressIndicator(),
                        if (!_isAuthenticating)
                          ElevatedButton(
                            onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                            ),
                            child: Text(_isLogin ? 'Login' : 'Signup'),
                          ),
                        if (!_isAuthenticating)
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: Text(_isLogin ? 'Create an account' : 'I already have an account.'),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
