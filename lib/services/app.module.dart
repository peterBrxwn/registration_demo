// Package imports:
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:registration_demo/core/network/api_client.dart';
import 'package:registration_demo/routing/router.gr.dart';

@module
abstract class AppModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @injectable
  AppRouter get appRouter => AppRouter();

  @injectable
  ApiClient get apiClient => ApiClient();

  // @injectable
  // ProductImpl get productRepo => ProductImpl(
  //       ProductDatasourceImpl(apiClient: apiClient),
  //     );

  // @injectable
  // TaxonomyImpl get taxonomyRepo => TaxonomyImpl(
  //       TaxonomyDatasourceImpl(apiClient: apiClient),
  //     );
}
