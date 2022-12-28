import 'package:core/widgets/button_container.dart';
import 'package:flutter/material.dart';
import 'package:mobile/presentation/routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ButtonContainer(
          child: const Text("Go Profile "),
          onPress: () {
            Navigator.of(context).pushNamed(Routes.profile);
          },
        ),
      ),
    );
  }
}
