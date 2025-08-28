import 'package:go_router/go_router.dart';
import 'package:medb_task/screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(path: "/home", builder: (context, state) => const HomeScreen()),
  ],
);
