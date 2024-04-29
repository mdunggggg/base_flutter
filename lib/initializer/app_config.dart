import '../presentation/di/di.dart' as di;
import 'app_initializer.dart';

class AppConfig extends ApplicationConfig {
  factory AppConfig.getInstance() {
    return _instance;
  }

  AppConfig._();

  static final AppConfig _instance = AppConfig._();
  @override
  Future<void> config() async {
    await di.configureDependencies();
  }
}