import 'package:go_router/go_router.dart';
import '../../modules/details/screen_details.dart';
import '../../modules/home/screen_home.dart';
import '../constants/const_name_router.dart';
import '../services/service_navigation.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: ServiceNavigation.navigatorKey,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return ScreenHome();
      },
    ),
    GoRoute(
      path: ConstNameRouter.details,
      builder: (context, GoRouterState state) {
        return PokemonDetails();
      },
    ),
  ],
);
