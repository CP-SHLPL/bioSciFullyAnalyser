import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_biosci_faa_proj/generated/login/login.pb.dart';

class UserNotifier extends Notifier<LoginResponse?> {
  @override
  LoginResponse? build() => null;

  void setUser(LoginResponse user) {
    state = user;
  }
}

final userProvider = NotifierProvider<UserNotifier, LoginResponse?>(() {
  return UserNotifier();
});
