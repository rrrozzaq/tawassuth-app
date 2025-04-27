import 'package:flutter_bloc/flutter_bloc.dart';

class UserDataState {
  final double latitude;
  final double longitude;
  final String address;

  const UserDataState({
    required this.latitude,
    required this.longitude,
    required this.address,
  });
}

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit()
    : super(const UserDataState(latitude: 0, longitude: 0, address: ''));

  void setLocation(double lat, double lng, String address) {
    emit(UserDataState(latitude: lat, longitude: lng, address: address));
  }
}
