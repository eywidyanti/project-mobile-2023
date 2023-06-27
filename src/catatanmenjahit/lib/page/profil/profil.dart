import 'package:flutter/material.dart';
import '../login/login_page.dart';
import '../login/sign_in.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  bool isSigningOut = false;

  void signOut() {
    setState(() {
      isSigningOut = true;
    });

    signOutGoogle();

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
          return const LoginPage();
        }),
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 200.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/star.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'NAME:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Text(
                            'EMAIL:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            email,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            width: isSigningOut ? 140 : 170,
                            height: 50,
                            decoration: BoxDecoration(
                              color: isSigningOut
                                  ? Colors.grey[400]
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: ElevatedButton.icon(
                              onPressed: isSigningOut ? null : signOut,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isSigningOut
                                    ? Colors.grey[400]
                                    : Colors.grey[300],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              icon: const Icon(
                                Icons.logout,
                                color: Colors.black,
                              ),
                              label: const Text(
                                'Sign Out',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 150.0,
            child: Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
