import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'screens/note_list.dart';


class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        //FromのKeyに指定する
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Heath Care Mania sin in',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'メールアドレス'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (String value) {
                    if (value?.isEmpty == true) {
                      return 'Eメールアドレスを入力してください';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'パスワード'),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  validator: (String value) {
                    if (value?.isEmpty == true) {
                      return 'パスワードを入力してください';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _onSignIn(),
                    child: const Text('ログイン'),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _onSignUp(),
                    child: const Text('新規登録'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future <void> _onSignIn()  async {
    try {
      if (_formKey.currentState?.validate() != true) {
      return;
    }
      final String email = _emailController.text;
      final String password = _passwordController.text;
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

      Navigator.of(context).pushReplacementNamed("/note_list");

      } catch (e) {
      await showDialog<void>(
        context: context,
        builder: (context){
          return AlertDialog(
            title: const Text('エラー'),
            content: Text(e.toString()),
          );
        }
      );
      }
  }

  Future <void> _onSignUp()  async {
    try {
        if (_formKey.currentState?.validate() != true) {
      return;
    }

    final String email = _emailController.text;
    final String password = _passwordController.text;
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

    Navigator.of(context).pushReplacementNamed("/note_list");

  } catch(e) {
      await showDialog<void>(
        context: context,
        builder: (context){
          return AlertDialog(
            title: const Text('エラー'),
            content: Text(e.toString()),
          );
        }
      );
    }
  }
}
