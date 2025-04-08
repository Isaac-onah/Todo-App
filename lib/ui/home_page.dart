
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/services/notificationservices.dart';
import 'package:todo/services/themeservices.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var notifyHelper;

  @override
  void initState(){
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
    print('object');
  }


  @override
  Widget build(BuildContext context) {
    ///-------------------
    /// tHIS FUNCTIONA IS TO HELP THE USER LOG INTO THE SYSTEM EFFECTIVLY
    ///
    /// ------------------
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            'counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _appBar(){
    return AppBar(
        leading: GestureDetector(
          onTap: (){
            ThemeServices().switchTheme();
            notifyHelper.displayNotification(
              title: "Theme Changed",
              body: Get.isDarkMode ? "Activated Light Mode" : "Activated Dark Theme",
            );
            notifyHelper.scheduledNotification();
          },
          child: Icon(Icons.nightlight_round),
        ),
      actions: [
        Icon(Icons.person),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}