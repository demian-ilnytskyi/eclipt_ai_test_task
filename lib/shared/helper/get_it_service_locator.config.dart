// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:exlipt_ai_test_task/shared/bloc/authentication/authentication_bloc.dart'
    as _i115;
import 'package:exlipt_ai_test_task/shared/data_provider/cache_provider.dart'
    as _i598;
import 'package:exlipt_ai_test_task/shared/data_provider/shared_preferences_provider.dart'
    as _i560;
import 'package:exlipt_ai_test_task/shared/repositories/app_authentication_repository.dart'
    as _i380;
import 'package:exlipt_ai_test_task/shared/repositories/authentication_repository.dart'
    as _i1020;
import 'package:exlipt_ai_test_task/shared/repositories/firebase_module.dart'
    as _i494;
import 'package:exlipt_ai_test_task/shared/shared_dart.dart' as _i533;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseModule = _$FirebaseModule();
    gh.factory<_i598.CacheClient>(() => _i598.CacheClient());
    gh.singleton<_i560.SharedPrefencesProvider>(
      () => _i560.SharedPrefencesProvider(),
    );
    gh.singleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.singleton<_i533.IAppAuthenticationRepository>(
      () => _i380.AppAuthenticationRepository(
        firebaseAuth: gh<_i59.FirebaseAuth>(),
        cache: gh<_i533.CacheClient>(),
      ),
    );
    gh.singleton<_i1020.AuthenticationRepository>(
      () => _i1020.AuthenticationRepository(
        appAuthenticationRepository: gh<_i533.IAppAuthenticationRepository>(),
      ),
      dispose: (i) => i.dispose(),
    );
    gh.singleton<_i115.AuthenticationBloc>(
      () => _i115.AuthenticationBloc(
        authenticationRepository: gh<_i533.AuthenticationRepository>(),
      ),
    );
    return this;
  }
}

class _$FirebaseModule extends _i494.FirebaseModule {}
