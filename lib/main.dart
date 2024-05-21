import 'package:conduit/data/provider/article.provider.dart';
import 'package:conduit/data/provider/comment.provider.dart';
import 'package:conduit/data/provider/favorite.provider.dart';
import 'package:conduit/data/provider/master.provider.dart';
import 'package:conduit/data/provider/profile.provider.dart';
import 'package:conduit/data/provider/user.provider.dart';
import 'package:conduit/util/constants.dart';
import 'package:conduit/util/routes.dart';
import 'package:conduit/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ArticleProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => CommentProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => MasterProvider()),
      ],
      child: MaterialApp.router(
        title: Constants.appName,
        theme: AppTheme.appTheme,
        routerConfig: AppRoutes.routerConfig,
      ),
    );
  }
}
