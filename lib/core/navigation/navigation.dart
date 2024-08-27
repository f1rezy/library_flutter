import 'package:auto_route/auto_route.dart';
import 'package:library_flutter/core/navigation/navigation.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page),
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          children: [
            AutoRoute(
              page: MainRoute.page,
            ),
            AutoRoute(
              page: SearchRoute.page,
            ),
            AutoRoute(
              page: ProfileRoute.page,
            ),
          ],
        ),
        AutoRoute(
          page: BookRoute.page,
        ),
        AutoRoute(
          page: FeedbackRoute.page,
        ),
        AutoRoute(
          page: OffersRoute.page,
        ),
        AutoRoute(
          page: OwnershipsRoute.page,
        ),
        AutoRoute(
          page: ReservationsRoute.page,
        ),
      ];
}
