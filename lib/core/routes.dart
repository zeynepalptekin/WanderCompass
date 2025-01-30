import 'package:flutter_app/screens/camera_screen.dart';
import 'package:flutter_app/screens/map_screen.dart';
import 'package:flutter_app/screens/person_screen.dart';
import 'package:flutter_app/screens/search_screen.dart';
import 'package:go_router/go_router.dart';
import '../screens/loading_screen.dart';
import '../screens/home_screen.dart';
import '../screens/register_screen.dart';
import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/settings_screen.dart';

// Router yapılandırması
final router = GoRouter(
  initialLocation: '/', // Başlangıç rotası
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const LoadingScreen(),
      ),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      path: '/settings',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const SettingsScreen(),
      ),
    ),
    GoRoute(
      path: '/person',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const PersonScreen(),
      ),
    ),
    GoRoute(
      path: '/camera',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const CameraScreen(),
      ),
    ),
    GoRoute(
      path: '/map',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const MapScreen(),
      ),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: '/register',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const RegisterScreen(),
      ),
    ),
    GoRoute(
        path: '/search',
        pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: SearchScreen(),
            )),
  ],
);
