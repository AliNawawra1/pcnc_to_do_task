import 'package:flutter/material.dart';
import 'package:pcnc_todo_task/data/database/database_provider.dart';
import 'presentation/login/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  await DatabaseProvider.instance.init();
  runApp(LoginScreen());
}