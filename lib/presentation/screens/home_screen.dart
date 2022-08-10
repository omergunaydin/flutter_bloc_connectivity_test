import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_connectivity_test/logic/cubit/internet_cubit.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Internet Connectivity'),
      ),
      body: Center(
        child: BlocBuilder<InternetCubit, InternetState>(
          builder: (context, state) {
            if (state is InternetConnected && state.connectivityType == ConnectivityType.wifi) {
              return const Text('Wifi Connected');
            } else if (state is InternetConnected && state.connectivityType == ConnectivityType.mobile) {
              return const Text('Mobile Connected');
            } else if (state is InternetDisconnected) {
              return const Text('Disconnected');
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
