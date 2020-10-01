import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gist_newAndLast/service/api_gist.dart';
import 'package:gist_newAndLast/viewmodel/gits_bloc/gits_bloc.dart';

class GistModelBloc extends Bloc<GistModelEvent, GistModelState> {
  GistModelBloc() : super(GistModelInitial());

  @override
  Stream<GistModelState> mapEventToState(
    GistModelEvent event,
  ) async* {
    if (event is GetEvent) {
      yield GistRetrieve(await getHttp());
    }

    
  }
}
