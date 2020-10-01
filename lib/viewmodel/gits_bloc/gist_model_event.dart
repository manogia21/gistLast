import 'package:equatable/equatable.dart';

abstract class GistModelEvent extends Equatable {
  const GistModelEvent();
}

class GetEvent extends GistModelEvent {
  @override
  List<Object> get props => [];
}
