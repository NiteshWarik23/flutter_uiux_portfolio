import 'package:equatable/equatable.dart';

abstract class TabBarEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TabChangedEvent extends TabBarEvent {
  final int index;
  TabChangedEvent(this.index);

  @override
  List<Object> get props => [index];
}
