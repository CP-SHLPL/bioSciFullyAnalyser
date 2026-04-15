import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';
import '../config/app_config.dart';

// 1. Provide the current environment config
// You can easily change this to AppConfig.local or AppConfig.prod
final configProvider = Provider<AppConfig>((ref) => AppConfig.dev);

// 2. Build the shared ClientChannel based on the config
final grpcChannelProvider = Provider<ClientChannel>((ref) {
  final config = ref.watch(configProvider);

  final channel = ClientChannel(
    config.grpcHost,
    port: config.grpcPort,
    options: ChannelOptions(
      credentials: config.secureChannel 
          ? const ChannelCredentials.secure() 
          : const ChannelCredentials.insecure(),
    ),
  );

  ref.onDispose(() => channel.shutdown());
  return channel;
});