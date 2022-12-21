// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import 'package:registration_demo/feature/register/view/view.dart';

// Project imports:

@MaterialAutoRouter(
  preferRelativeImports: false,
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      initial: true,
      page: RegisterPage,
      path: RegisterPage.routeName,
    ),
    RedirectRoute(path: "*", redirectTo: ""),
  ],
)
class $AppRouter {}
