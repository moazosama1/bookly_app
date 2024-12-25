import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/feature_auth/data/model/user.dart';
import 'package:bookly_app/features/feature_auth/presentation/view/auth_view.dart';
import 'package:bookly_app/features/feature_auth/presentation/view/reset_password_view.dart';
import 'package:bookly_app/features/feature_home/data/favorite/repo/favorite_repo_impl.dart';
import 'package:bookly_app/features/feature_home/presentation/view/book_details_view.dart';
import 'package:bookly_app/features/feature_home/presentation/view/book_saved_view.dart';
import 'package:bookly_app/features/feature_home/presentation/view/home_screen_view.dart';
import 'package:bookly_app/features/feature_home/presentation/view_model/featured_favorite_cubit/favorite_cubit.dart';
import 'package:bookly_app/features/feature_home/presentation/view_model/featured_similar_book_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/feature_search/data/repo/search_repo_implementation.dart';
import 'package:bookly_app/features/feature_search/presentation/view/search_view.dart';
import 'package:bookly_app/features/feature_search/presentation/view_model/search_books_cubit.dart';
import 'package:bookly_app/features/feature_settings/presentation/view/setting_view.dart';
import 'package:bookly_app/features/feature_splash/presentation/view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/feature_auth/presentation/view/login_view.dart';
import '../../features/feature_auth/presentation/view/register_view.dart';
import '../../features/feature_home/data/home/repos/home_repo_implementation.dart';
import '../models/BookModel.dart';

abstract class AppRouter {
  static const kHomeView = '/HomeScreenView';
  static const kHomeViewDetails = '/BookDetailsView';
  static const kSearchView = '/SearchView';
  static const kBookSavedView = '/BookSavedView';
  static const kAuthView = '/AuthView';
  static const kLoginView = '/LoginView';
  static const kRegisterView = '/RegisterView';
  static const kSettingView = '/SettingView';
  static const kResetPasswordView= '/ResetPasswordView';
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
        builder: (context, state) => BlocProvider(
          create: (context) =>
              SimilarBooksCubit(homeRepo: getIt.get<HomeRepoImplementation>()),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        name: 'SearchView',
        builder: (context, state) => BlocProvider(
          create: (context) => SearchBooksCubit(
              searchRepo: getIt.get<SearchRepoImplementation>()),
          child: SearchView(),
        ),
      ),
      GoRoute(
        path: kBookSavedView,
        name: 'BookSavedView',
        builder: (context, state) => BookSavedView(
          listIds: state.extra as List<String>,
        ),
      ),
      GoRoute(
        path: kAuthView,
        name: 'AuthView',
        builder: (context, state) => AuthView(),
      ),
      GoRoute(
        path: kLoginView,
        name: 'LoginView',
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        name: 'RegisterView',
        builder: (context, state) => RegisterView(),
      ),
      GoRoute(
        path: kSettingView,
        name: 'SettingView',
        builder: (context, state) => SettingView(userModel: state.extra as UserModel,),
      ),
      GoRoute(
        path: kResetPasswordView,
        name: 'ResetPasswordView',
        builder: (context, state) => ResetPasswordView(),
      ),
    ],
  );
}
