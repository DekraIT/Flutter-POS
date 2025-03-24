import 'package:auto_route/auto_route.dart';
import 'package:src/core/route/app_router.gr.dart';
import 'package:src/main.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        // HomeScreen is generated as HomeRoute because
        // of the replaceInRouteName property
        AutoRoute(
            page: HomeRoute.page,
            initial: supabaseClient.auth.currentSession != null),
        AutoRoute(page: SecondRoute.page),
        AutoRoute(
          page: PlaceholderRoute.page,
          initial: supabaseClient.auth.currentSession == null,
        ),

        AutoRoute(
          page: SplashRouteRoute.page,
        ),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
