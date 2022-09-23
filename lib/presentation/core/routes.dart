import 'package:flutter/material.dart';

import 'package:rhapsave_app/presentation/screens/dashborad.dart';

class Routes {
  const Routes._();
  static const dashboard = "/";
  static const account = "/account";

  static Map<String, Widget Function(BuildContext)> routes = {
    dashboard: (context) => const DashboardScreen(),
  };
}
