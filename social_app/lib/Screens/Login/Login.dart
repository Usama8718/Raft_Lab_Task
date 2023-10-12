import 'package:flutter/material.dart';
import 'package:social_app/Screens/Home/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurple,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(30),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(30),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  hintText: "User Name",
                  labelText: "User Name",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextFormField(
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    hintText: "Password",
                    labelText: "Password",
                    prefixIcon: Icon(Icons.remove_red_eye_rounded)),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              height: 40,
              width: MediaQuery.of(context).size.width / 2,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.deepPurpleAccent),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => HomeScreen(),
                    ),
                  );
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
