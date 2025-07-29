import 'package:get_it/get_it.dart';
import 'package:my_portfolio/modules/about_me/presentation/bloc/tabbar_bloc/tab_bloc.dart';

final locator = GetIt.instance;

void init() {
// TabBar
//Bloc
  locator.registerFactory<TabBarBloc>(() => TabBarBloc());
}
