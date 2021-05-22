import 'package:flutter/material.dart';
import 'package:lab02/database.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppDatabase database = AppDatabase();
  await database.createDB();
  runApp(MyApp());

}



