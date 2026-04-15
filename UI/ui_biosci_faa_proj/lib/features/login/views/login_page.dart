import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_biosci_faa_proj/generated/login/login.pb.dart';
import '../data/login_service_provider.dart';// For request/response objects
import '../../home/views/home_page.dart';
import '../../user/providers/user_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();

  Future<void> _login() async {
    final loginService = ref.read(loginServiceProvider);
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim(); 

    if (username.isEmpty || password.isEmpty) return;

    try {
      final request = LoginRequest()..username = username;
      request.password = password;  
      final response = await loginService.loginAttempt(request);
      
      if (response.userID < 0) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login unsuccessful'),
              duration: const Duration(seconds: 1),
              backgroundColor: Theme.of(context).colorScheme.error,
              ),
          );
        }
        _passwordController.clear();
        _passwordFocusNode.requestFocus();
        return;
      }

      ref.read(userProvider.notifier).setUser(response);

      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage()
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
      print('gRPC Error: $e');  
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    	body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text( 
            'Login',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Expanded(
                flex: 2,
                child: TextField(
                  controller: _usernameController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: 'Username',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Expanded(
                flex: 2,
                child: TextField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  onSubmitted: (value) => _login(),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
          const SizedBox(height: 40),
          Center(
            // child: ElevatedButton.icon(
            //   onPressed: _login,
            //   style: const ButtonStyle(
            //     enableFeedback: true,

            //   ),
            //   icon: Icon(Icons.login, size: Theme.of(context).textTheme.bodyLarge?.fontSize ?? 24),
            //   label: Text('Login', style: Theme.of(context).textTheme.bodyLarge),
            // ),
            child: ActionChip(
              onPressed: _login,
              avatar: Icon(Icons.save_alt_rounded, size: Theme.of(context).textTheme.bodyLarge?.fontSize ?? 24),
              label: Text('Login', style: Theme.of(context).textTheme.bodyLarge),
            ),
          ),
        ],
      ),
    );
  }
}
