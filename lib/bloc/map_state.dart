part of 'map_bloc.dart';

class MapErrorState extends MapState {
  final String message;

  MapErrorState({required this.message});
}

class MapInitial extends MapState {}

class MapLoadedState extends MapState {
  double latitude;
  double longitude;
  String locality;
  String postalCode;
  String country;

  MapLoadedState(
      {required this.latitude,
      required this.longitude,
      required this.locality,
      required this.postalCode,
      required this.country});
}

class MapLoadingState extends MapState {}

@immutable
abstract class MapState {}
