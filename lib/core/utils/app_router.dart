import 'package:bookly_app/features/feature_home/presentation/view/book_details_view.dart';
import 'package:bookly_app/features/feature_home/presentation/view/home_screen_view.dart';
import 'package:bookly_app/features/feature_search/presentation/view/search_view.dart';
import 'package:bookly_app/features/feature_splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/HomeScreenView';
  static const kHomeViewDetails = '/BookDetailsView';
  static const kSearchView = '/SearchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'SplashView',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        name: 'HomeScreenView',
        builder: (context, state) => const HomeScreenView(),
      ),
      GoRoute(
        path: kHomeViewDetails,
        name: 'BookDetailsView',
        builder: (context, state) => const BookDetailsView(),
      ),
      GoRoute(
        path: kSearchView,
        name: 'SearchView',
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
