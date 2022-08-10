part of 'internet_cubit.dart';

class InternetState {}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectivityType connectivityType;
  InternetConnected({required this.connectivityType});
}

class InternetDisconnected extends InternetState {}

enum ConnectivityType { wifi, mobile }
