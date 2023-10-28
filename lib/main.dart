import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:starter/core/routes/app_router.dart';
import 'package:starter/core/theme/app_theme.dart';
import 'package:starter/di/di_setup.dart';
import 'package:starter/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:starter/observer.dart';

/// Navigator key
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await configureDependencies();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<PostsBloc>(
          create: (context) => getIt<PostsBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

/// My app Widget
class MyApp extends StatefulWidget {
  /// Constructor
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  /// App router instance
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,
      debugShowCheckedModeBanner: false,
      key: navigatorKey,
      routerConfig: appRouter.router,
    );
  }
}
