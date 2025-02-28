import 'package:go_router/go_router.dart';
import 'package:pokedexapp/modules/favorites/favorite_screen.dart';
import 'package:pokedexapp/shared/modules/pokemon/dominio/entidades/entidad_pokemon.dart';
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
      path: ConstNameRouter.favorites,
      builder: (context, state) {
        return FavoriteScreen();
      },
    ),
  ],
);
