import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/provider/imagePickerProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MyApp.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform
  );
  runApp(
    ChangeNotifierProvider(
      create:(context) => ImagePickerProvider(),
      child:MyApp(),
    )
  );
}


