import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/feature/home/domain/use_case/person_create_use_case.dart';

import '../../../di/di.dart';
import '../domain/entities/person_entity.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final createUseCase = getIt<PersonCreateUseCase>();

  @override
  void initState() {
    createUseCase(PersonCreateInput(payload: const PersonEntity(name: 'John Doe', age: 30, address: 'Jakarta')))
      .then((value) {
        print(value.response.data?.name);
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('Home'),
      )
    );
  }
}
