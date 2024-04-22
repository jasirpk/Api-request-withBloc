import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:public_api_bloc/bloc/logic_bloc.dart';

class PostPage extends StatelessWidget {
  final LogicBloc logicBloc = LogicBloc();

  @override
  Widget build(BuildContext context) {
    logicBloc.add(PostInitialFetchEvent());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          logicBloc.add(PostAddEvent());
        },
        backgroundColor: Colors.purple,
        shape: CircleBorder(),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text(
          'Posts',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocConsumer<LogicBloc, LogicState>(
        bloc: logicBloc,
        listenWhen: (previous, current) => current is PostActionState,
        buildWhen: (previous, current) => !(current is PostActionState),
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case PostFetchingLoadingState:
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.purple,
                ),
              );
            case PostFetchingSuccessfullState:
              final successState = state as PostFetchingSuccessfullState;
              return Container(
                child: ListView.builder(
                  itemCount: successState.posts.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.blueGrey.shade100,
                      margin: EdgeInsets.all(16),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(successState.posts[index].title),
                            Text(successState.posts[index].body),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
