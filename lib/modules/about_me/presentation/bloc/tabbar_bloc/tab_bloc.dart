import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/modules/about_me/presentation/bloc/tabbar_bloc/tab_event.dart';
import 'package:my_portfolio/modules/about_me/presentation/bloc/tabbar_bloc/tab_state.dart';

class TabBarBloc extends Bloc<TabBarEvent, TabBarState> {
  TabBarBloc() : super(TabChangedState(0)) {
    on<TabChangedEvent>(onTabChanged);
  }

  void onTabChanged(TabChangedEvent event, Emitter<TabBarState> emit) {
    emit(TabChangedState(event.index));
  }
}
