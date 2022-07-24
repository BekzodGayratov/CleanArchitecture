import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newarchitecture/bloc/home/home_cubit.dart';
import 'package:newarchitecture/bloc/home/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) => _scaffold(context));
  }

  Scaffold _scaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(),
    );
  }
}
