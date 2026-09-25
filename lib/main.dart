import 'package:flutter/widgets.dart';
import 'package:thaheen_task/app/app.dart';
import 'package:thaheen_task/app/di/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const ThaheenApp());
}
