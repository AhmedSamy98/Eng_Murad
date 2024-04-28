import 'package:flutter/material.dart';
import 'package:flutter_restapi/componetes/crud.dart';
import 'package:flutter_restapi/componetes/customtextform.dart';
import 'package:flutter_restapi/componetes/valid.dart';
import 'package:flutter_restapi/constant/linkapi.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super (key: key);
  static String id = 'SignUp';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final Crud _crud = Crud();

  bool isLoading = false;

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signUp() async {
    if(formstate.currentState!.validate()){
      isLoading = true;
    setState(() {
      
    });
    var response = await _crud.postRequest(linkSignUp, {
      "username" : username.text,
      "email" : email.text,
      "password" : password.text,
    });
    isLoading = false;
    setState(() {
      
    });
    if(response['status'] == 'success' ){
      Navigator.of(context).pushNamedAndRemoveUntil('Success', (route) => false);
    } else {
    }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == true 
      ? const Center(child: CircularProgressIndicator(),)
      :Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Form(
              key: formstate,
              child: Column(
                children: [
                  Image.asset('images/store.png', width: 200, height: 200,),
                  CustomTextFormSign(
                    valid: (val){
                      return validInput(val!, 3, 20);
                    },
                    hint: "username", myController: username,
                    ),
                  CustomTextFormSign(
                    valid: (val){
                      return validInput(val!, 5, 40);
                    },
                    hint: "email", myController: email,
                    ),
                  CustomTextFormSign(
                    valid: (val){
                      return validInput(val!, 3, 10);
                    },
                    hint: "password", myController: password,
                    ),
                  MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                    onPressed: () async {
                      await signUp();
                    },
                    child: const Text('SignUp'),
                    ),
                    Container(height: 10,),
                    InkWell(
                      child: const Text('LogIn'),
                      onTap: (){
                        Navigator.of(context).pushReplacementNamed('LogIn');
                      },
                    ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}