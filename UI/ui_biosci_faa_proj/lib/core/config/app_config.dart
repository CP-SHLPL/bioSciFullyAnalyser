enum Environment { dev, staging, prod }

class AppConfig {
  final String grpcHost;
  final int grpcPort;
  final bool secureChannel;

  const AppConfig({
    required this.grpcHost,
    required this.grpcPort,
    this.secureChannel = true,
  });

  // Define your different environments here
  static const dev = AppConfig(
    grpcHost: '127.0.0.1',
    grpcPort: 7161,
    secureChannel: true,
  );

  static const local = AppConfig(
    grpcHost: '127.0.0.1', // Localhost for Android Emulator
    grpcPort: 5027,
    secureChannel: false,
  );

  static const prod = AppConfig(
    grpcHost: 'api.yourdomain.com',
    grpcPort: 443,
    secureChannel: true,
  );
}