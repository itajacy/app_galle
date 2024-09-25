//*   criado por itajacy em 03/02/2024
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galle/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(const App());
}
