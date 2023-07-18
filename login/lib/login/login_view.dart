import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('LOGIN'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(1000.0),
                  child: Image.asset(
                    'asset/OIP.jpg',
                    fit: BoxFit.cover,
                  ),
                )

            ),
            Container(
                child:  Text('Quang Thái',
                  style: TextStyle(
                    fontSize: 52,
                    fontFamily: 'Pacifico-Regular',
                    color: Colors.white,
                  ),),
              ),
            Container(
              child:  Text('FLUTTER DEVELOPER',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'SourceSansPro',
                  color: Colors.black26,
                  fontWeight: FontWeight.bold,
                ),),
            ),
          ],
        )
      ),
    );
  }
}
