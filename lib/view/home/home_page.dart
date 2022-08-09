import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newarchitecture/bloc/home/home_cubit.dart';
import 'package:newarchitecture/bloc/home/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) => _scaffold(context, state));
  }

  Scaffold _scaffold(BuildContext context, HomeState state) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: context.read<HomeCubit>().getCurrency(),
        builder: (context, AsyncSnapshot snapshot) {
          if (state is HomeLoadingState || state is HomeInitialState) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is HomeErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return ListView.builder(itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Text(
                      (state as HomeCompleteState).data[index].code.toString()),
                  title: Text(state.data[index].cbPrice.toString()),
                ),
              );
            });
          }
        },
      ),
    );
  }
}
