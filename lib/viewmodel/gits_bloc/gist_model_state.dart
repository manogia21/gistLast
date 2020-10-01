import 'package:equatable/equatable.dart';
import 'package:gist_newAndLast/model/gist.dart';

abstract class GistModelState extends Equatable {
  const GistModelState();
}

class GistModelInitial extends GistModelState {
  @override
  List<Object> get props => [];
}

class GistRetrieve extends GistModelState {
  final List<GistData> gistLIst;
  GistRetrieve(this.gistLIst);
  @override
  List<Object> get props => [gistLIst];
}
