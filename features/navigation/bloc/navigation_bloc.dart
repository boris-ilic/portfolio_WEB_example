import 'package:boris_ilic_portfolio/repositories/navigation_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBloc extends Cubit<int> {
  final NavigationRepostory _navigationRepostory;
  NavigationBloc(this._navigationRepostory) : super(0);

  void changeTabIndex(int currentTabIndex, BuildContext _) {
    _navigationRepostory.goToScreenFromMenu(currentTabIndex, _);
    emit(currentTabIndex);
  }
}
