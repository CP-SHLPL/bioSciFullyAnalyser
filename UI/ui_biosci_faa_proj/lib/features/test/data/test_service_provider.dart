import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_biosci_faa_proj/generated/test/test.pbgrpc.dart';
import '../../../core/network/grpc_channel.dart';

final testServiceProvider = Provider<TestClient>((ref) {
  // Grab the global channel
  final channel = ref.watch(grpcChannelProvider);
  
  // Return the specific service stub for this feature
  return TestClient(channel);
});