import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/di.dart';
import '../bloc/home_cubit.dart';
import '../bloc/home_state.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final myBloc = getIt.get<HomeCubit>();

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
          body: BlocBuilder<HomeCubit, HomeState>(
            builder: (BuildContext context, HomeState state) {
              if(state.isLoading){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ScaffoldMessenger(
                child: Text(
                  state.isFailure ? 'Failed' : 'Success',
                )
              );
            },
          )
      ),
    );
  }
}
