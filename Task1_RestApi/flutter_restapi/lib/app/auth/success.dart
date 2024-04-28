import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  Success({Key? key}) : super(key: key);
  static String id = 'Success';

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('The account has been created successfully. Now you can log in.'),
          ),
          MaterialButton(
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: (){
              Navigator.of(context).pushNamedAndRemoveUntil('LogIn', (route) => false);
            }, 
            child: const Text('LogIn'),
            )
        ],
      ),
    );
  }
}