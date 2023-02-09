import 'package:equatable/equatable.dart';

class BottomNavBarState extends Equatable {
  final int selectedIndex;

  const BottomNavBarState({this.selectedIndex = 0});

  BottomNavBarState copyWith({
    int? selectedIndex,
  }) {
    return BottomNavBarState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object?> get props => [selectedIndex];
}
