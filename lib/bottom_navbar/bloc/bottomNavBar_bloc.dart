import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'bottom_navbar_event.dart';
import 'bottom_navbar_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  BottomNavBarBloc() : super(const BottomNavBarState()) {
    on<BottomBarIconClicked>(_onBottomBarClicked);
  }

  FutureOr<void> _onBottomBarClicked(
      BottomBarIconClicked event, Emitter<BottomNavBarState> emit) {
    emit(state.copyWith(selectedIndex: event.index));
  }
}
