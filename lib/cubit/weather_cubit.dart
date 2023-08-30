// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState { connected, disconnected, initial }

class InternetCubit extends Cubit<InternetState> {
  Connectivity connectivity = Connectivity();

  StreamSubscription? connectivitySubscription;

  InternetCubit() : super(InternetState.initial) {
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetState.connected);
      } else {
        emit(InternetState.disconnected);
      }
    });
  }
  @override
  Future<void> close() {
    return super.close();
  }
}
