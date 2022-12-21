// Flutter imports:
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);
  static const routeName = 'dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'You are logged in!',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
