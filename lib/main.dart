import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:public_api_bloc/bloc/logic_bloc.dart';
import 'package:public_api_bloc/screens/posts_page.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => LogicBloc(),
    child: PUblicApi(),
  ));
}

class PUblicApi extends StatelessWidget {
  const PUblicApi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostPage(),
    );
  }
}
