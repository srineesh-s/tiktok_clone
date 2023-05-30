import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/screens/home_screen.dart';
import 'package:tiktok_clone/screens/tiktok_screen/bloc/tik_tok_bloc_bloc.dart';
import 'package:tiktok_clone/screens/tiktok_screen/repository/tiktok_repository.dart';
import 'package:tiktok_clone/services/api_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TikTokBlocBloc>(
      create: (context) => TikTokBlocBloc(TikTokSectionRepository(ApiClient()))
        ..add(FollowingSectionEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
