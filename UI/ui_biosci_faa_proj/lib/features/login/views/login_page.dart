import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';
import 'package:ui_biosci_faa_proj/core/widgets/my_text_field.dart';
import 'package:ui_biosci_faa_proj/generated/login/login.pb.dart';
import '../data/login_service_provider.dart';// For request/response objects
import '../../home/views/home_page.dart';
import '../../user/providers/user_provider.dart';
import 'package:ui_biosci_faa_proj/core/widgets/my_toast.dart';


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

    if (username.isEmpty || password.isEmpty) {
      if (mounted) {
        MyToast.error(context, title: 'Username and password cannot be empty');
      }
      return;
    };

    try {
      final request = LoginRequest()..username = username;
      request.password = password;  
      final response = await loginService.loginAttempt(request);
      
      if (response.userID < 0) {
        if (mounted) {
          MyToast.error(context, title: 'Login failed', description: 'Invalid username or password');
        }
        _passwordController.clear();
        _passwordFocusNode.requestFocus();
        return;
      }
      else{
        if (mounted) {
          MyToast.success(context, title: 'Login successful');
        }
      }

      ref.read(userProvider.notifier).setUser(response);

      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage()
          ),
        );
      }
    } catch (e) {
      if (e is GrpcError && e.code == 14) {
        MyToast.error(context, title: 'Error', description: 'Error: Please Retry');
      }
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
                child: MyTextField(
                  controller: _usernameController,
                  labelText: 'Username',
                  prefixIcon: const Icon(Icons.person),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Username cannot be empty';
                    }
                    return null;
                  },
                  helperText: "Enter your username",
                  maxLength: 40,
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
                child: MyTextField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  labelText: 'Password',
                  prefixIcon: Icon( Icons.lock_rounded, size: Theme.of(context).textTheme.bodyLarge?.fontSize),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Password cannot be empty';
                    }
                    return null;
                  },
                  helperText: "Enter your password",
                  maxLength: 40,
                  obscureText: true,
                  onSubmitted: (value) => _login(),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
          const SizedBox(height: 40),
          Center(
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
