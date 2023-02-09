import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livescore/bottom_navbar/bloc/BottomNavBar_bloc.dart';

import 'bottom_navbar_view.dart';



Widget navBarOutlet() {
  return BlocProvider(
    create: (context) => BottomNavBarBloc(),
    child: const LiveScoreBottomNavbar(),
  );
}
