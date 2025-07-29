import 'package:equatable/equatable.dart';

abstract class TabBarState extends Equatable {
  @override
  List<Object> get props => [];
}

class TabChangedState extends TabBarState {
  final int selectedIndex;
  TabChangedState(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
