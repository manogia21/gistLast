import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gist_newAndLast/service_locator.dart';

import 'view/homew_view.dart';
import 'viewmodel/gits_bloc/gits_bloc.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final bloc = GistModelBloc();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          body: BlocProvider(create: (context) => bloc, child: WidgetView()),
        ));
  }
}

class WidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isOpen = true;
    return BlocBuilder(
        cubit: BlocProvider.of<GistModelBloc>(context),
        builder: (context, GistModelState state) {
          if (state is GistModelInitial) {
            if (isOpen) {
              BlocProvider.of<GistModelBloc>(context).add(GetEvent());
              isOpen = false;
            }
            return Center(child: CircularProgressIndicator());
          } else if (state is GistRetrieve) {
            return HomeView(
              gistLIst: state.gistLIst,
            );
          }
          return Container();
        });
  }
}
