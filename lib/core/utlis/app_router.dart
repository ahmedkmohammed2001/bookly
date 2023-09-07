import 'package:bookly/Featchers/Splash/presentation/views/splash_view.dart';
import 'package:bookly/Featchers/home/data/models/book_model/book_model.dart';
import 'package:bookly/Featchers/home/data/repos/home_repo.dart';
import 'package:bookly/Featchers/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Featchers/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Featchers/home/presentation/views/book_details_view.dart';
import 'package:bookly/Featchers/home/presentation/views/home_view.dart';
import 'package:bookly/Featchers/search/presentation/views/search_view.dart';
import 'package:bookly/core/utlis/Service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kbookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchview';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kbookDetailsView,
        builder: (context, state) =>  BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImple>()),
          child:  BookDetailsView(bookModel: state.extra as BookModel),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const Searchview(),
      ),
    ],
  );
}
