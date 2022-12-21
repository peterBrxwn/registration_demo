// Package imports:
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:registration_demo/injection.config.dart';

final locator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => await locator.init();
