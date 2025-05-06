import 'package:flutter/material.dart';
import 'loginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // logging
  // final movies = await MovieService().getMovies();
  // final moviesByCategory = await MovieService().getMoviesByGenre("trending");
  // print(moviesByCategory);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoginPage(),
    );
  }
}
