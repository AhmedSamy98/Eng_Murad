import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restapi/componetes/crud.dart';
import 'package:flutter_restapi/componetes/customtextform.dart';
import 'package:flutter_restapi/componetes/valid.dart';
import 'package:flutter_restapi/constant/linkapi.dart';
import 'package:flutter_restapi/main.dart';

class LogIn extends StatefulWidget {
  LogIn({Key? key}) : super (key: key);
  static String id = 'LogIn';

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Crud crud = Crud();

  bool isLoading = false;

  login() async {
    if (formstate.currentState!.validate()){
      isLoading = true;
      setState(() {
        
      });
      var response = await crud.postRequest(
        linkLogIn, {"email" : email.text,"passowrd" : password.text});
        isLoading = false;
        setState(() {});
      if(response['state'] == 'success'){
        sharedPref.setString("id", response['data']['id'].toString());
        sharedPref.setString("username", response['data']['username']);
        sharedPref.setString("email", response['data']['email']);
        Navigator.of(context).pushNamedAndRemoveUntil("Home", (route) => false);
      }
    } else{
      AwesomeDialog(
        context: context,
        title: "تنبيه", 
        body: Text("البريد الالكتروني أو كلمه المرور خاطئه أو الحساب غير موجود"))
      ..show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == true 
      ? Center(child: CircularProgressIndicator(),) 
      : Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Form(
              key: formstate,
              child: Column(
                children: [
                  Image.asset('images/store.png', width: 200, height: 200,),
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
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                    onPressed: () async {
                      await login();
                    },
                    child: Text('LogIn'),
                    ),
                    Container(height: 10,),
                    InkWell(
                      child: Text('SignUp'),
                      onTap: (){
                        Navigator.of(context).pushNamed('SignUp');
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