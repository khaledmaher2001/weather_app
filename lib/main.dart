
import 'package:flutter/material.dart';
import 'package:weather_app/shared/network/remote/dio_helper.dart';

import 'modules/home_screen/home_screen.dart';

main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
