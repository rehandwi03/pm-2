import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapInitial()) {
    on<GetCurrentLocation>((event, emit) async {
      emit(MapLoadingState());
      bool serviceEnabled;
      LocationPermission permission;
      serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        emit(MapErrorState(message: "location services are disabled"));
      }

      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          emit(MapErrorState(message: "Location permission denied"));
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(MapErrorState(
            message: "Location permissions are permanently denied"));
      }

      Position position = await Geolocator.getCurrentPosition();

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];

      emit(MapLoadedState(
          latitude: position.latitude,
          longitude: position.longitude,
          locality: place.locality ?? "",
          postalCode: place.postalCode ?? "",
          country: place.country ?? ""));
    });
  }
}
