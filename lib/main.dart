import 'package:calclutor/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'cores/calc_repo.dart';
import 'models/calc_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CalculationModelAdapter());
  final calcRepo = CalcRepo();
  await calcRepo.init();
  runApp(MyApp(
    calcRepo: CalcRepo(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required CalcRepo calcRepo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:  HomePage(),
    );
  }
}
