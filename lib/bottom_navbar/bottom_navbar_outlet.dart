import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bottom_nav_bar_bloc.dart';
import 'bottom_navbar_view.dart';



Widget navBarOutlet() {
  return BlocProvider(
    create: (context) => BottomNavBarBloc(),
    child: const LiveScoreBottomNavbar(),
  );
}
