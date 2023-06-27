import 'package:catatanmenjahit/page/login/register.dart';
import 'package:flutter/material.dart';
import '../beranda.dart';
import 'sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoginButtonEnabled = false;
  bool _isRememberMeChecked = false;

  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  void _toggleRememberMe(bool value) {
    setState(() {
      _isRememberMeChecked = value;
    });
  }

  void _validateLoginInput() {
    setState(() {
      _isLoginButtonEnabled = _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateLoginInput);
    _passwordController.addListener(_validateLoginInput);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 191, 234, 187),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/img/logo.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 30),
                Center(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    child: Card(
                      color: const Color.fromARGB(255, 216, 245, 214),
                      elevation: 5,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 20),
                            Row(
                              children: const <Widget>[
                                Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: _emailController,
                                style: const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(color: Colors.black),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: _passwordController,
                                style: const TextStyle(color: Colors.black),
                                obscureText: _isObscure,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle:
                                      const TextStyle(color: Colors.black),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: _toggleObscure,
                                    icon: Icon(
                                      _isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: _isRememberMeChecked,
                                  onChanged: (value) => _toggleRememberMe(true),
                                ),
                                const Text(
                                  'Remember Me',
                                  style: TextStyle(color: Colors.black),
                                ),
                                const Spacer(),
                                const SizedBox(height: 40),
                                SizedBox(
                                  width: 100,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: _isLoginButtonEnabled
                                        ? () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomePage(),
                                              ),
                                            );
                                          }
                                        : null,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          bottomLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                const Center(
                  child: Text(
                    "Or connect using",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 20),
                _signInButton(),
                const SizedBox(height: 50),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Dont have an account? ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return OutlinedButton(
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ),
            );
          }
        });
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        side: const BorderSide(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/img/google.png',
              height: 25.0,
            ),
            const SizedBox(width: 10),
            const Text(
              'Google',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
