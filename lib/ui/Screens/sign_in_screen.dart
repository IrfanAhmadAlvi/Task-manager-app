import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ScreenBackground(child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(children: [
          Text('Get Started With'),
          TextFormField(),
          TextFormField(),
          ElevatedButton(onPressed: (){}, child: Icon(Icons.arrow_circle_right_outlined)),

        ],

        ),
      )),


    );
  }
}
