import 'package:flutter_app/screens/camera_screen.dart';
import 'package:flutter_app/screens/map_screen.dart';
import 'package:flutter_app/screens/person_screen.dart';
import 'package:flutter_app/screens/search_screen.dart';
import 'package:go_router/go_router.dart';
import '../screens/loading_screen.dart';
import '../screens/home_screen.dart';
// ignore: unused_import
import 'package:flutter/material.dart';

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
        path: '/search',
        pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const SearchScreen(),
            )),
  ],
);
