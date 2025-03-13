import 'package:ar/database_handler/database_service.dart';
import 'package:ar/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  await DataBaseHandler.instance.init("MyBox");
  runApp(MyApp(camera: cameras.first));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;
  const MyApp({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(camera: camera),
    );
  }
}

