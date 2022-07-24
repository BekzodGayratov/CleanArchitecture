import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newarchitecture/bloc/home/home_cubit.dart';
import 'package:newarchitecture/routes/router.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HomeCubit())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.router.onGenerate,
    );
  }
}
