import 'package:conduit/ui/screen/article/article.detail.screen.dart';
import 'package:conduit/ui/screen/auth/login.screen.dart';
import 'package:conduit/ui/screen/auth/register.screen.dart';
import 'package:conduit/ui/screen/master/master.screen.dart';
import 'package:conduit/ui/screen/master/profile.screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final routerConfig = GoRouter(
    initialLocation: LoginScreen.routeName,
    routes: [
      GoRoute(
        path: LoginScreen.routeName,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RegisterScreen.routeName,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: ArticleDetailScreen.routeName,
        builder: (context, state) => ArticleDetailScreen(
          slug: state.pathParameters['slug'],
        ),
      ),
      GoRoute(
        path: MasterScreen.routeName,
        builder: (context, state) => const MasterScreen(),
      ),
      GoRoute(
        path: ProfileScreen.routeName,
        builder: (context, state) => ProfileScreen(
          username: state.pathParameters['username'],
        ),
      ),
    ],
  );
}
