import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/domain/entities/person_entity.dart';
import 'package:flutter_clean_architecture/presentation/feature/home/pages/bloc/home_bloc.dart';

import '../../../blocs/bloc_state.dart';
import '../../../di/di.dart';


@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final myBloc = getIt.get<HomeBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => myBloc..createPerson(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
          body: BlocBuilder<HomeBloc, BlocState<PersonEntity>>(
            builder: (context, state) {
              if (state.status == Status.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.status == Status.success) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Name: ${state.data!.name}'),
                      Text('Age: ${state.data!.age}'),
                      Text('Address: ${state.data!.address}'),
                    ],
                  ),
                );
              } else if (state.status == Status.error) {
                return Center(
                  child: Text(state.msg),

                );
              } else {
                return const Center(
                  child: Text('Welcome'),
                );
              }
            },
          )
      ),
    );
  }
}
