import 'package:exlipt_ai_test_task/shared/helper/get_it_service_locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

/// COMMENT: Method registers all classes that use Injectable
@InjectableInit()
void configureDependencies() => getIt.init();
