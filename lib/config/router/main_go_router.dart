import 'package:go_router/go_router.dart';
import 'package:weather_app/presentation/screens/screens.dart';

class MainGoRouter {
  MainGoRouter() {
    _initRouter();
  }

  late GoRouter _router;

  GoRouter get router => _router;

  _initRouter() {
    _router = GoRouter(
      routes: <GoRoute>[
        GoRoute(
          path: "/",
          builder: (context, state) => const HomePage(),
        )
      ],
    );
  }
}
