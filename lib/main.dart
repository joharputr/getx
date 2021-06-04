import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Controller.dart';

void main() {
  runApp(Home());
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key key}) : super(key: key);
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//
//         ),
//       ),
//     );
//   }
// }

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return GetMaterialApp(
      home: Scaffold(
          // Use Obx(()=> to update Text() whenever count is changed.
          appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

          // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
          body: Center(
              child: ElevatedButton(
                  child: Text("Go to Other"),
                  onPressed: () => Get.to(Other()))),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add), onPressed: c.increment)),
    );
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(body: Center(child: Text("${c.count}")));
  }
}
