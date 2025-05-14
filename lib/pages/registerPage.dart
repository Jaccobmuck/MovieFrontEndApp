import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/authService.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _role = 'User';
  bool _darkMode = true;
  bool _isLoading = false;

  void _register() async {
    setState(() => _isLoading = true);
    final success = await AuthService().register(
      _usernameController.text,
      _passwordController.text,
      _role,
    );
    setState(() => _isLoading = false);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registration successful')));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registration failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _darkMode ? Colors.black : const Color(0xFFBCABAE),
      appBar: AppBar(
        title: const Text('Register', style: TextStyle(color: Colors.white)),
        backgroundColor: _darkMode ? Colors.grey[900] : const Color(0xFF66D7D1),
        actions: [
          const Text('Light mode', style: TextStyle(color: Colors.white)),
          IconButton(
            icon: Icon(_darkMode ? Icons.dark_mode : Icons.light_mode, color: Colors.white),
            onPressed: () => setState(() => _darkMode = !_darkMode),
          ),
        ],
      ),
      body: Center(
        child: Container(
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
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _role,
                dropdownColor: _darkMode ? Colors.grey[800] : Colors.white,
                decoration: InputDecoration(
                  labelText: 'Role',
                  labelStyle: const TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  border: const OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.white),
                items: ['User', 'Admin', 'Guest']
                    .map((role) => DropdownMenuItem(value: role, child: Text(role)))
                    .toList(),
                onChanged: (value) => setState(() => _role = value!),
              ),
              const SizedBox(height: 20),
              _isLoading ? const CircularProgressIndicator() : _buildRegisterButton(),
            ],
          ),
        ),
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

  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: _register,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: const Text("Register", style: TextStyle(color: Colors.white)),
    );
  }
}
