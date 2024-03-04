import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';
import 'package:shop_app_flutter/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(
          fontFamily: 'Nunito',
          colorScheme: const ColorScheme.dark(
              //seedColor: const Color.fromRGBO(255, 0, 0, 1),
              ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 5,
            shadowColor: Colors.black,
            surfaceTintColor: Colors.white,
            titleTextStyle: TextStyle(
              fontSize: 20,
            ),
          ),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
