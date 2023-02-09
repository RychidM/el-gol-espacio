import 'package:equatable/equatable.dart';

abstract class BottomNavBarEvent extends Equatable {
  const BottomNavBarEvent();

  @override
  List<Object> get props => [];
}

class BottomBarIconClicked extends BottomNavBarEvent {
  final int index;

  const BottomBarIconClicked({required this.index});

  @override
  List<Object> get props => [index];
}
