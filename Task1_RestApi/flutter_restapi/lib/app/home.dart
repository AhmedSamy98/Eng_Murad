import 'package:flutter/material.dart';
import 'package:flutter_restapi/main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static String id = 'Home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text('Home'),
        actions: [
          IconButton(
            onPressed: (){
              sharedPref.clear();
              Navigator.of(context).pushNamedAndRemoveUntil("LogIn", (route) => false);
            }, 
            icon: (Icon(Icons.exit_to_app)))
        ],
        // leading: IconButton(
        //   onPressed: () async {},
        //   icon: const Icon(
        //     Icons.output,
        //     color: Colors.black26,
        //   ),
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            InkWell(
              onTap: () {},
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        "assets/logo.png",
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const Expanded(
                      flex: 2,
                      child: ListTile(
                        title: Text('Title Note'),
                        subtitle: Text('Content Note'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
