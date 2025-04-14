import 'package:flutter/material.dart';
import 'homePage.dart';

void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Rental App',
      theme: ThemeData(useMaterial3: true),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _darkMode = true;
  bool _isLoading = false;

  void _login() {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _isLoading = false);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _darkMode ? Colors.black : const Color(0xFFBCABAE),
      appBar: _buildAppBar(),
      body: Center(child: _buildLoginContainer()),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Movie Rental App', style: TextStyle(color: Colors.white)),
      backgroundColor: _darkMode ? Colors.grey[900] : const Color(0xFF66D7D1),
      actions: [
        const Text('Light mode', style: TextStyle(color: Colors.white)),
        IconButton(
          icon: Icon(_darkMode ? Icons.dark_mode : Icons.light_mode, color: Colors.white),
          onPressed: () => setState(() => _darkMode = !_darkMode),
        ),
      ],
    );
  }


  Widget _buildLoginContainer() {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _darkMode ? Colors.grey[900] : const Color(0xFF66D7D1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.deepPurple, spreadRadius: 6, blurRadius: 7, offset: Offset(2, 3)),
        ],
      ),
      child: Column(

        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTextField(controller: _usernameController, hintText: 'Username'),
          const SizedBox(height: 10),
          _buildTextField(controller: _passwordController, hintText: 'Password', obscureText: true),
          const SizedBox(height: 20),
          _isLoading ? const CircularProgressIndicator() : _buildLoginButton(),
        ],
      ),
    );
  }


  Widget _buildTextField({required TextEditingController controller, required String hintText, bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
      ),
    );
  }


  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: _login,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: const Text("Login", style: TextStyle(color: Colors.white)),
    );
  }
}
