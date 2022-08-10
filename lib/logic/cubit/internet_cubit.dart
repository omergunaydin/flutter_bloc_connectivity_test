import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription? connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    connectivityStreamSubscription = connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi) {
        emit(InternetConnected(connectivityType: ConnectivityType.wifi));
      } else if (connectivityResult == ConnectivityResult.mobile) {
        emit(InternetConnected(connectivityType: ConnectivityType.mobile));
      } else if (connectivityResult == ConnectivityResult.none) {
        emit(InternetDisconnected());
      }
    });
  }
}
