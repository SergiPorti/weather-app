import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/config/router/navigation_handler.dart';

class MainNavigationHandler implements NavigationHandler {
  @override
  Future goHome(BuildContext context) async {
    return await GoRouter.of(context).pushReplacement("/");
  }

}