import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/grpc_channel.dart';
import '../../../generated/login/login.pbgrpc.dart'; // Your generated file

final loginServiceProvider = Provider<LoginClient>((ref) {
  // Grab the global channel
  final channel = ref.watch(grpcChannelProvider);
  
  // Return the specific service stub for this feature
  return LoginClient(channel);
});