import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherly/Theme/theme.dart';
import 'package:weatherly/Utils/size_utils.dart';
import 'package:weatherly/controller/theme_controller.dart';
import 'package:weatherly/views/weather_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
Future<void> main() async {

  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Sizer(
        builder: (context, orientation, deviceType) {
          return child ?? const SizedBox();
        },
      ),
      home: const WeatherPage(),
    );
  }
}
