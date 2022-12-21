// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:registration_demo/core/network/api_client.dart' as _i3;
import 'package:registration_demo/routing/router.gr.dart' as _i4;
import 'package:registration_demo/services/app.module.dart' as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.ApiClient>(() => appModule.apiClient);
    gh.factory<_i4.AppRouter>(() => appModule.appRouter);
    await gh.factoryAsync<_i5.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    return this;
  }
}

class _$AppModule extends _i6.AppModule {}
