import 'package:flutter/material.dart';
import 'package:public_api_bloc/screens/posts_page.dart';

void main() {
  runApp(PUblicApi());
}

class PUblicApi extends StatelessWidget {
  const PUblicApi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostPage(
          // logicBloc: LogicBloc(),
          ),
    );
  }
}
